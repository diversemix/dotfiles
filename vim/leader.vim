let mapleader=";"

noremap <C-p> :GFiles<CR>

noremap <Leader><Space> /<++><Enter>"_c4l

map <A-j> :bprevious<cr>
map <A-k> :bnext<cr>
map <C-3> :buffers<cr>

noremap <Leader>c :bd<CR>
noremap <Leader>e :cn<CR>
noremap <Leader>E :cp<CR>
noremap <Leader>g :Git<CR>
noremap <Leader>h :call CocAction('doHover')<CR>
noremap <Leader>j :bprevious<cr>
noremap <Leader>k :bnext<cr>
noremap <Leader>n :set norelativenumber!<CR>
noremap <Leader>p :setlocal spell! spelllang=en_gb<CR>
noremap <Leader>q :q<CR>
noremap <Leader>s :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
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
