return {
    {
        "luk400/vim-jukit",
        enabled = false,
        lazy = true,
        config = function()
            vim.g.jukit_shell_cmd = "R"
            vim.g.python3_host_prog = "/home/thadryan/miniconda3/envs/jukit/bin/python"
        end

    }
}
