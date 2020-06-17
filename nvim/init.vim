call plug#begin('~/.config/nvim/plugged')
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
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
Plug '907th/vim-auto-save'
"Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
Plug 'vim-test/vim-test'
call plug#end()

let mapleader = " "

" Editor
set hidden
set nowrap
set encoding=utf-8
set pumheight=10
set cmdheight=2
set iskeyword+=-
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
set backspace=indent,eol,start
set incsearch
set hlsearch
set list
set listchars=tab:\|\ ,trail:▫
set showcmd
set noshowmode
set noswapfile
set nobackup
set nowritebackup
set updatetime=300
set timeoutlen=500
set signcolumn=yes
set clipboard=unnamedplus
set shortmess+=c

colorscheme nord
set termguicolors

highlight Comment cterm=italic gui=italic
set background=dark
let g:airline_theme='nord'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#hunks#enabled = 0

set pyx=3
let g:python3_host_prog = expand('~/.asdf/shims/python')
let g:loaded_python_provider = 0

" Enable auto-save
let g:auto_save = 1
let g:auto_save_silent = 1

" Colorizer
let g:colorizer_auto_color = 1

" Save & quit
noremap <leader>q :q<CR>
noremap <C-q> :qa<CR>
noremap <leader>w :w<CR>

" Undo operations
noremap l u


" Insert Key
noremap k i
noremap K I

" Next and previous search
noremap <C-]> n
noremap <C-[> N
noremap <leader>nh :nohl<CR>

" ===
" === Cursor Movement
" ===
" New cursor movement (the default arrow keys are used for resizing windows)
"     ^
"     u
" < n   i >
"     e
"     v
noremap <silent> u gk
noremap <silent> n h
noremap <silent> e gj
noremap <silent> i l
noremap <silent> gu gk
noremap <silent> ge gj

" N key: go to the start of the line
noremap <silent> N ^
" I key: go to the end of the line
noremap <silent> I $

" ===
" === Tab management
" ===
noremap tn :bprev<CR>
noremap ti :bnext<CR>
noremap Q :bw<CR>

" ===
" === FZF
" ===
set rtp+=/usr/local/opt/fzf
noremap <C-y> :Files<CR>
noremap <C-f> :Rg<CR>
noremap <C-e> :History<CR>
noremap <C-l> :Lines<CR>
noremap <C-t> :Buffers<CR>
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" ===
" === coc-exploxer
" ===
nmap tt :CocCommand explorer<CR>
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
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
 inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
 inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Refactor current word
nmap <leader>rf <Plug>(coc-refactor)
augroup go
  autocmd!
  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4
  autocmd FileType go nmap <silent> <leader>r <Plug>(go-run)
augroup END

let g:go_def_mapping_enabled = 0
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

" Fugitive Mappings
nnoremap <leader>gs :Git<CR>

" vim-plug mappings
noremap <leader>pi :PlugInstall<CR>
