return {
    "Kurama622/llm.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim"},
    cmd = { "LLMSessionToggle", "LLMSelectedTextHandler", "LLMAppHandler" },
    config = function()
        require("llm").setup({
            url = "http://127.0.0.1:11434/api/chat",
            model = "qwen3:4b",
            enable_thinking = true,
            api_type = "ollama"
        })
    end,
    keys = {
        { "<leader>ac", mode = "n", "<cmd>LLMSessionToggle<cr>" },
    },
}
-- float	Input:Submit	Submit your question	[i] ctrl+g	Input
-- float	Input:Cancel	Cancel dialog response	[i] ctrl+c	Input
-- float	Input:Resend	Rerespond to the dialog	[i] ctrl+r	Input
-- float	Input:HistoryNext	Select the next session history	[i] ctrl+j	Input
-- float	Input:HistoryPrev	Select the previous session history	[i] ctrl+k
-- https://github.com/Kurama622/llm.nvim/blob/main/examples/chat/ollama/config.lua
-- https://github.com/Kurama622/llm.nvim/blob/main/examples/ai-tools/Code-Completions/config.lua

