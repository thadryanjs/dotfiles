return {
    {
        "arnarg/todotxt.nvim",
        config = function()
            require('todotxt-nvim').setup({
            	todo_file = "~/WorkVault/todo.txt",
                -- why doesn't this work
                highlights = {
                  project = {
                    fg = "magenta",
                    bg = "NONE",
                    style = "NONE",
                  },
                  context = {
                    fg = "cyan",
                    bg = "NONE",
                    style = "NONE",
                  },
                  date = {
                    fg = "NONE",
                    bg = "NONE",
                    style = "underline",
                  },
                  done_task = {
                    fg = "gray",
                    bg = "NONE",
                    style = "NONE",
                  },
                  priorities = {
                    A = {
                      fg = "red",
                      bg = "NONE",
                      style = "bold",
                    },
                    B = {
                      fg = "magenta",
                      bg = "NONE",
                      style = "bold",
                    },
                    C = {
                      fg = "yellow",
                      bg = "NONE",
                      style = "bold",
                    },
                    D = {
                      fg = "cyan",
                      bg = "NONE",
                      style = "bold",
                    },
                  },
                },
            })

        end

    }
}
