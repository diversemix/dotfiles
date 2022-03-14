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
"
