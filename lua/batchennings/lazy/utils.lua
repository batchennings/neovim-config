return{
    {'windwp/nvim-autopairs', name="autopairs"},
    {'windwp/nvim-ts-autotag', name="ts-autotag"},
    {'MunifTanjim/prettier.nvim'},
    config = function()
        require("autotag").setup({
            -- config
        })

        require("autopairs").setup({
            disable_filetype = { "TelescopePrompt" , "vim" },
        })
    end
}
