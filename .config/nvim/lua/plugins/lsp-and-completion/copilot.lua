return {
    {
        "github/copilot.vim",
        enabled = true,
        config = function()
            vim.api.nvim_set_keymap("i", "<C-l>", 'copilot#Accept("")', {expr=true, noremap=true, script=true})
            -- how does this not work :(
            -- require("copilot").setup({
            --     autostart = false
            -- })
        end
    }
}
