
" PLUGINS SECTION
" download vim-plug if missing
if empty(glob("~/.vim/autoload/plug.vim"))
  silent! execute '!curl --create-dirs -fsSLo ~/.vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * silent! PlugInstall
endif

" declare plugins
silent! if plug#begin()

  Plug 'scrooloose/nerdcommenter', { 'tag': '2.5.0' }
  Plug 'vim-airline/vim-airline', { 'commit': '6e2a9e3' }  " https://github.com/vim-airline/vim-airline/commit/6e2a9e38cd466f42cede7e2b2dc3321295a370f0
  Plug 'airblade/vim-gitgutter', { 'commit': '54209a0' }  " https://github.com/airblade/vim-gitgutter/commit/54209a0199bcb9f6b7c452deb0ffbc3aa60b857d
  Plug 'yggdroot/indentLine', { 'tag': 'v2.0' }
  "Plug 'docker/docker', { 'rtp': 'contrib/syntax/vim' } " This downloads the complete docker repo (~100MB) so I manually installed it (~25K)

  " left here for reference in case I need to choose plugins by vim version
  "if v:version >= 703
    "Plug 'gorodinskiy/vim-coloresque'
  "endif

  call plug#end()
endif
" END PLUGINS SECTION

set backspace=indent,eol,start

set background=dark

syntax on

" enable Omni-Completion (autocompletion)
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" If you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

" for yaml files (ansible playbooks) <tab> = 2 spaces
autocmd FileType yaml set tabstop=2|set shiftwidth=2

" for python and perl files <tab> = 4 spaces
autocmd FileType python set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType perl set tabstop=4|set shiftwidth=4|set expandtab

" use visual bell instead of beeping
"set vb

" ctrl+t open new tab
map <C-t> <ESC>:tabnew<CR>
" ctrl+cursors navigate tabs
map <C-Right> <ESC>:tabnext<CR>
map <C-Left> <ESC>:tabprev<CR>

" Do smart autoindenting when starting a new line
"set smartindent

" F5 switch to paste mode if you are in insert mode
set pastetoggle=<F5>

"show the `best match so far' as search strings are typed:
set incsearch
set hlsearch
"" make searches case-insensitive, unless they contain upper-case letters:
set ignorecase
set smartcase

"Start in the last position when opening a file
if has("autocmd")
   augroup LastPos
   au!
   autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") |  exe "normal g`\"" | endif
   augroup END
endif

" copy/paste up to 1000 lines
set viminfo='50,<1000,s100,h

" enable modeline
set modeline
set modelines=5

" Use 256 colours (Use this setting only if your terminal supports 256 colours)   
set t_Co=256

set laststatus=2

" Execute file being edited in ipython with <Shift> + e:
"map <buffer> <S-e> :w<CR>:!ipython --no-confirm-exit % <CR>
map <buffer> <S-e> :w<CR>:!ipython --no-confirm-exit -i % <CR>
"map <buffer> <S-e> :w<CR>:!ipython --no-confirm-exit --InteractiveShellApp.hide_initial_ns=False -i % <CR>

" fix for accents in mac
set encoding=utf-8

" disable trailing space warning in status bar (vim airline)
let g:airline#extensions#whitespace#enabled = 0
