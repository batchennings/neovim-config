return {
    "olimorris/codecompanion.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-treesitter/nvim-treesitter"
    },
    config = function()
        require("codecompanion").setup({
            adapters = {
                ollama = function()
                    return require("codecompanion.adapters").extend("ollama", {
                        schema = {
                            model = {
                                default = "llama3.2"
                            }
                        },
                    })
                end,
            },
            strategies = {
                chat = {
                    adapter = "ollama",
                },
                inline = {
                    adapter = "ollama",
                },
                cmd = {
                    adapter = "ollama",
                }
            }
        })
    end
}
