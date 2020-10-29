let mapleader=";"

noremap <C-p> :GFiles<CR>

noremap <Leader><Space> /<++><Enter>"_c4l

map <A-j> :bprevious<cr>
map <A-k> :bnext<cr>
map <C-3> :buffers<cr>

noremap <Leader>c :bd<CR>
noremap <Leader>d :lcd %:p:h<CR>
noremap <Leader>e :cn<CR>
noremap <Leader>E :cp<CR>
noremap <Leader>g :Git<CR>
noremap <Leader>h :call CocAction('doHover')<CR>
noremap <Leader>j :bprevious<cr>
noremap <Leader>k :bnext<cr>
noremap <Leader>n :set norelativenumber!<CR>
noremap <Leader>p :setlocal spell! spelllang=en_gb<CR>
noremap <Leader>q :q<CR>
noremap <Leader>t :sp<CR>
noremap <Leader>tt :vsp<CR>
noremap <Leader>v :e ~/dotfiles/diversemix.vimrc<CR>
noremap <Leader>w :w<CR>
noremap <Leader>x :new +0r!
noremap <Leader>z :let @+=expand("%")<CR>

noremap <Leader>gb :GoBuild<CR>
noremap <Leader>gd :GoDoc<CR>
noremap <Leader>gD :GoDocBrowser<CR>
noremap <Leader>gl :GoLint<CR>
noremap <Leader>gt :GoTest<CR>
noremap <Leader>gr :GoRun<CR>
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
" not really getting on with auto bracket closing
" inoremap ( ()<Esc>i
" inoremap [ []<Esc>i
" inoremap { {}<Esc>i
" inoremap " ""<Esc>i

" folding
nnoremap <leader>ff :set fdm=manual<CR>
nnoremap <leader>fi :set fdm=indent<CR>
nnoremap <leader>fm :set fdm=marker<CR>
nnoremap <leader>fs :set fdm=syntax<CR>
nnoremap <leader>fd :set fdm=diff<CR>


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
