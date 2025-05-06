#!/bin/bash

sync_project() {
  local target=$1

  if [ -z "$target" ]; then
    echo "Error: Please specify a target (build, notebooks, outputs, log, or all)"
    return 1
  fi

  local project_dir="/mnt/Workspace/oud-predictors-ml"
  local target_dir="oud-predictors-ml"

  # Create the target directory in ~/Temp
  mkdir -p ~/Temp/$target_dir

  # Handle target types: build, notebooks, outputs, log, all
  case "$target" in
    build)
      rm -rf ~/Temp/$target_dir/build
      cp -r "$project_dir/build" ~/Temp/$target_dir/build
      ;;
    notebooks)
      mkdir -p ~/Temp/$target_dir/notebooks
      cp "$project_dir"/*.ipynb ~/Temp/$target_dir/notebooks/
      ;;
    outputs)
      rm -rf ~/Temp/$target_dir/outputs
      cp -r "$project_dir/outputs" ~/Temp/$target_dir/outputs
      ;;
    log)
      tail -n 10 "$project_dir/_log.out"
      ;;
    all)
      sync_project build
      sync_project notebooks
      sync_project outputs
      ;;
    *)
      echo "Error: Invalid target '$target' (must be: build, notebooks, outputs, log, or all)"
      return 1
      ;;
  esac
}

sync_project $1
