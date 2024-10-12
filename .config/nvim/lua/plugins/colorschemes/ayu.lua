return {
    {
        "Shatur/neovim-ayu",
        config = function()
            require('ayu').setup({
                overrides = {
                    Normal = {bg = "None"}
                }
            })
        end,
    }
}
