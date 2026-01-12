
return {
    "github/copilot.vim",
    dependencies = {}
    -- config = function()
    --     require("copilot").setup({
    --         adapters = {
    --             http = {
    --                 ollama = function()
    --                     return require("codecompanion.adapters").extend("ollama", {
    --                         schema = {
    --                             model = {
    --                                 default = "llama3.2"
    --                             }
    --                         },
    --                     })
    --                 end,
    --             },
    --         },
    --         strategies = {
    --             chat = {
    --                 adapter = "ollama",
    --             },
    --             inline = {
    --                 adapter = "ollama",
    --             },
    --             cmd = {
    --                 adapter = "ollama",
    --             }
    --         }
    --     })
    -- end
}
