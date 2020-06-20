let mapleader = ";"

noremap <C-p> :GFiles<CR>

inoremap <Leader><Space> <Esc>/<++><Enter>"_c4l
noremap <Leader><Space> /<++><Enter>"_c4l

inoremap <Leader>; <Esc>
noremap <Leader>a :sp<CR>
noremap <Leader>b :vsp<CR>
noremap <Leader>c :bd<CR>
noremap <Leader>d :cd %:p:h<CR>
noremap <Leader>e :cn<CR>
noremap <Leader>E :cp<CR>
noremap <Leader>g :Git<CR>
noremap <Leader>h :call CocAction('doHover')<CR>
noremap <Leader>j :bprevious<CR>
noremap <Leader>k :bnext<CR>
noremap <Leader>l :GoLint<CR>
noremap <Leader>n :set norelativenumber!<CR>
noremap <Leader>q :q<CR>
noremap <Leader>t :terminal<CR>
noremap <Leader>v :e ~/dotfiles/diversemix.vimrc<CR>
noremap <Leader>x :new +0r!

" folding
nnoremap <leader>ff :set fdm=manual<CR>
nnoremap <leader>fi :set fdm=indent<CR>
nnoremap <leader>fm :set fdm=marker<CR>
nnoremap <leader>fs :set fdm=syntax<CR>
nnoremap <leader>fd :set fdm=diff<CR>

" html snippets
autocmd FileType html inoremap <Leader>i <em></em><Space><++><Esc>FeT>i
autocmd FileType html inoremap <Leader>h <h1></h1><Space><++><Esc>FhT>i
autocmd FileType html inoremap <Leader>d <div></div><Space><++><Esc>FdT>i

" js snippets
autocmd FileType javasCRipt inoremap <Leader>c console.log(``)<Space><++><Esc>F`i
autocmd FileType javasCRipt inoremap <Leader>j JSON.stringify()<Space><++><Esc>F)i
autocmd FileType javasCRipt inoremap <Leader>v ${}<Esc>i
autocmd FileType javasCRipt inoremap <Leader>a ()<Space>=><Space>{<CR><++><CR>}<Space><++><Esc>?)<CR>i
autocmd FileType javasCRipt inoremap <Leader>f function ()<Space>{<CR><++><CR>}<Space><++><Esc>?(<CR>i

" go snippets
autocmd FileType go inoremap <Leader>f func<Space>X(<++>)<Space>{<CR><++><CR>}<Esc>?X<CR>:noh<CR>cw

autocmd FileType go inoremap <Leader>p fmt.Printf("")<++><Esc>F"i
autocmd FileType go noremap <Leader>p ofmt.Printf("")<++><Esc>F"i

" -----------------------------------------------------------------------------
"  Settings for Coc
"  See: https://octetz.com/docs/2019/2019-04-24-vim-as-a-go-ide/
" -----------------------------------------------------------------------------
" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=2
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
