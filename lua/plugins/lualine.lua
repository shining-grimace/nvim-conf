return {
    'nvim-lualine/lualine.nvim',
    config = function()
        local rust_status = require("utils.rust_status")
        require('lualine').setup({
            options = {
                theme = "dracula"
            },
            sections = {
                lualine_c = { -- Default is just filename in this section
                    { rust_status.get, cond = function() return rust_status.get() ~= "" end },
                    'filename'
                }
            }
        })
    end
}
