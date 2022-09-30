" Set compatibility to Vim only.
set nocompatible

" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting.
syntax on

" Set split screen behavior
set splitbelow
set splitright

" Enable folding
set foldmethod=indent
set foldlevel=99

set hidden

" Disable swap files
set noswapfile

" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length.
set wrap

" Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
" set textwidth=79
"set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab
set noshiftround
set smarttab

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5

" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Status bar
set laststatus=2

" Display options
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces.
set nolist
"set listchars=tab:>-

" Show line numbers
set relativenumber
set number

" Enable use mouse
set mouse=a

" Switch buffer behavior
set hidden

" Set status line display
"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ [BUFFER=%n]\ %{strftime('%c')}

" Set undo directory
set undodir=~/.vim/undodir
set undofile

" Encoding
set encoding=utf-8

" Highlight matching search patterns
" set hlsearch

" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Using clipboard for vim register 0
set clipboard=unnamed

" Cycle search
set wrapscan 

"---------------Key bidding------------------
:imap jj <Esc>

let mapleader = " "

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Buffer navigation
"nnoremap <C-i> :bn<Cr>
"nnoremap <C-o> :b#<Cr>

" Enable folding with the spacebar
" nnoremap <space> za

" Turn off highlight search
nnoremap <esc><esc> :noh<return><esc>

" Paste text 
inoremap <C-v> <C-r>0<ESC>

"----------------------------------------------

" Automatically save and load folds
"autocmd BufWinLeave *.* mkview
"autocmd BufWinEnter *.* silent loadview"
"
"" For web dev
autocmd Filetype html setlocal ts=2 sw=2 sts=2 expandtab autoindent 
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab autoindent
autocmd Filetype typescript setlocal ts=2 sw=2 sts=2 expandtab autoindent
autocmd Filetype javascriptreact setlocal ts=2 sw=2 sts=2 expandtab autoindent
autocmd Filetype typescriptreact setlocal ts=2 sw=2 sts=2 expandtab autoindent
autocmd Filetype css setlocal ts=2 sw=2 sts=2 expandtab autoindent
autocmd Filetype json setlocal ts=2 sw=2 sts=2 expandtab autoindent

" Python PEP 8
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

"C, C++
autocmd Filetype cpp setlocal ts=4 sw=4 sts=4 expandtab autoindent
autocmd Filetype c setlocal ts=4 sw=4 sts=4 expandtab autoindent


"Flagging Unnecessary Whitespace
"highlight BadWhitespace ctermbg=red guibg=darkred
"au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" For plug-ins to load correctly.
filetype plugin indent on

" Call the .vimrc.plug file
if filereadable(expand("~/.vimrc.plug"))
    source ~/.vimrc.plug
endif


" Set color scheme
if exists('+termguicolors')
  "let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  "let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif
"let g:everforest_better_performance = 1
"let g:everforest_background = 'hard'
"let g:gruvbox_contrast_light = 'hard'
colorscheme everforest

set background=light


" Set status line
"function! g:StatuslineMode()
  "let l:mode_map = {
    "\ 'n': 'NORMAL', 'i': 'INSERT', 'R': 'REPLACE',
    "\ 'v': 'VISUAL', 'V': 'V-LINE', "\<C-v>": 'V-BLOCK',
    "\ 'c': 'COMMAND', 's': 'SELECT', 'S': 'S-LINE',
    "\ "\<C-s>": 'S-BLOCK', 't': 'TERMINAL',
    "\   }
  "return get(l:mode_map, mode(), "BLACK MAGIC")
"endfunction

"hi User1 guibg=#574b68
"hi User2 guibg=#574b68
"hi User3 guibg=#574b68
"hi Search guifg=#ffffff guibg=#ffad5c 

" Status bar
"set statusline=%1*\ %{StatuslineMode()}\ %2*\ %<%F\ %m\|\ buffer-%n\ %r%=\ %{&ff}\ \|\ %{strlen(&fenc)?&fenc:'none'}\ \|\ %{&filetype}\ %3*\ %l:%L\ 
"set noshowmode

runtime macros/matchit.vim

"----------------------Plugins--------------------------

" Coc
let g:coc_disable_startup_warning = 1

nmap <leader>cd <Plug>(coc-definition)
nmap <leader>cr <Plug>(coc-references)
nmap <leader> cy <Plug>(coc-type-definition)
nmap <leader> ci <Plug>(coc-implementation)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>do <Plug>(coc-codeaction)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"coc-prettier
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
command! -nargs=0 Prettier :CocCommand prettier.formatFile

"coc-highlight
hi CocErrorHighlight term=underline cterm=underline ctermfg=160 gui=underline guifg=#f85552
hi CocWarningHighlight term=underline cterm=underline ctermfg=136 gui=underline guifg=#dfa000

" Intent line
let g:indentLine_char_list = ['|']
let g:indentLine_setConceal = 2

" NERDTree shortcut
map <C-n> :NERDTreeToggle<CR>

let NERDTreeShowLineNumbers=1
" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber

" Commenter
nmap // <plug>NERDCommenterToggle
vmap // <plug>NERDCommenterToggle
nmap /. <plug>NERDCommenterMinimal
vmap /. <plug>NERDCommenterMinimal

" Fugitive shortcut
nmap <leader>gs :G<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Gclog<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gb :G blame<CR>

" Git blame
nnoremap <Leader>s :<C-u>call gitblame#echo()<CR>

" vim-ripgrep
if executable('rg')
    let g:rg_derive_root = 'true'
endif

" Fzf
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-g> :Rg<CR>
nnoremap <silent> \ :BLines<CR>

" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)

" Undotree
nnoremap <leader>u : UndotreeShow<CR>

" Vim airline
let g:airline_theme = 'everforest'

" Vim buffer history
nmap <C-i> <Plug>(buf-surf-forward)
nmap <C-o> <Plug>(buf-surf-back)

" Incrsearch fuzzy
map + <Plug>(incsearch-fuzzy-/)
map ? <Plug>(incsearch-fuzzy-?)
map g/ <Plug>(incsearch-fuzzy-stay)
"

" Vim repeat
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

