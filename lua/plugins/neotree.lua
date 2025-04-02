return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = false,
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim"
    },
    config = function()
        require('neo-tree').setup({
            event_handlers = {
                {
                    event = "file_opened",
                    handler = function()
                        require("neo-tree.command").execute({ action = "close" })
                    end
                }
            },
            filesystem = {
                filtered_items = {
                    visible = true,
                    hide_dotfiles = false,
                    hide_gitignored = true
                }
            },
            hijack_netrw_behavior = 'open_default'
        })
        vim.keymap.set('n', '<C-n>', ':Neotree filesystem reveal left<CR>', {})
    end
}
