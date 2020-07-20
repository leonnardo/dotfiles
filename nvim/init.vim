" ============= Vim-Plug ============== "{{{

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
let g:vim_bootstrap_editor = "nvim"

if !filereadable(vimplug_exists)
  if !executable("curl")
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!\curl -fLo " . vimplug_exists . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" }}}

Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'yuki-ycino/fzf-preview.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-fugitive'
Plug 'wakatime/vim-wakatime'
Plug 'airblade/vim-gitgutter'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
Plug '907th/vim-auto-save'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'vim-test/vim-test'
Plug 'liuchengxu/vim-which-key'
Plug 'kdheepak/lazygit.vim', { 'branch': 'nvim-v0.4.3' }
Plug 'mhinz/vim-startify'
Plug 'uarun/vim-protobuf'
Plug 'hashivim/vim-terraform'
Plug 'preservim/nerdcommenter' 
call plug#end()
let mapleader = " "

" Editor
filetype plugin indent on
set hidden
set nowrap
set encoding=utf-8
set pumheight=10
set cmdheight=2
set iskeyword+=-
set iskeyword+=_
set mouse=a
set splitbelow
set splitright
set number
set cursorline
set expandtab
set smarttab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set smartindent
set incsearch
set hlsearch
set list
set listchars=tab:→\ ,trail:▫,eol:⏎
set showcmd
set noshowmode
set noswapfile
set nobackup
set nowritebackup
set updatetime=250
set timeoutlen=500
set signcolumn=yes
set clipboard=unnamedplus
set shortmess+=c
" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

colorscheme gruvbox
set background=dark
set termguicolors

highlight Comment cterm=italic gui=italic
hi Normal guibg=NONE ctermbg=NONE
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled = 0

set pyx=3
let g:python3_host_prog = expand('~/.asdf/shims/python')
let g:loaded_python_provider = 0

" Enable auto-save
let g:auto_save = 1
let g:auto_save_silent = 1

" Insert Key
noremap u i
noremap U I

" end of word
noremap j e
noremap J E

" Next and previous search
noremap k n
noremap K N

" Undo
noremap l u
noremap L U

" Cursor movement
noremap <silent> e gk
noremap <silent> n gj
noremap <silent> i l
noremap <silent> ge gk
noremap <silent> gn gj

" H key: go to the start of the line
noremap <silent> H ^
" I key: go to the end of the line
noremap <silent> I $

" ===
" === Tab management
" ===
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprev<CR>

" Save & quit
" TODO: check if there's a smart way to quit buffers, splits and full program
" https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
noremap <leader>q :q<CR>
noremap <silent> Q :bw<CR>
noremap <C-q> :qa<CR>

" kk to leave insert mode
inoremap kk <Esc>

" FZF
set rtp+=/usr/local/opt/fzf
noremap <silent> <leader>f :Lines<CR>
noremap <silent> <leader>F :Rg<CR>
noremap <silent> <leader>e :History<CR>
noremap <silent> <leader>u :Files<CR>

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

nnoremap <silent> <M-Up> :res +1<CR>
nnoremap <silent> <M-Down> :res -1<CR>
nnoremap <silent> <M-S-Left> :vertical res -1<CR>
nnoremap <silent> <M-S-Right> :vertical res +1<CR>
" ===
" === coc-exploxer
" ===
map <silent> <F2> :CocCommand explorer --width 45'<CR>
let g:coc_explorer_global_presets = {
\   'floating': {
\      'position': 'floating',
\   },
\   'floatingLeftside': {
\      'position': 'floating',
\      'floating-position': 'left-center',
\      'floating-width': 50,
\   },
\   'floatingRightside': {
\      'position': 'floating',
\      'floating-position': 'left-center',
\      'floating-width': 50,
\   },
\   'simplify': {
\     'file.child.template': '[selection | clip | 1] [indent][icon | 1] [filename omitCenter 1]'
\   }
\ }

" Coc mappings
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
 inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
 inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use <F1> to show documentation in preview window.
nnoremap <silent> <F1> :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Refactor current word
nmap <leader>rf <Plug>(coc-refactor)

