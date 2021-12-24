function LoadKeymaps()
  nnoremap u i
  nnoremap U I

  nmap j e
  nmap J E

  nnoremap k n
  nnoremap K N

  nnoremap l u
  nnoremap L U

  " nei = jkl
  nnoremap N J
  nnoremap E K
  nnoremap I L

  " Cursor movement
  vnoremap <silent> e <Up>
  nnoremap <silent> e <Up>
  nnoremap <silent> n <Down>
  vnoremap <silent> n <Down>
  nnoremap <silent> i <Right>
  vnoremap <silent> i <Right>
  nnoremap <silent> ge gk
  nnoremap <silent> gn gj
endfunction

function UnloadKeymaps()
  nunmap u
  nunmap U
  unmap j
  unmap J
  nunmap k
  nunmap K
  nunmap l
  nunmap L
  nunmap n
  nunmap N
  nunmap e
  nunmap E
  nunmap i
  nunmap I
  nunmap ge
  nunmap gn
endfunction

