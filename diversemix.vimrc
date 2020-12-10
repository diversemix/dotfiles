set nocompatible              " be iMproved, required
filetype off                  " required

source ~/dotfiles/vim/disable-arrows.vim
source ~/dotfiles/vim/windows.vim
source ~/dotfiles/vim/leader.vim
source ~/dotfiles/vim/plugins.vim
source ~/dotfiles/vim/coc.vim

inoremap jj <Esc>
set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
colorscheme gruvbox     " set colorscheme
set background=dark       " set the colorscheme (https://github.com/morhetz/gruvbox/wiki/Usage)
set rnu                   " show line numbers
set nu
set cursorline
set laststatus=2          " last window always has a statusline
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ruler                 " Always show info along bottom.
set autoindent            " auto-indent
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set wrap                  " don't wrap text
"set shortmess=at          " Don't display standard message
set autowrite             " save buffers when going hidden
"   set hls
set mouse=a
set clipboard=unnamedplus
set hidden                " unamed files don't need saving
set splitright            " new split on right
set splitbelow            " new split below

let &colorcolumn="80,".join(range(120,120),",")

set history=1000
set path+=**
set wildmenu
set spell

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo

set undolevels=1000
set undoreload=10000

set listchars=eol:↲,tab:··,trail:⏺,extends:>,precedes:<
set list

" Remove trailing whitespace
autocmd BufWritePre *.js :%s/\s\+$//e
