-- Map Leader to Space
vim.g.mapleader = ' '

-- Settings
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.wrap = false
vim.opt.showcmd = true
vim.opt.showmatch = true
vim.opt.showmode = true

---- Natural splits
vim.opt.splitbelow = true
vim.opt.splitright = true

---- Titlebar filename
vim.opt.title = true

---- Scrolling
vim.opt.scrolloff = 3
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 10

---- Show invisible characters
vim.opt.list = true
vim.opt.listchars = {
  tab = '▸·',
  trail = '·',
  nbsp = '_',
}

-- Auto install packer.nvim if not exists
local install_path = vim.fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.api.nvim_command('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd 'packadd packer.nvim'
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- Plugins
require('plugins')

-- Shortcuts
vim.api.nvim_set_keymap('n', '<Leader>o', ':Telescope find_files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>q', ':q<CR>', { noremap = true, silent = true })

