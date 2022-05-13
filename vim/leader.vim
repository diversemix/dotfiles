" let mapleader=";"

noremap <Leader><Space> /<++><Enter>"_c4l

" javascript section
inoremap <Leader>fe .forEach(item => {<CR>});<Up><Esc>o
inoremap <Leader>cl console.log(``);<Left><Left><Left>
inoremap <Leader>af const fn = () => {};<Esc>0ffcw

noremap <Leader>c :bd<CR>
noremap <Leader>e :cn<CR>
noremap <Leader>E :cp<CR>
noremap <Leader>g :Git<CR>
noremap <Leader>h :call CocAction('doHover')<CR>
noremap <Leader>j :bprevious<cr>
noremap <Leader>k :bnext<cr>
noremap <Leader>n :set norelativenumber!<CR>
noremap <Leader>ns :!npm start<CR>
noremap <Leader>nt :!npm test<CR>
noremap <Leader>p :setlocal spell! spelllang=en_gb<CR>
noremap <Leader>q :q<CR>
noremap <Leader>s :r ~/dotfiles/snips/
noremap <Leader>t :sp<CR>
noremap <Leader>tt :vsp<CR>
noremap <Leader>v :e ~/dotfiles/diversemix.vimrc<CR>
noremap <Leader>w :w<CR>
noremap <Leader>x :new +0r!
noremap <Leader>z :let @+=expand("%")<CR> 

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
