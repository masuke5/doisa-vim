command! DoisaConvert call doisa#convert()
command! DoisaEnable call doisa#enable()
command! DoisaDisable call doisa#disable()

nnoremap <silent> <leader>d :DoisaConvert<CR>
