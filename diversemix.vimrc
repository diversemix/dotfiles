set nocompatible              " be iMproved, required
filetype off                  " required

source ~/dotfiles/vim/disable-arrows.vim
source ~/dotfiles/vim/plugins.vim
source ~/dotfiles/vim/windows.vim
source ~/dotfiles/vim/leader.vim

set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
colorscheme peachpuff     " set colorscheme
set background=dark       " set the colorscheme (https://github.com/morhetz/gruvbox/wiki/Usage)
set rnu                   " show line numbers
set nu
set laststatus=2          " last window always has a statusline
"set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ruler                 " Always show info along bottom.
set autoindent            " auto-indent
set tabstop=2             " tab spacing
set softtabstop=2         " unify
set shiftwidth=2          " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set nowrap                " don't wrap text
"set shortmess=at          " Don't display standard message
set autowrite             " save buffers when going hidden
set hls
set mouse=a
set clipboard=unnamedplus
set hidden                " unamed files don't need saving
set splitright            " new split on right
set splitbelow            " new split below

let &colorcolumn="80,".join(range(120,120),",")

set history=1000
set path+=**
set wildmenu
map <F6> :setlocal spell! spelllang=en_gb<CR>
hi SpellBad guibg=#ff2929 ctermbg=224
hi Search guibg=#ffff00 ctermbg=226

set listchars=eol:↩,tab:►-,trail:•,extends:>,precedes:<
set list

" Remove trailing whitespace
autocmd BufWritePre *.js :%s/\s\+$//e
