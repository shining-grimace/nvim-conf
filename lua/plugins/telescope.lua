return {
    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.5',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            local builtin = require("telescope.builtin")
            local function telescope_closes_neotree(telescope_func)
                return function(...)
                    vim.cmd("Neotree close")
                    telescope_func(...)
                end
            end
            vim.keymap.set('n', '<leader>sf',
                telescope_closes_neotree(builtin.find_files), {})
            vim.keymap.set('n', '<leader>sg',
                telescope_closes_neotree(builtin.live_grep), {})
        end
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown {
                        }
                    }
                }
            })
            require("telescope").load_extension("ui-select")
        end
    }
}
