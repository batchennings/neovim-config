return {
    "ahmedkhalf/project.nvim",
    config = function()
        require("project_nvim").setup {
            patterns = { ".git", "Makefile", "package.json" },
        }
        require('telescope').load_extension('projects')
        require("nvim-tree").setup({
            sync_root_with_cwd = true,
            respect_buf_cwd = true,
            update_focused_file = {
                enable = true,
                update_root = true
            },
        })
    end
}
