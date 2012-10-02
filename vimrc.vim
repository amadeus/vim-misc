" Disable wrapping by default
set nowrap
set linebreak


" Indent settings
set tabstop=4
set shiftwidth=4
set noexpandtab
set smartindent
set autoindent
"set cinkeys=0{,0},:,0#,!,!^F


" Show invisibles
set list
"set listchars=tab:›\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set listchars=tab:›\ ,eol:¬,trail:⋅
set showbreak=↪


" Disable matching parens - the real way
let loaded_matchparen = 0


" Allow backspacing over everything in insert mode
set backspace=indent,eol,start


" Lots of history
set history=1000


" Allow buffers to be changed on unsaved files
set hidden


" Searching made less specific
set hlsearch
set incsearch
set ignorecase
set smartcase


" Tab completion when entering filenames
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,.hg,.svn,*.pyc,.vagrant,.gitignore,.DS_Store,*.jpg,*.jpeg,*.png,*.gif,*.bmp


" Syntax, Colorscheme and Gui Options
syntax on
set background=dark

if has("gui_running")
    colorscheme monokai
else
    colorscheme molokai
endif

set guioptions=aAce
set title titlestring=%t
set number
set ruler
set laststatus=2

if has("gui_running")
    set transparency=0
endif


" Improve splitting logic
set splitright
set splitbelow


" Add buffer to cursor while scrolling
set scrolloff=3
set sidescroll=1
set sidescrolloff=3


" Disable annoying keys and fix common errors
noremap     <F1> <Esc>
inoremap    <F1> <Esc>
nnoremap    K    <Nop>
nnoremap    Q    <Nop>
cnoreabbrev W    w
cnoreabbrev Wq   wq
cnoreabbrev WQ   wq
cnoreabbrev Q    q


" Courtney Trolling
inoremap <Up>    <Nop>
inoremap <Down>  <Nop>
inoremap <Left>  <Nop>
inoremap <Right> <Nop>
vnoremap <Up>    <Nop>
vnoremap <Down>  <Nop>
vnoremap <Left>  <Nop>
vnoremap <Right> <Nop>
noremap  <Up>    <Nop>
noremap  <Down>  <Nop>
noremap  <Left>  <Nop>
noremap  <Right> <Nop>


" Various leader shortcuts
let mapleader=","
nmap <leader>w  :w<cr>
nmap <leader>q  :q<cr>
nmap <leader>nn :nohl<cr>
map  <leader>e  :e ~/.vim/bundle/vim-misc/vimrc.vim<cr>
map  <leader>c  :e ~/.vim/bundle/vim-misc/colors/monokai.vim<cr>
map  <leader>h  :so $VIMRUNTIME/syntax/hitest.vim<cr>
map  <leader>u  :GundoToggle<cr>
map  <leader>d  :bd<cr>
map  <leader>s  :setlocal spell!<cr>
" Testing some stuff
map  <leader>gq :diffoff<cr><c-h>:q<cr>:set nowrap<cr>
map  <leader>gg :Gdiff<cr>
map  <leader>ct :CtrlPBufTag<cr>
map  <leader>p  :pwd<cr>



" Vim Fugitive
map <leader>gs :Gstatus<cr>
map <leader>gc :Gcommit -v<cr>
map <leader>gd :Git difftool --staged<cr>
command Gdifft tabedit %|Gdiff


" Slicker way to move around splits
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l


" Powerline Settings
"set guifont=Menlo\ Regular\ for\ Powerline:h12
set guifont=Source\ Code\ Pro:h13
set noshowmode
let g:Powerline_symbols = 'fancy'
"let g:Powerline_theme = "custom"
"let g:Powerline_colorscheme = "custom"
"
" Attempting to theme without a theme!
let g:Powerline_stl_path_style = 'relative'
call Pl#Theme#RemoveSegment('fileencoding')
call Pl#Theme#RemoveSegment('fileformat')


