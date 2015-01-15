"NeoBundle Scripts-----------------------------
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Allow project specific defaults
if filereadable(".vim.custom")
  so .vim.custom
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" Add or remove your Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'flazz/vim-colorschemes'
NeoBundle 'bling/vim-airline'

" You can specify revision/branch/tag.
NeoBundle 'Shougo/vimshell'

" Required:
call neobundle#end()

set encoding=utf-8

" Required:
filetype plugin indent on

" Syntax and codestyle
syntax on
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set relativenumber

" always show airline
set laststatus=2
let g:airline_theme='luna'
let g:airline_powerline_fonts=1

" All temporary files in ~/tmp
set swapfile
set dir=~/tmp
set backupdir=~/tmp

" Keybinds:
let g:ctrlp_map = "<c-p>"
let g:ctrlp_cmd = "CtrlP"

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"End NeoBundle Scripts-------------------------
