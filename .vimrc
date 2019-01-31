" vim:set foldmethod=marker:
" basic settings"{{{
" --------------------------------------------------
scriptencoding utf-8
set encoding=utf-8
set nocompatible
set expandtab
set tabstop=4
set shiftwidth=4
set cursorline
set nu
set list
set listchars=tab:\ \ ,trail:…,extends:»,precedes:«,nbsp:∫
set wildmenu
set laststatus=2
set formatoptions+=mM
set langmenu=en_US
let $LANG = 'en_US'
"}}}

nnoremap <C-]> g<C-]>

" vim-plug"{{{
call plug#begin('~/.vim/plugged')

"Plug 'Shougo/neoinclude.vim'
"Plug 'Shougo/neosnippet.vim'
"Plug 'Shougo/neosnippet-snippets'
"Plug 'vim-scripts/javacomplete'
"Plug 'vim-scripts/OmniCppComplete'

Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'

Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'

Plug 'lifepillar/vim-solarized8'
Plug 'w0ng/vim-hybrid'
"Plug 'jonathanfilip/vim-lucius'
Plug 'freeo/vim-kalisi'
Plug 'reedes/vim-colors-pencil'
Plug 'tomasr/molokai'
Plug 'mxw/vim-prolog'
Plug 'cocopon/iceberg.vim'
Plug 'kana/vim-filetype-haskell'
Plug 'dag/vim2hs'
"Plug 'jscappini/material.vim'
"Plug 'adimit/prolog.vim'
"Plug 'soli/prolog-vim'
Plug 'srcery-colors/srcery-vim'
"Plug 'aereal/vim-colors-japanesque'
Plug 'sts10/vim-pink-moon'

"Plug 'brgmnn/vim-opencl'
"Plug 'blueshirts/darcula'
"Plug 'mattn/emmet-vim'
"Plug 'davidhalter/jedi-vim'
"
Plug 'rgrinberg/vim-ocaml'
"Plug 'purescript-contrib/purescript-vim'
"Plug 'kchmck/vim-coffee-script'
"Plug 'posva/vim-vue'
"Plug 'digitaltoad/vim-pug'

call plug#end()
"}}}

" colorscheme settings"{{{
"if &background == "light"
"    colorscheme pencil
"else
"    colorscheme molokai
"endif
colorscheme srcery
"colorscheme solarized8_light
"colorscheme pink-moon

if has("termguicolors")
    set termguicolors
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
""}}}

" lightline settings {{{
let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }
" }}}

" filetype java settings"{{{
autocmd FileType java :setlocal omnifunc=javacomplete#Complete
autocmd FileType java :setlocal completefunc=javacomplete#CompleteParamsInfo
autocmd FileType java :let java_highlight_all=1
autocmd FileType java :let java_highlight_functions="style"
autocmd FileType java :let java_allow_cpp_keywords=1
"}}}

" filetype cpp settings"{{{
autocmd FileType cpp :let OmniCpp_GlobalScopeSearch=1
autocmd FileType cpp :let OmniCpp_NamespaceSearch=1
autocmd FileType cpp :let OmniCpp_DisplayMode=0
autocmd FileType cpp :let OmniCpp_ShowPrototypeInAbbr=0
autocmd FileType cpp :let OmniCpp_ShowAccess=1
autocmd FileType cpp :let OmniCpp_DefaultNamespaces=[]
autocmd FileType cpp :let OmniCpp_MayCompleteDot=1
autocmd FileType cpp :let OmniCpp_MayCompleteArrow = 1
autocmd FileType cpp :setlocal path=.,/usr/include/c++/4.2.1,,
autocmd FileType cpp :let OmniCpp_MayCompleteScope = 0
autocmd FileType cpp :let OmniCpp_SelectFirstItem = 0
" }}}

" filetype c settings"{{{
"autocmd FileType c :setlocal dictionary=/Users/hiroki/.vim/my-dict/c.dict
autocmd FileType c :let OmniCpp_GlobalScopeSearch=1
autocmd FileType c :let OmniCpp_DisplayMode=0
autocmd FileType c :let OmniCpp_ShowPrototypeInAbbr=0
autocmd FileType c :let OmniCpp_ShowAccess=1
autocmd FileType c :let OmniCpp_DefaultNamespaces=[]
autocmd FileType c :let OmniCpp_MayCompleteDot=1
autocmd FileType c :let OmniCpp_MayCompleteArrow = 1
autocmd FileType c :let OmniCpp_MayCompleteScope = 0
autocmd FileType c :let OmniCpp_SelectFirstItem = 0
"}}}

autocmd FileType scheme :setlocal dictionary=/Users/hiroki/.vim/my-dict/scheme.dict

autocmd FileType python :let python_highlight_all=1
"autocmd BufRead *.tex set tw=80

" sample setting "{{{
" --------------------------------------------------

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
    finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
"set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
    set nobackup		" do not keep a backup file, use versions instead
else
    set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching


" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
    set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " For all text files set 'textwidth' to 78 characters.
        autocmd FileType text setlocal textwidth=78

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        " Also don't do it when the mark is in the first line, that is the default
        " position when opening a file.
        autocmd BufReadPost *
                    \ if line("'\"") > 1 && line("'\"") <= line("$") |
                    \   exe "normal! g`\"" |
                    \ endif

    augroup END

else

    set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
    command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
                \ | wincmd p | diffthis
endif
"}}}

" " neosnippet settings"{{{
" " --------------------------------------------------
" imap <C-k>     <Plug>(neosnippet_expand_or_jump)
" smap <C-k>     <Plug>(neosnippet_expand_or_jump)
" xmap <C-k>     <Plug>(neosnippet_expand_target)
"
" " SuperTab like snippets behavior.
" imap <expr><TAB>
" \ pumvisible() ? "\<C-n>" :
" \ neosnippet#expandable_or_jumpable() ?
" \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
"
" " For conceal markers.
" if has('conceal')
"   set conceallevel=2 concealcursor=niv
"   endif
" "}}}
