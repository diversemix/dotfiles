let mapleader = ";"

inoremap <Leader><Space> <Esc>/<++><Enter>"_c4l
noremap <Leader><Space> /<++><Enter>"_c4l

inoremap <Leader>; <Esc>
noremap <Leader>a :sp<CR>
noremap <Leader>b :vsp<CR>
noremap <Leader>c :bd<CR>
noremap <Leader>d :close<CR>
noremap <Leader>e :cn<CR>
noremap <Leader>h :vsp<CR>:exe "e $HOME/Dropbox/app_data/help/" . &ft . ".md"<CR>
noremap <Leader>j :bprevious<CR>
noremap <Leader>k :bnext<CR>
noremap <Leader>l :GoLint<CR>
noremap <Leader>n :set norelativenumber!<CR>
noremap <Leader>o :vsp<CR>:exe "e $HOME/Dropbox/app_data/todo.md"<CR>
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
autocmd FileType go inoremap <Leader>f func<Space>
autocmd FileType go inoremap <Leader>s <Space>{<CR>X<CR>}<Esc>?X<CR>:noh<CR>cw
autocmd FileType go inoremap <Leader>a (X)<++><Esc>FXcw

autocmd FileType go inoremap <Leader>p fmt.Printf("")<++><Esc>F"i
autocmd FileType go noremap <Leader>p ofmt.Printf("")<++><Esc>F"i

