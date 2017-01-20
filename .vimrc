" vim:set foldmethod=marker:
" basic settings"{{{
" --------------------------------------------------
set nocompatible
set expandtab
set tabstop=4
set shiftwidth=4
set cursorline
set nu
set nowrap
set list
set listchars=tab:\ \ ,trail:…,extends:»,precedes:«,nbsp:∫
"}}}

" colorscheme settings"{{{
"write this line above colorscheme

"autocmd ColorScheme * highlight Normal ctermfg=none

autocmd ColorScheme * highlight Normal ctermbg=none
"autocmd ColorScheme * highlight LineNr ctermfg=242
"highlight LineNr ctermfg=238

if &background == "light"
    autocmd ColorScheme * highlight Comment ctermfg=gray
    colorscheme solarized
else
    autocmd ColorScheme * highlight CursorLine ctermbg=238
    autocmd ColorScheme * highlight LineNr ctermbg=236
    " autocmd ColorScheme * highlight Visual ctermbg=240
    "colorscheme twilight256
    colorscheme twilight256
    "colorscheme molokai
endif
"set termguicolors
"let g:solarized_termtrans=1
""}}}

" vim-plug"{{{
call plug#begin('~/.vim/plugged')

Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neoinclude.vim'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
"Plug 'Shougo/neco-syntax'
"Plug 'Shougo/context_filetype.vim'
Plug 'vim-scripts/javacomplete'
Plug 'vim-scripts/OmniCppComplete'

call plug#end()
"}}}

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
autocmd FileType cpp :let OmniCpp_SelectFirstItem = 0"}}}

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

"nnoremap <C-b> :make<CR>
"nnoremap gk k
"nnoremap k gk
"nnoremap gj j
"nnoremap j gj

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

" neocomplete setting "{{{
"----------------------------------------------
"Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
            \ 'default' : '',
            \ 'vimshell' : $HOME.'/.vimshell_hist',
            \ 'scheme' : $HOME.'/.gosh_completions'
            \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] ='\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g> neocomplete#undo_completion()
inoremap <expr><C-l> neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
    return (pumvisible() ? "\<C-y>" : "" ) . "\<CR>"
    For no inserting <CR> key.
    "return pumvisible() ? "\<C-y>" : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? "\<C-y>" : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplete#enable_auto_select = 1
"let g:neocomplete#disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<C-x>\<C-u>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"autocmd FileType c setlocal omnifunc=ccomplete#Complete

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
    let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^.  \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'

" For perlomni.vim setting.
" https://github.com/c9s/perlomni.vim
let g:neocomplete#sources#omni#input_patterns.perl ='\h\w*->\h\w*\|\h\w*::'
"}}}

" neosnippet settings"{{{
" --------------------------------------------------
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB>
\ pumvisible() ? "\<C-n>" :
\ neosnippet#expandable_or_jumpable() ?
\    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
  endif
"}}}
