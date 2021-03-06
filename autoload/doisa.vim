let s:save_cpo = &cpo
set cpo&vim

set nosecure

let s:enabled = 1

let s:long = {
  \ 'A': 'Á',
  \ 'E': 'É',
  \ 'I': 'Í',
  \ 'O': 'Ó',
  \ 'U': 'Ú',
  \ 'a': 'á',
  \ 'e': 'é',
  \ 'i': 'í',
  \ 'o': 'ó',
  \ 'u': 'ú',
  \ '`': '`',
  \ }

let s:slash = {
  \ 'O': 'Ø',
  \ 'o': 'ø',
  \ '\/': '\/',
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
      execute ':' . line('.') . ' s/' . key . '`/' . value . '/geI'
    endfor
    for [key, value] in items(s:slash)
      execute ':' . line('.') . ' s/' . key . '\//' . value . '/geI'
    endfor
  endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
