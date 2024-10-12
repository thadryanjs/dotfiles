return {
    {
        "ms-jpq/coq_nvim",
        lazy = true,
        config = function()

            require("coq")
            vim.g.coq_settings = {}
            vim.cmd("COQnow --shut-up")

        end
    }
}
