" Copyright (C) 2020 Xvezda <https://xvezda.com/>
"
" MIT License
"
" Use of this source code is governed by an MIT-style
" license that can be found in the LICENSE file or at
" https://opensource.org/licenses/MIT.
"
" Location:     autoload/veast.vim
" Maintainer:   Xvezda <https://xvezda.com/>


" Source guard
if exists('g:loaded_veast')
  finish
endif
let g:loaded_veast = 1


if exists('g:veast')
  let g:veast = g:veast
else
  let g:veast = {
        \ 'val': 0,
        \ }
endif
lockvar! g:veast

function! veast#every(...) abort
  for i in range(a:0)
    let expr = a:000[i]
    if type(expr) == type([])
      for subexpr in expr
        if !veast#every(subexpr)
          return 0
        endif
      endfor
    elseif type(expr) == type("")
      if !eval(expr)
        return 0
      endif
    elseif type(expr) == type({})
      throw 'argument `expr` cannot be dictionary type'
    else
      if !expr
        return 0
      endif
    endif
  endfor
  return 1
endfunction


function! veast#some(...) abort
  for i in range(a:0)
    let expr = a:000[i]
    if type(expr) == type([])
      for subexpr in expr
        if veast#some(subexpr)
          return 1
        endif
      endfor
    elseif type(expr) == type("")
      if eval(expr)
        return 1
      endif
    elseif type(expr) == type({})
      throw 'argument `expr` cannot be dictionary type'
    else
      if expr
        return 1
      endif
    endif
  endfor
  return 0
endfunction


function! veast#each(iter, expr) abort
  if type(a:iter) == type([])
    let iter_ = a:iter
  elseif type(a:iter) == type({})
    let iter_ = values(a:iter)
  elseif type(a:iter) == type("")
    let iter_ = split(a:iter, '\zs')
  else
    throw 'argument `iter` is not iterable type'
  endif

  let ret = []

  unlockvar! g:veast
  for val in iter_
    let g:veast.val = val
    call add(ret, eval(a:expr))
  endfor
  lockvar! g:veast

  return ret
endfunction


function! veast#apply(iter, func) abort
  if type(a:iter) == type([])
    for a:item in iter
      call a:func(item)
    endfor
  elseif type(a:iter) == type({})
    for item in values(a:iter)
      call a:func(item)
    endfor
  elseif type(a:iter) == type("")
    for item in split(a:iter, '\zs')
      call a:func(item)
    endfor
  else
    throw 'argument `iter` is not iterable type'
  endif
endfunction

