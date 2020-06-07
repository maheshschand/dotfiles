" Andrew J. Kronser
" VIM Settings - Yeah!

" COLOR
"  1. use 256 colorscheme
"  2. enable syntax highlighting
"  3. set the colorscheme (solarized if present, otherwise slate)
set t_Co=256
syntax on
set background=dark
if filereadable(expand('~/.vim/colors/solarized.vim'))
    let g:solarized_termcolors=256
    let g:solarized_contrast="high"
    colorscheme solarized
else
    colorscheme slate
endif

" SPACES AND TABS
"  1. tabs are displayed as four spaces
"  2. turns tabs into spaces
"  3. indent automatically
"  4. set backspace to delete over line-breaks
"  5. delete tabs as indent not space
"  6. for smarttab, shift 4 spaces on tab press
set softtabstop=4
set expandtab
set autoindent
set backspace=eol,start,indent
set smarttab
set shiftwidth=4

" UI
"  1. highlights the current line
"  2. load filetype indent files
"  3. shows matching punct. e.g. open/close paren
"  4. show a status line at the bottom
"  5. display line, col, % at the bottom
"  6. make arrow keys wrap lines
"  7. shows commands as they're typed in the lower-right corner
"  8. turns on cmd autocompletion
"  9. set ZZ to save and quit all open buffers
set cursorline
filetype indent on
set showmatch
set laststatus=2
set ruler
set whichwrap+=<,>,h,l
set showcmd
set wildmenu
nnoremap ZZ :xa<CR>
nnoremap QQ :q!<CR>

" FOLDING
"  1. use space to toggle folds
"  2. use automatic syntax folding
"  3. open all first fold levels by default
nnoremap <space> za
set foldmethod=syntax
set foldlevelstart=99

" SEARCH
"  1. search in real-time
"  2. highlight search terms
"  3. case-insensitive search
"  4. set ctrl-f to find
"  5. set ctrl-r to replace
"  6. clear searchhl with esc
set incsearch
set hlsearch
set ignorecase
nnoremap <C-F> /
nnoremap <C-R> :%s/

" MAKE
"  1. write prior to running :make
"  2. map f5 to compile without any prompts and open the error list in split
"  further make settings can be found in the autocmd section
set autowrite
nnoremap <F5> :silent make!\|redraw!\|copen<CR><C-W><C-W>
nnoremap <F6> :!./a.out<CR>

" OTHER
set encoding=utf8
set ffs=unix,dos,mac
set nocompatible

" AUTOCMD
" C++
autocmd bufnewfile *.cpp so ~/.vim/templates/cpp_header.txt
autocmd bufnewfile *.cpp exe "1," . 10 . "g/filename.*/s//filename: " .expand("%")
autocmd bufnewfile *.cpp exe "1," . 10 . "g/date.*/s//date: " .strftime("%m.%d.%Y")
autocmd bufnewfile,bufread *.cpp set makeprg=g++\ -std=c++11\ %

" C
autocmd bufnewfile *.c so ~/.vim/templates/c_header.txt
autocmd bufnewfile *.c exe "1," . 10 . "g/filename.*/s//filename: " .expand("%")
autocmd bufnewfile *.c exe "1," . 10 . "g/date.*/s//date: " .strftime("%m.%d.%Y")
autocmd bufnewfile,bufread *.c set makeprg=gcc\ -std=c99\ -lm\ %

" vimscript
autocmd bufnewfile *.html so ~/.vim/templates/html_header.txt

" BaSH
autocmd bufnewfile *.sh so ~/.vim/templates/bash_header.txt
autocmd bufnewfile *.sh exe "1," . 8 . "g/filename.*/s//filename: " .expand("%")
autocmd bufnewfile *.sh exe "1," . 8 . "g/date.*/s//date: " .strftime("%m.%d.%Y")

" Java
autocmd bufnewfile *.java so ~/.vim/templates/java_header.txt
autocmd bufnewfile *.java exe "1," . 8 . "g/filename.*/s//filename: " .expand("%")
autocmd bufnewfile *.java exe "1," . 8 . "g/date.*/s//date: " .strftime("%m.%d.%Y")
autocmd bufnewfile,bufread *.java set makeprg=javac\ *.java

set clipboard=unnamedplus

set number