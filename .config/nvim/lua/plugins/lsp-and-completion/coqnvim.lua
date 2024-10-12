return {
    {
        "ms-jpq/coq_nvim",
        lazy = true,
        -- I can't figure out how to do this to get the error to go away,
        -- https://github.com/ms-jpq/coq_nvim/issues/411, so I just use the work around for now
        config = function()
            require("coq")
            vim.cmd("COQnow --shut-up")
        end
    }
}
