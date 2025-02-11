
-- CREDITS
-- TJ DeVries
-- Typecraft

-- Basic configuration
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.g.have_nerd_font = true

-- Preferences
-- Run `:help option` for info on any of these
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.mouse = 'a'
vim.opt.showmode = false
vim.opt.inccommand = 'split'
vim.opt.scrolloff = 8
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

-- Clipboard: share with OS, set after UiEnter to help startup time
vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)

-- Keymaps: clear search highlights, diagnostics, exit terminal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Window keymaps
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move fox=cus to the left window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move fox=cus to the bottom window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move fox=cus to the lower window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move fox=cus to the upper window' })

-- Flash text being yanked
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