" Set htmldjango.html on all html files
au BufNewFile,BufRead,BufWrite *.html,*.htm setl filetype=htmldjango.html


" A simpler, more refined indent guide enabler
au BufEnter * exe 'IndentGuidesDisable'
au BufEnter *.py,*.rb,Vagrantfile exe 'IndentGuidesEnable'


" Fix Python
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self


" Swap, Undo and Backup Folder Configuration
set directory=~/.vim/swap
set backupdir=~/.vim/backup
set undodir=~/.vim/undo
set backup
set undofile


" Remove trailing whitespace on save
function! Preserve(command)
    " Save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    execute a:command
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
" Execute clear whitespace on save
autocmd BufWritePre * :call Preserve("%s/\\s\\+$//e")


" Automatically read files when they were modified externally
set autoread


" CtrlP Settings
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 20
let g:ctrlp_cache_dir = $HOME.'/.vim/cache/ctrlp'
let g:ctrlp_jump_to_buffer = 1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|env/*'
let g:ctrlp_open_new_file = 'r'
map <leader>t :CtrlP<cr>
map <leader>b :CtrlPBuffer<cr>


" Syntastic
let g:syntastic_auto_loc_list=1
let g:syntastic_javascript_jsl_conf = "-conf ~/.jslintrc"
let g:syntastic_mode_map = { 'mode': 'active',
	\ 'active_filetypes': [],
	\ 'passive_filetypes': ['html', 'htmldjango'] }


" Gist settings
let g:gist_clip_command = 'pbcopy'
let g:gist_open_browser_after_post = 1


" TESTING: - Get file folder
cnoremap %% <C-R>=expand('%:h').'/'<cr>


" TESTING: - Fix marks - Not sure what this does yet, don't want to change
" something I don't use yet
"nnoremap ' `
"nnoremap ` '


" TESTING: - Testing wrap movement
vmap <D-j> gj
vmap <D-k> gk
vmap <D-4> g$
vmap <D-6> g^
vmap <D-0> g^
nmap <D-j> gj
nmap <D-k> gk
nmap <D-4> g$
nmap <D-6> g^
nmap <D-0> g^


" TESTING: Javascript test
"au FileType javascript setl nocindent


" TESTING: Encoding - Required for Powerline
set encoding=utf-8
set ttyfast


" TESTING: Indent Guides
let g:indent_guides_guide_size = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2


" TESTING: Enabling NeoCompleteCache
let g:neocomplcache_enable_at_startup = 1


" TESTING: DetectIndent
let g:detectindent_preferred_expandtab = 0
let g:detectindent_preferred_indent = 4
let g:detectindent_max_lines_to_analyse = 100
let g:detectindent_verbosity = 1
autocmd BufReadPost * :DetectIndent


" TESTING: JS Autocomplete
autocmd FileType python     set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html       set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css        set omnifunc=csscomplete#CompleteCSS
"imap <C-x> <C-x><C-o>


" TESTING: CSS Autocomplete
" autocmd FileType css set omnifunc=csscomplete#CompleteCSS


" TESTING: Actionscript stuff
au BufNewFile,BufRead,BufWrite *.as setl filetype=actionscript


" TESTING: Trailing whitespace indicator in Powerline
call Pl#Theme#InsertSegment('ws_marker', 'after', 'lineinfo')


" TESTING: CtrlP Optimizations
let g:ctrlp_max_files = 10000

let ctrlp_filter_greps = "".
    \ "egrep -iv '\\.(" .
    \ "jar|class|swp|swo|log|so|o|pyc|jpe?g|png|gif|mo|po|DS_Store" .
    \ ")$' | " .
    \ "egrep -v '^(\\./)?(" .
    \ "deploy/|classes/|vendor/|.git/|.hg/|.svn/|.*migrations/" .
    \ ")'"

let my_ctrlp_git_command = "" .
    \ "cd %s && git ls-files | " .
    \ ctrlp_filter_greps

if has("unix")
    let my_ctrlp_user_command = "" .
    \ "find %s '(' -type f -or -type l ')' -maxdepth 15 -not -path '*/\\.*/*' | " .
    \ ctrlp_filter_greps

    let g:ctrlp_user_command = ['.git/', my_ctrlp_git_command, my_ctrlp_user_command]
elseif has('win32')
    let my_ctrlp_user_command = "" .
    \ "dir %s /-n /b /s /a-d" .
    \ ctrlp_filter_greps

    let g:ctrlp_user_command = ['.git/', my_ctrlp_git_command, my_ctrlp_user_command]
else
    let g:ctrlp_user_command = ['.git/', my_ctrlp_git_command]
endif

" TESTING: New way of escaping insert mode
inoremap jj <Esc>


" TESTING: .conf to yaml
au BufNewFile,BufRead *.conf setl filetype=yaml

" TESTING: ZenCoding Tweaks
let g:user_zen_leader_key = '<c-q>'

" TESTING: NerdTree
nmap <leader>nt ::NERDTreeToggle<cr>

" TESTING: Tab completion tests
function! Smart_TabComplete()
    let line = getline('.')                         " current line

    let substr = strpart(line, -1, col('.')+1)      " from the start of the current
    " line to one character right
    " of the cursor
    let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
    if (strlen(substr)==0)                          " nothing to match on empty string
        return "\<tab>"
    endif
    let has_period = match(substr, '\.') != -1      " position of period, if any
    let has_slash = match(substr, '\/') != -1       " position of slash, if any
    if (!has_period && !has_slash)
        return "\<C-X>\<C-P>"                         " existing text matching
    elseif ( has_slash )
        return "\<C-X>\<C-F>"                         " file matching
    else
        return "\<C-X>\<C-O>"                         " plugin matching
    endif
endfunction
inoremap <c-tab> <c-r>=Smart_TabComplete()<cr>

" TESTING: Don't clobber the unnamed register when pasting over text in visual mode.
"          Seems like a bit of a hack, but I'll try it
vnoremap p pgvy

" TESTING: NERDTree settings
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1


" TESTING: Search for selected text
vnoremap <silent> * :<C-U>
\   let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
\   gvy/<C-R><C-R>=substitute(
\   escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
\   gV:call setreg('"', old_reg, old_regtype)<CR>

vnoremap <silent> # :<C-U>
\   let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
\   gvy?<C-R><C-R>=substitute(
\   escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
\   gV:call setreg('"', old_reg, old_regtype)<CR>


" TESTING: Make our shell interactive
set shellcmdflag=-ic


" TESTING: Confirm :help confirm
set confirm


" TESTING: Distraction Free Writing
function! DistractionFreeWriting()
    set lines=40 columns=100           " size of the editable area
    set nonumber
    set nolist
    set fuoptions=background:#001e1e1a " macvim specific setting for editor's background color
    set guioptions-=r                  " remove right scrollbar
    set laststatus=0                   " don't show status line
    set shm=at
    set wrap
    set noruler                        " don't show ruler
    set fullscreen                     " go to fullscreen editing mode
    set linebreak                      " break the lines on words
    set showbreak=
    hi NonText    guifg=#1e1e1a
    hi SpecialKey guifg=#1e1e1a
endfunction


" TESTING: CtrlPBuf Delete
let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }

func! MyCtrlPMappings()
    nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
endfunc

func! s:DeleteBuffer()
    exec "bd" fnamemodify(getline('.')[2:], ':p')
    exec "norm \<F5>"
endfunc


" TESTING: mksession stuff - moved it over to leader key, muuuch better
set sessionoptions=blank,buffers,curdir,folds,tabpages
map <leader>ms :mksession! ~/.vim/.session<cr>
map <leader>rs :source ~/.vim/.session<cr>
