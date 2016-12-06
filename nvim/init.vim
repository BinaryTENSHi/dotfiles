if &compatible
  set nocompatible
endif

call plug#begin('~/.config/nvim/plugins')

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'fishbullet/deoplete-ruby'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neomake/neomake'

call plug#end()

filetype plugin indent on

" Syntax / Codestyle
syntax enable
set tabstop=2
set shiftwidth=2
set expandtab

set number
set nowrap
set showcmd
set showmatch
set showmode

" Natural splits
set splitbelow
set splitright

" Ignore case in search
set ignorecase

" Show 'invisible' characters
set lcs=tab:▸\ ,trail:·,nbsp:_
set list

" Highlight searches
set hlsearch

" Highlight search pattern while typing
set incsearch

" Don't reset cursor
set nostartofline

" Show filename in titlebar
set title

" Start scrolling 3 lines / 10 cols before border
set scrolloff=3
set sidescroll=1
set sidescrolloff=10

" Always show airline
set laststatus=2
let g:airline_theme='luna'
let g:airline_powerline_fonts=1

" Set leader to space
let mapleader="\<Space>"

" Set blazing fast shortcuts
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" Simpler window switching
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Simpler window resizing
nnoremap <C-Up> <C-W>-
nnoremap <C-Down> <C-W>+
nnoremap <C-Left> <C-W><
nnoremap <C-Right> <C-W>>

" Invoke Neomake on save
autocmd! BufWritePost * Neomake

" Custom ignore for ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|git'

