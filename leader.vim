inoremap <Leader><Space> <Esc>/<++><Enter>"_c4l
noremap <Leader><Space> /<++><Enter>"_c4l

noremap <Leader>c :bd<cr>
noremap <Leader>e :e %:p:h<cr>
noremap <Leader>h :vsp<cr>:exe "e $HOME/Dropbox/app_data/help/" . &ft . ".md"<cr>
noremap <Leader>j :bprevious<CR>
noremap <Leader>l :bnext<CR>
noremap <Leader>n :set norelativenumber!<CR>
noremap <Leader>q :q<cr>
noremap <Leader>s :w<cr>
noremap <Leader>t :vsp<cr>:exe "e $HOME/Dropbox/app_data/todo.md"<cr>
noremap <Leader>v :vsp<cr>
noremap <Leader>vv :sp<cr>
noremap <Leader>w <c-w>w
noremap <Leader>x :new +0r!

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
autocmd FileType javascript inoremap <Leader>c console.log(``)<Space><++><Esc>F`i
autocmd FileType javascript inoremap <Leader>j JSON.stringify()<Space><++><Esc>F)i
autocmd FileType javascript inoremap <Leader>v ${}<Esc>i
autocmd FileType javascript inoremap <Leader>a ()<Space>=><Space>{<CR><++><CR>}<Space><++><Esc>?)<CR>i
autocmd FileType javascript inoremap <Leader>f function ()<Space>{<CR><++><CR>}<Space><++><Esc>?(<CR>i

