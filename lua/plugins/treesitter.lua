return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        local config = require("nvim-treesitter.configs")
        config.setup({
            ensure_installed = {
                "lua",
                "rust",
                "wgsl",
                "ron",
                "bash",
                "toml",
                "html",
                "css",
                "javascript",
                "typescript",
                "json",
                "yaml"
            },
            highlight = { enable = true },
            indent = { enable = true }
        })
    end
}
