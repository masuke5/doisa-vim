let s:save_cpo = &cpo
set cpo&vim

set nosecure

let s:enabled = 1

let s:long = {
  \ 'a': 'á',
  \ 'e': 'é',
  \ 'i': 'í',
  \ 'o': 'ó',
  \ 'u': 'ú',
  \ '`': '`',
  \ }

function! doisa#disable() 
  let s:enabled = 0
endfunction

function! doisa#enable()
  let s:enabled = 1
endfunction

function! doisa#convert()
  if s:enabled
    for [key, value] in items(s:long)
      execute ':' . line('.') . ' s/' . key . '`/' . value . '/ge'
    endfor
  endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
