source ~/dotfiles/vim/plugs.vim
let g:UltiSnipsExpandTrigger = "<nop>"
source ~/dotfiles/vim/coc.vim

set clipboard^=unnamed,unnamedplus
set backup
if !isdirectory($HOME."/.vim/backupdir")
    silent! execute "!mkdir ~/.vim/backupdir"
endif
set backupdir=~/.vim/backupdir
"not generate .swap
set noswapfile

filetype plugin indent on    " required

" Setup Javascript
let g:javascript_conceal_function             = "ƒ"
let g:javascript_conceal_null                 = "ø"
let g:javascript_conceal_this                 = "@"
let g:javascript_conceal_return               = "⇚"
let g:javascript_conceal_undefined            = "¿"
let g:javascript_conceal_NaN                  = "ℕ"
let g:javascript_conceal_prototype            = "¶"
let g:javascript_conceal_static               = "•"
let g:javascript_conceal_super                = "Ω"
let g:javascript_conceal_arrow_function       = "⇒"
"let g:javascript_conceal_noarg_arrow_function = ""
"let g:javascript_conceal_underscore_arrow_function = ""
set conceallevel=1

" Setup FZF
nmap <C-p> :Files<CR>
nmap <C-e> :CocCommand explorer<CR>
nmap <C-r> :Buffers<CR>
nmap <C-a> :Ag<CR>

" Setup Theme
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark='hard'

" Setup airline
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#formatter = 'unique_tail_improved' " f/p/file-name.js

set cursorline
set laststatus=2          " last window always has a statusline
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ruler                 " Always show info along bottom.
set autoindent            " auto-indent
set tabstop=4             " tab spacing
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 2 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set wrap                  " don't wrap text
set mouse=a
set number

" Setup line width coloring
let &colorcolumn="80,".join(range(80,120),",")
highlight ColorColumn ctermbg=Black

" Persistent undo
set undofile
set undodir=$HOME/.vim/undo
set undolevels=10000
set undoreload=10000

autocmd BufWritePost *Note-*.md silent !/home/peter/dotfiles/scripts/buildnote.sh %:p
