return {
    "Kurama622/llm.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim"},
    cmd = { "LLMSessionToggle", "LLMSelectedTextHandler", "LLMAppHandler" },
    enabled = true,
    config = function()
        local tools = require("llm.tools")
        require("llm").setup({
            model = "codegemma:latest",
            api_type = "ollama",
            url = "http://127.0.0.1:11434/api/chat",
            -- https://github.com/Kurama622/llm.nvim/issues/52
            enable_thinking = false,
            timeout = 90,
            max_tokens = 10000,
            app_handler = {
                Completion = {
                    handler = tools.completion_handler,
                    opts = {
                        model = "codegemma:latest",
                        api_type = "ollama",
                        url = "http://127.0.0.1:11434/api/generate",
                      -- timeout = 10,

                      -- context_window = 12800,
                      -- context_ratio = 0.75,
                      -- throttle = 400,
                      -- debounce = 200,
                      -- filetypes = {},
                      -- default_filetype_enabled = true,
                      -- auto_trigger = true,
                      -- only_trigger_by_keywords = true,
                      -- style = "virtual_text",
                      -- keymap = {
                      --   virtual_text = {
                      --     accept = {
                      --       mode = "i",
                      --       keys = "<A-a>",
                      --     },
                      --     next = {
                      --       mode = "i",
                      --       keys = "<A-n>",
                      --     },
                      --     prev = {
                      --       mode = "i",
                      --       keys = "<A-p>",
                      --     },
                      --   },
                      --   toggle = {
                      --     mode = "n",
                      --     keys = "<leader>cp",
                      --   },

                      },
                    },
                },
        })
    end,
    keys = {
      { "<leader>ac", mode = "n", "<cmd>LLMSessionToggle<cr>", desc = "Toggle LLM Session" },
      {
        "<leader>ae",
        mode = "v",
        "<cmd>LLMSelectedTextHandler Explain this code:<cr>",
        desc = "Explain selected code",
      },
    },
}


-- print("hello word")

-- I can't get completion to work
-- https://github.com/Kurama622/llm.nvim/tree/main/examples/ai-tools

-- https://github.com/Kurama622/llm.nvim/issues/32
-- https://github.com/Kurama622/llm.nvim/blob/main/examples/chat/ollama/config.lua
-- https://github.com/Kurama622/llm.nvim/blob/main/examples/ai-tools/Code-Completions/config.lua
-- this works
-- ~:) curl -X POST http://localhost:11434/v1/completions -H "Content-Type: application/json" -d '{
--     "model": "qwen3:4b",
--     "prompt": "function add(a, b) {",
--     "max_tokens": 100,
--     "n_completions": 1
-- }'

-- https://github.com/Kurama622/llm.nvim/issues/73

-- float	Input:Submit	Submit your question	[i] ctrl+g	Input
-- float	Input:Cancel	Cancel dialog response	[i] ctrl+c	Input
-- float	Input:Resend	Rerespond to the dialog	[i] ctrl+r	Input
-- float	Input:HistoryNext	Select the next session history	[i] ctrl+j	Input
-- float	Input:HistoryPrev	Select the previous session history	[i] ctrl+k
