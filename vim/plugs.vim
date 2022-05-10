call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" For examples see: https://dev.to/iggredible/debugging-in-vim-with-vimspector-4n0m
" Plug 'puremourning/vimspector'
Plug 'sheerun/vim-polyglot'

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Giving this a try
Plug 'pangloss/vim-javascript'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Theme
Plug 'morhetz/gruvbox'
Plug 'sainnhe/everforest'
Plug 'NLKNguyen/papercolor-theme'

" Vim-Airline for the nice statusbar
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug 'prettier/vim-prettier', { 'do': 'npm install' }


" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
" Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
" Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
" Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
call plug#end()

" -----------------------------------------------------------------------------
"  Configuration for Plugs
"

" Easy align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

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
nmap <C-p> :GFiles<CR>
nmap <C-e> :CocCommand explorer<CR>
"nmap <C-r> :Buffers<CR>
nmap <C-a> :Ag<CR>

" Setup Theme
syntax enable
"colorscheme PaperColor
colorscheme gruvbox
"colorscheme everforest
set background=dark
let g:gruvbox_contrast_dark='hard'

" Setup airline
let g:airline_powerline_fonts = 1
let g:airline_theme='base16'
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#formatter = 'unique_tail_improved' " f/p/file-name.js
let g:airline#extensions#tabline#buffer_nr_show = 1 " Show buffer numbers

" Prettier

let g:prettier#config#single_quote = "false"
let g:prettier#config#trailing_comma = "none"
let g:prettier#autoformat = 0
" Uncomment when configured properly
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier
"
" Vimspector
nnoremap <Leader>dd :call vimspector#Launch()<CR>
nnoremap <Leader>de :call vimspector#Reset()<CR>
nnoremap <Leader>dc :call vimspector#Continue()<CR>

nnoremap <Leader>dt :call vimspector#ToggleBreakpoint()<CR>
nnoremap <Leader>dT :call vimspector#ClearBreakpoints()<CR>

nmap <Leader>dk <Plug>VimspectorRestart
nmap <Leader>dh <Plug>VimspectorStepOut
nmap <Leader>dl <Plug>VimspectorStepInto
nmap <Leader>dj <Plug>VimspectorStepOver
