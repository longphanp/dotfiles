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

" Remove insert newline delay
set timeoutlen=500

" Automatically wrap text that extends beyond the screen length.
set wrap

" Vim's auto indentation feature does not work properly with text copied from outside of Vim. Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
set textwidth=128
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
set ttyscroll=3
set lazyredraw " to avoid scrolling problems

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

" Minimal syntax highlight column
set synmaxcol=256

" Open manpage with vim
runtime! ftplugin/man.vim

"---------------Key bindings------------------
:imap jj <Esc>

let mapleader = " "

" Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <leader>s :split<CR>
nnoremap <leader>v :vsplit<CR>

" Buffer navigation
"nnoremap <C-i> :bn<Cr>
"nnoremap <C-o> :b#<Cr>

" Enable folding with the spacebar
" nnoremap <space> za

" Turn off highlight search
nnoremap <esc><esc> :noh<return><esc>

" Disable ex mode and command history
map q: <Nop>
nnoremap Q <nop>

" Make diff between 2 files
"nnoremap <leader>d :windo diffthis<CR>

nnoremap K <C-u>
nnoremap J <C-d>

" Make '^' to 0
noremap <silent> <expr> ^ getline('.')[0 : col('.') - 2] =~# '^\s\+$' ? '0' : '^'

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

nnoremap = <C-w>=

nnoremap L $
nnoremap H 0

nnoremap <leader>t :term<CR>
"----------------------------------------------
" File indent

" For web dev
autocmd Filetype html setlocal ts=2 sw=2 sts=2 expandtab autoindent 
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2 expandtab autoindent
autocmd Filetype typescript setlocal ts=2 sw=2 sts=2 expandtab autoindent
autocmd Filetype javascriptreact setlocal ts=2 sw=2 sts=2 expandtab autoindent
autocmd Filetype typescriptreact setlocal ts=2 sw=2 sts=2 expandtab autoindent
autocmd Filetype css setlocal ts=2 sw=2 sts=2 expandtab autoindent
autocmd Filetype json setlocal ts=2 sw=2 sts=2 expandtab autoindent
autocmd Filetype vue setlocal ts=2 sw=2 sts=2 expandtab autoindent 

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
autocmd Filetype cpp setlocal ts=2 sw=2 sts=2 expandtab autoindent
autocmd Filetype c setlocal ts=2 sw=2 sts=2 expandtab autoindent

"Jenkins files
augroup set_jenkins_groovy
au!
au BufNewFile,BufRead *.jenkinsfile,*.Jenkinsfile,Jenkinsfile,jenkinsfile setf groovy
augroup END

"---------------------------------------------------
"Flagging Unnecessary Whitespace
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

colorscheme everforest
let g:everforest_disable_italic_comment = 1
let g:everforest_background = 'soft'
let g:everforest_better_performance = 0
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
nmap <leader>cy <Plug>(coc-type-definition)
nmap <leader>ci <Plug>(coc-implementation)
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>do <Plug>(coc-codeaction)
nnoremap <silent> <leader>ck :call <SID>show_documentation()<CR>

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
let g:vim_json_conceal=0

" Commenter
nmap // <plug>NERDCommenterToggle
vmap // <plug>NERDCommenterToggle
nmap /. <plug>NERDCommenterMinimal
vmap /. <plug>NERDCommenterMinimal

let g:NERDSpaceDelims = 4
let g:NERDCreateDefaultMappings = 0

" Fugitive shortcut
nmap <leader>gs :G<CR>
nmap <leader>gd :Gdiff<CR>
nmap <leader>gl :Gclog<CR>
nmap <leader>gf :diffget //2<CR>
nmap <leader>gj :diffget //3<CR>
nmap <leader>gb :G blame<CR>

" List commit for current file
nmap <leader>gc :0Gclog<CR>
nmap <leader>gp :Git log -p --follow -- % <CR>

" Git blame
nnoremap <Leader>b :<C-u>call gitblame#echo()<CR>

" vim-ripgrep
if executable('rg')
    let g:rg_derive_root = 'true'
endif

" Fzf
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"
nnoremap <silent> <C-b> :Buffers<CR>
nnoremap <silent> <C-f> :Files<CR>
nnoremap <silent> <C-g> :Rg 
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

"FZF Buffer Delete
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

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

" Dirvish
nnoremap <C-n> :Dirvish <CR>

let g:dirvish_mode = ':sort ,^\v(.*[\/])|\ze,'

augroup dirvish_config
  autocmd!
  autocmd FileType dirvish silent! unmap <buffer> <C-p>
augroup END

" Vim-terraform
let g:terraform_fmt_on_save=1
let g:terraform_align=1

