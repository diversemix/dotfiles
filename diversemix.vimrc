source ~/dotfiles/vim/plugs.vim
source ~/dotfiles/vim/coc.vim
source ~/dotfiles/vim/leader.vim
source ~/dotfiles/vim/mappings.vim

set clipboard^=unnamed,unnamedplus

set backup
if !isdirectory($HOME."/.vim/backupdir")
    silent! execute "!mkdir ~/.vim/backupdir"
endif
set backupdir=~/.vim/backupdir

set noswapfile " do not generate .swap

filetype plugin indent on    " required

set cursorline
syntax enable
set laststatus=2          " last window always has a statusline
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ruler                 " Always show info along bottom.
set autoindent            " auto-indent
set nohlsearch
set nowrap                  " don't wrap text
set mouse=a
set number relativenumber

" Tabs And Spaces
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab

" File Find {{{

set path+=**
set wildmenu
set wildignore+=**/node_modules/** 
set wildignore+=**/*.class
set hidden

" Setup line width coloring
"let &colorcolumn="80,".join(range(80,81),",")
let &colorcolumn="80,88,120,121"
highlight ColorColumn ctermbg=Black

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=10000
set undoreload=10000

" Center search results 
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz

" Scrolling 'border'
set scrolloff=10

" Integration with my scripts...
autocmd BufWritePost Notes-*.md silent !${HOME}/dotfiles/scripts/buildnote.sh %:p


