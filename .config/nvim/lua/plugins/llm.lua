return {
    "Kurama622/llm.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim"},
    cmd = { "LLMSessionToggle", "LLMSelectedTextHandler", "LLMAppHandler" },
    config = function()
        require("llm").setup({
            -- do I need this if I'm usuing local?
            url = "http://127.0.0.1:11434/api/chat",
            model = "deepseek-r1:latest",
            enable_thinking = false,
            api_type = "ollama"
        })
    end,
    keys = {
        { "<leader>ac", mode = "n", "<cmd>LLMSessionToggle<cr>" },
    },
}
