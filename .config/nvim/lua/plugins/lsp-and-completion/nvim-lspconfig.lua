return {
    {
        "neovim/nvim-lspconfig",
        config = function()

            local lspconfig = require('lspconfig')
            local coq = require('coq')

            -- lspconfig.gopls.setup(coq.lsp_ensure_capabilities({
            --     autostart = false
            -- }))
            lspconfig.r_language_server.setup(coq.lsp_ensure_capabilities({
                autostart = false
            }))
            lspconfig.pyright.setup(coq.lsp_ensure_capabilities({
                autostart = false
            }))
            -- lspconfig.clangd.setup(coq.lsp_ensure_capabilities({
            --     autostart = false
            -- }))
            lspconfig.ltex.setup(coq.lsp_ensure_capabilities({
                use_spellfile = true,
                autostart = false
            }))
            lspconfig.julials.setup(coq.lsp_ensure_capabilities({
                autostart = false
            }))

            lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities({
                autostart = false
            }))

            lspconfig.rust_analyzer.setup(coq.lsp_ensure_capabilities({
                autostart = false
            }))
            -- lspconfig.nimls.setup(coq.lsp_ensure_capabilities({
            --     autostart = false
            -- }))
            -- lspconfig.kotlin_language_server.setup(coq.lsp_ensure_capabilities({
            --     autostart = false
            -- }))
        end
    }
}
