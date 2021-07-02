" Create map to add keys to
let g:which_key_map =  {}

" Define a separator
let g:which_key_sep = '→'

" Some custom keys
let g:which_key_map['.']  = [ ':e $MYVIMRC', 'Open vimrc' ]
let g:which_key_map['/'] = [ "<Plug>NERDCommenterToggle"  , "Toggle comment" ]
let g:which_key_map[';'] = [ ':Commands', 'commands' ]
let g:which_key_map['<Tab>'] =  [':CocCommand explorer', "Toggle File Explorer"]

" Actions
let g:which_key_map.a = {
  \ 'name': '+actions',
  \ 's': [':w', 'Save current buffer'],
  \ 'a': [':wa', 'Save all buffers'],
  \ }

" Fugitive
let g:which_key_map.g = {
  \ 'name': '+git',
  \ 's': [':Git', 'Status'],
  \ 'p': [':Git pull', 'Pull'],
  \ 'P': [':Git push', 'Push'],
  "\ 'd': [':Gdiff', 'Diff'],
  \ 'c': [':Git commit', 'Commit'],
  \ }

" Navigation
let g:which_key_map.n = {
  \ 'name': '+search',
  \ 'l': [':BLines', 'Search lines in this buffer'],
  \ 'g': [':Rg', 'ripgrep'],
  \ 'e': [':History', 'Search in buffer history'],
  \ 'b': [':Buffers', 'Search for open buffers'],
  \ 'f': [':Files', 'Search in current directory'],
  \ }

" Windows actions
let g:which_key_map.w = {
  \ 'name' : 'Windows/Buffers' ,
  \ 'l': [':BufferLast', 'Last Buffer'  ],
  \ 'd': [':BufferClose!', 'Close Buffer'  ],
  \ 'p': [':BufferPick', 'Pick Buffer'  ],
  \ 'a': [':wa' , 'buffer-save-all'],
  \ 'q' : ['<C-W>c',    'delete-window']         ,
  \ '2' : ['<C-W>v',    'layout-double-columns'] ,
  \ 'h' : ['<C-W>h',    'window-left']           ,
  \ 'n' : ['<C-W>j',    'window-below']          ,
  \ 'i' : ['<C-W>l',    'window-right']          ,
  \ 'e' : ['<C-W>k',    'window-up']             ,
  \ 'H' : ['<C-W>5<',   'expand-window-left']    ,
  \ 'N' : [':resize +5', 'expand-window-below']   ,
  \ 'I' : ['<C-W>5>',   'expand-window-right']   ,
  \ 'E' : [':resize -5', 'expand-window-up']      ,
  \ '=' : ['<C-W>=',    'balance-window']        ,
  \ 's' : ['<C-W>s',    'split-window-below']    ,
  \ 'v' : ['<C-W>v',    'split-window-right']    ,
  \ 'c' : ['Windows',   'fzf-window']            ,
  \ }

call which_key#register('<Space>', "g:which_key_map")

