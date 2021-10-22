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
function nnoremap(short, action)
  vim.api.nvim_set_keymap('n', short, action, { noremap = true, silent = true })
end

-- Fast shortcuts
nnoremap('<Leader>o', ':Telescope find_files<CR>')
nnoremap('<Leader>w', ':w<CR>')
nnoremap('<Leader>q', ':q<CR>')

-- Simpler window switching
nnoremap('<C-J>', '<C-W><C-J>')
nnoremap('<C-K>', '<C-W><C-K>')
nnoremap('<C-L>', '<C-W><C-L>')
nnoremap('<C-H>', '<C-W><C-H>')

-- Simpler window resizing
nnoremap('<C-Up>', '<C-W>-')
nnoremap('<C-Down>', '<C-W>+')
nnoremap('<C-Left>', '<C-W><')
nnoremap('<C-Right>', '<C-W>>')
