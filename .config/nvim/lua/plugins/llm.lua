return {
    "Kurama622/llm.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "MunifTanjim/nui.nvim" },
    cmd = { "LLMSessionToggle", "LLMSelectedTextHandler", "LLMAppHandler" },
    enabled = false,
    lazy = true,
    config = function()
        local tools = require("llm.tools")
        require("llm").setup({
            model = "qwen2.5-coder:7b",
            api_type = "ollama",
            url = "http://localhost:11434/api/chat",
            enable_thinking = false,
            timeout = 90,
            max_tokens = 10000,
            app_handler = {
                Completion = {
                    handler = tools.completion_handler,
                    opts = {
                        model = "qwen2.5-coder:7b",
                        api_type = "ollama",
                        url = "http://localhost:11434/v1/completions",
                        style = "virtual_text",
                        n_completions = 3,
                        context_window = 512,
                        max_tokens = 256,
                        filetypes = { sh = false },
                        default_filetype_enabled = true,
                        auto_trigger = true,
                        -- only_trigger_by_keywords = true,
                        timeout = 30,
                        throttle = 400,
                        debounce = 200,
                        keymap = {
                            virtual_text = {
                                accept = {
                                    mode = "i",
                                    keys = "<C-y>",
                                },
                                next = {
                                    mode = "i",
                                    keys = "<A-n>",
                                },
                                prev = {
                                    mode = "i",
                                    keys = "<A-p>",
                                },
                                toggle = {
                                    mode = "n",
                                    keys = "<leader>cp",
                                },
                            },
                        },
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


--[[

https://github.com/Kurama622/llm.nvim/tree/main/examples/ai-tools
https://github.com/Kurama622/llm.nvim/issues/32
https://github.com/Kurama622/llm.nvim/blob/main/examples/ai-tools/Code-Completions/config.lua
https://github.com/Kurama622/llm.nvim/issues/73


This works:
curl http://localhost:11434/api/generate -d '{
    "model": "qwen2.5-coder:7b",
    "prompt": "Why is the sky blue?"
}'


Works
curl -X POST http://localhost:11434/v1/completions -H "Content-Type: application/json" -d '{
    "model": "qwen2.5-coder:7b",
    "prompt": "function add(a, b) {",
        "max_tokens": 100,
        "n_completions": 1
    }'


    - float	Input:Submit	Submit your question	[i] ctrl+g	Input
    - float	Input:Cancel	Cancel dialog response	[i] ctrl+c	Input
    - float	Input:Resend	Rerespond to the dialog	[i] ctrl+r	Input
    - float	Input:HistoryNext	Select the next session history	[i] ctrl+j	Input
    - float	Input:HistoryPrev	Select the previous session history	[i] ctrl+k


    ]]--
