return{
    'akinsho/bufferline.nvim', version = "*", dependencies = 'nvim-tree/nvim-web-devicons',
    config = function ()
        require("bufferline").setup({
            options = {
                mode = "tabs",
                separator_style = 'slant',
                always_show_bufferline = false,
                numbers = function(opts)
                    return string.format('%s|%s', opts.id, opts.raise(opts.ordinal))
                end,
                show_buffer_close_icons = false,
                show_close_icon = true,
                color_icons = true
            },
            highlights = {
                separator = {
                    guifg = '#073642',
                    guibg = '#002b36',
                },
                separator_selected = {
                    guifg = '#073642',
                },
                background = {
                    guifg = '#657b83',
                    guibg = '#002b36'
                },
                buffer_selected = {
                    guifg = '#fdf6e3',
                    gui = "bold",
                },
                fill = {
                    guibg = '#073642'
                }
            },
        })
    end
}
