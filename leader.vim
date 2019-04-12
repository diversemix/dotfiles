inoremap <Leader><Space> <Esc>/<++><Enter>"_c4l
noremap <Leader><Space> /<++><Enter>"_c4l

noremap <Leader>s :w<cr>
noremap <Leader>q :q<cr>
noremap <Leader>c :bd<cr>
noremap <Leader>e :e %:p:h<cr>
noremap <Leader>w :w<cr><c-w>w
noremap <Leader>l :bnext<CR>
noremap <Leader>j :bprevious<CR>
" noremap <Leader>n 

" folding
nnoremap <leader>ff :set fdm=manual<cr>
nnoremap <leader>fi :set fdm=indent<cr>
nnoremap <leader>fm :set fdm=marker<cr>
nnoremap <leader>fs :set fdm=syntax<cr>
nnoremap <leader>fd :set fdm=diff<cr>

" html snippets
autocmd FileType html inoremap <Leader>i <em></em><Space><++><Esc>FeT>i
autocmd FileType html inoremap <Leader>h <h1></h1><Space><++><Esc>FhT>i
autocmd FileType html inoremap <Leader>d <div></div><Space><++><Esc>FdT>i

"js snippets
autocmd FileType javascript inoremap <Leader>jc console.log(``)<Space><++><Esc>F`i
autocmd FileType javascript inoremap <Leader>jj JSON.stringify()<Space><++><Esc>F)i
autocmd FileType javascript inoremap <Leader>jv ${}<Esc>i
autocmd FileType javascript inoremap <Leader>ja ()<Space>=><Space>{<CR><++><CR>}<Space><++><Esc>?)<CR>i
autocmd FileType javascript inoremap <Leader>jf function ()<Space>{<CR><++><CR>}<Space><++><Esc>?(<CR>i

