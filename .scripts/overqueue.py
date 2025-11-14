# https://chat.dartmouth.edu/c/d774009f-ed26-4771-84b8-847afa767fbe
import os
import re
import sys

IGNORE_DIRS = {'.git', '.pixi', '_build', 'node_modules', "Archive"}

# Regex to find lines starting with optional whitespace, optional comment, then '- [ ]'
TASK_PATTERN = re.compile(r'^\s*(#\s*)?-\s*\[\s\]\s+', re.IGNORECASE)

def extract_all_tasks(md_path, debug=False):
    """
    Extract all lines starting with unchecked task '- [ ]', possibly commented,
    preserving indentation and nestedness.
    """
    with open(md_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()

    task_lines = []
    for i, line in enumerate(lines):
        if TASK_PATTERN.match(line):
            task_lines.append(line.rstrip('\n'))
            if debug:
                print(f"{md_path}: captured task line {i+1}: {line.rstrip()}")
    return task_lines

def main(vault_path, debug=False):
    root_queue_path = os.path.join(vault_path, 'queue.md')
    queues = {}

    for root, dirs, files in os.walk(vault_path):
        # Filter out ignored and hidden dirs
        dirs[:] = [d for d in dirs if d not in IGNORE_DIRS and not d.startswith('.')]

        for md_file in files:
            if not md_file.endswith('.md'):
                continue
            md_path = os.path.join(root, md_file)
            # Skip only the root-level queue.md (where the script runs)
            if os.path.abspath(md_path) == os.path.abspath(root_queue_path):
                if debug:
                    print(f"Skipping root queue.md at {md_path}")
                continue

            task_lines = extract_all_tasks(md_path, debug)
            if task_lines:
                rel_path = os.path.relpath(md_path, vault_path)
                rel_path_unix = rel_path.replace(os.sep, '/')
                project_key = rel_path_unix

                if project_key not in queues:
                    queues[project_key] = {
                        'task_lines': [],
                        'file_path': md_path,
                    }
                queues[project_key]['task_lines'].extend(task_lines)

    output_path = root_queue_path
    with open(output_path, 'w', encoding='utf-8') as out_f:
        out_f.write("<!--\n")
        out_f.write("  NOTE: This file is an overview of unchecked tasks across the vault.\n")
        out_f.write("  Editing or checking tasks here DOES NOT update original files.\n")
        out_f.write("  To manage tasks, please edit them directly in their source files.\n")
        out_f.write("-->\n\n")

        out_f.write("# Work Queue\n\n")
        for project in sorted(queues.keys()):
            file_path = queues[project]['file_path']
            task_lines = queues[project]['task_lines']
            out_f.write(f"## {project}\n")
            out_f.write(f"[[/{project}|Project Home]]\n\n")
            for line in task_lines:
                out_f.write(f"{line}\n")
            out_f.write("\n")

    print(f"Queue file written to {output_path}")

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("Usage: python make_queue.py /path/to/vault [--debug]")
        sys.exit(1)
    vault_root = sys.argv[1]
    debug_flag = '--debug' in sys.argv
    if not os.path.isdir(vault_root):
        print(f"Provided path {vault_root} is not a directory.")
        sys.exit(1)
    main(vault_root, debug=debug_flag)