augroup go
  autocmd!
  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
  autocmd FileType go nmap <silent> <F5> <Plug>(go-run)
  autocmd FileType go nmap <silent> <F6> <Plug>(go-test-func)
augroup END

let g:go_def_mapping_enabled = 0
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
let g:go_code_completion_enabled = 0
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_fields = 1

" fugitive mappings
nnoremap <silent> <leader>gs :Git<cr>
nnoremap <silent> <leader>gp :Git pull<cr>
nnoremap <silent> <leader>gP :Git push<cr>

" LazyGit
nnoremap <silent> <leader>lg :LazyGit<CR>

" vim-plug mappings
noremap <silent> <leader>pi :PlugInstall<CR>

" Move block of lines (normal or visual) using shift+[NE]
xnoremap <silent> N :move '>+1<CR>gv-gv
xnoremap <silent> E :move '<-2<CR>gv-gv

" Vim which key for <leader>
nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

" Create map to add keys to
let g:which_key_map =  {}

" Define a separator
let g:which_key_sep = '→'

" Some custom keys
let g:which_key_map['.']  = [ ':e $MYVIMRC', 'Open vimrc' ]
let g:which_key_map['/'] = [ "<Plug>NERDCommenterToggle"  , "Toggle comment" ]
let g:which_key_map[';'] = [ ':Commands', 'commands' ]
let g:which_key_map['1'] =  [':CocCommand explorer --width 45', "Toggle File Explorer"]

" Search
let g:which_key_map.s = {
  \ 'name': 'Search',
  \ 'l': [':Lines', 'Search lines in this buffer'],
  \ 'g': [':Rg', 'ripgrep'],
  \ 'h': [':History', 'Search in buffer history'],
  \ 'b': [':Buffers', 'Search for open buffers'],
  \ 'f': [':Files', 'Search in current directory'],
  \ 's': [':CocList outline', 'Fuzzy search symbols of this file'],
  \ 'w' : ['Windows'    , 'Search in open windows']            ,
  \ }

" Toggles
let g:which_key_map.t = {
  \ 'name': 'Toggle',
  \ 'r': [ ':set relativenumber!', 'Relative lines' ],
  \ 'l': [ ':set nonumber!', 'Show lines' ],
  \ 'h': [ ':let @/ = ""', 'Remove search highlight' ],
  \ 's': [ ':so $MYVIMRC', "Source init.vim" ],
  \ 'c': [ "<Plug>NERDCommenterToggle"  , "Toggle comment" ],
  \ 'e': [':CocCommand explorer --width 45', "Toggle File Explorer"]
  \ }

" Winodow actions
let g:which_key_map.w = {
  \ 'name' : 'Windows' ,
  \ 'w' : ['<C-W>w'     , 'other-window']          ,
  \ 'q' : ['<C-W>c'     , 'delete-window']         ,
  \ '2' : ['<C-W>v'     , 'layout-double-columns'] ,
  \ 'h' : ['<C-W>h'     , 'window-left']           ,
  \ 'n' : ['<C-W>j'     , 'window-below']          ,
  \ 'i' : ['<C-W>l'     , 'window-right']          ,
  \ 'e' : ['<C-W>k'     , 'window-up']             ,
  \ 'H' : ['<C-W>5<'    , 'expand-window-left']    ,
  \ 'N' : ['resize +5'  , 'expand-window-below']   ,
  \ 'I' : ['<C-W>5>'    , 'expand-window-right']   ,
  \ 'E' : ['resize -5'  , 'expand-window-up']      ,
  \ '=' : ['<C-W>='     , 'balance-window']        ,
  \ 's' : ['<C-W>s'     , 'split-window-below']    ,
  \ 'v' : ['<C-W>v'     , 'split-window-right']    ,
  \ 'c' : ['Windows'    , 'fzf-window']            ,
  \ }

call which_key#register('<Space>', "g:which_key_map")

" open help in vertical split
autocmd FileType help wincmd L

" remap command mode key
noremap ; :
nnoremap <S-CR> o<Esc>
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

" vim-terraform config
let g:terraform_align =1
let g:terraform_fmt_on_save = 1
