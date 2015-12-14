" Misc app settings
set linebreak
set encoding=utf-8
set ttyfast
set confirm
set hidden


" Indent settings
set tabstop=4
set shiftwidth=4
set shiftround
set noexpandtab
set smartindent
set autoindent
set smarttab

" Show invisibles
set list
set listchars=tab:›\ ,trail:⋅,nbsp:␣
" eol:¬,
" set showbreak=…


" Disable matching parens - the real way
let loaded_matchparen = 0


" Allow backspacing over everything in insert mode
set backspace=indent,eol,start


" Lots of history
set history=1000


" Searching made less specific
set nohlsearch
set incsearch
set ignorecase
set smartcase


" Tab completion when entering filenames
set wildmode=list:full
set wildignore+=*.o,*.obj,.git,*.rbc,.hg,.svn,*.pyc,.vagrant,.DS_Store,*.jpg,
  \*.eps,*.jpeg,*.png,*.gif,*.bmp,*.psd


" Syntax, Colorscheme and Gui Options
syntax on
syntax sync fromstart
set cursorline
set background=dark

" Basically use a fancier colortheme in
" MacVim
if has("gui_running")
  colorscheme evokai
else
  colorscheme molokai
endif

set guioptions=aAce
set shortmess=ITaoc
set title titlestring=%t
set number
set numberwidth=3
set noruler
set laststatus=2


" For some reason, it seems that Mac has a different
" font API for declaring the font
if has('mac')
  set guifont=Source\ Code\ Pro:h14
else
  set guifont=Source\ Code\ Pro \14
endif


" Improve splitting logic
set splitright
set splitbelow


" Add buffer to cursor while scrolling
set scrolloff=3
set sidescroll=0


" Disable annoying keys and fix common errors
noremap     <F1> <Esc>
inoremap    <F1> <Esc>
nnoremap    K    <Nop>
cnoreabbrev W    w
cnoreabbrev Wq   wq
cnoreabbrev WQ   wq
cnoreabbrev Q    q
cnoreabbrev Qa   qa
cnoreabbrev QA   qa
cnoreabbrev Tabe tabe
cnoreabbrev Edit edit
cnoreabbrev Vsplit vsplit
cnoreabbrev Set  set
cnoreabbrev Cd   cd
cnoreabbrev CD   cd

" Improved line wrap movement
vnoremap j gj
nnoremap j gj
vnoremap k gk
nnoremap k gk

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
let mapleader="q"
nnoremap q <nop>
vnoremap q <nop>
nnoremap Q q
vnoremap Q q
nnoremap <leader>nn  :set hls!<cr>
nnoremap <leader>e   :e ~/.vim/bundle/vim-misc/vimrc.vim<cr>
nnoremap <leader>mc  :e ~/.vim/bundle/vim-evokai/colors/evokai.vim<cr>
nnoremap <leader>hh  :so $VIMRUNTIME/syntax/hitest.vim<cr>
nnoremap <leader>u   :UndotreeToggle<cr>
nnoremap <leader>dd  :bd<cr>
nnoremap <leader>ss  :setlocal spell!<cr>
nnoremap <leader>st  :SyntasticToggle<cr>
nnoremap <leader>gg  :Gvdiff<cr>
nnoremap <leader>pp  :pwd<cr>
nnoremap <leader>a   :Ack '
nnoremap <leader>nt  :NERDTreeToggle<cr>
nnoremap <leader>gs  :Gstatus<cr>
nnoremap <leader>gc  :Gcommit -v<cr>
nnoremap <leader>gd  :Git difftool --staged<cr>

" Slicker way to move around splits
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

" Improved way of Escaping out of insert mode
inoremap jk <Esc>
inoremap JK <Esc>

" General cursor moves in insert mode
inoremap <c-k> <esc>O
inoremap <c-l> <esc>A
inoremap <c-h> <esc>I
inoremap <c-j> <esc>o
inoremap <c-d> <esc>v^c

" Expand folder of current file in command mode
cnoremap %% <c-r>=expand('%:h').'/'<cr>

" Simplified commands for NeoBundle
command! BU :NeoBundleUpdate!
command! BL :NeoBundleUpdatesLog
let g:neobundle#install_process_timeout = 120


" Powerline Settings
set noshowmode
if has("gui_running")
  let g:Powerline_symbols = 'fancy'
endif


" Swap, Undo and Backup Folder Configuration
set directory=~/.vim/swap
set backupdir=~/.vim/backup
set undodir=~/.vim/undo
set nobackup
set undofile


" Remove trailing whitespace on save
function! ClearTrailingWhitespace(command)
  " Allow me to preserve whitespace on certain files
  if exists('b:pw') || exists('b:preserve')
    return
  endif
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
augroup whitespace
  autocmd!
  autocmd BufWritePre * :call ClearTrailingWhitespace("%s/\\s\\+$//e")
augroup END

"  Toggle whitespace save shortcut
function! ToggleWhitespaceSave()
  if exists('b:pw') && b:pw == 1
    unlet b:pw
    echo 'Stripping whitespace on save'
  else
    let b:pw = 1
    echo 'Preserving whitespace on save'
  endif
endfunction

nnoremap <leader>pw :call ToggleWhitespaceSave()<cr>


" Automatically read files when they were modified externally
set autoread


" CtrlP Settings
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
let g:ctrlp_cache_dir = $HOME.'/.vim/cache/ctrlp'
let g:ctrlp_switch_buffer = 'e'
let g:ctrlp_open_new_file = 'r'
nnoremap <leader>t :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>l :CtrlPLine<cr>
let g:ctrlp_clear_cache_on_exit = 0
" I can't theme this yet... so not using it... yet
let g:ctrlp_line_prefix = '› '
" To be used when CtrlP get's updated with the new BufferExplorer
" let g:ctrlp_prompt_mappings = {
"   \ 'PrtDeleteEnt()':       ['<c-@>']
" \ }
call ctrlp_bdelete#init()


" Syntastic
let g:syntastic_auto_loc_list=1
let g:syntastic_reuse_loc_lists=0
" let g:syntastic_javascript_syntax_checker="jshint"
" let g:syntastic_javascript_checkers=["jscs", "jshint"]
let g:syntastic_javascript_checkers=["jshint"]
let g:syntastic_css_checker=["csslint"]
let g:syntastic_enable_highlighting = 0
let g:syntastic_python_checkers = ['pyflakes', 'pep8']
let g:syntastic_enable_highlighting = 1
let g:syntastic_sass_check_partials = 1
let g:syntastic_mode_map = {
  \ 'mode': 'active',
  \ 'active_filetypes': [],
  \ 'passive_filetypes': [
  \   'html',
  \   'xhtml',
  \   'jinja',
  \   'css',
  \   'scss'
  \ ] }
" \   'htmldjango',
" Ignoring line length issues, ignoring spacing around a : in a hash
" definition since I like to use Tabularize for alignment. And I think
" it looks better!
let g:syntastic_python_pep8_args='--ignore=E221,E501,E502,W391,E126'


" Gist settings
let g:gist_clip_command = 'pbcopy'
let g:gist_open_browser_after_post = 1


" CtrlP Optimizations
let g:ctrlp_max_files = 10000

let ctrlp_filter_greps = "".
  \ "egrep -iv '\\.(" .
  \ "jar|class|swp|swo|log|so|o|pyc|pyo|jpe?g|eps|png|gif|psd" .
  \ "|mo|po|DS_Store|a|beam|tar.gz|tar.bz2|map" .
  \ ")$' | " .
  \ "egrep -v '^(\\./)?(" .
  \ ".git/|.rbc/|.hg/|.svn/|.vagrant/|ignore_me/|website/source/|" .
  \ "node_modules/|bower_components/|compressed/|_site/|static_components/|" .
  \ "bin/|env/|build/|static/compressed/|.sass-cache/|Session.vim" .
  \ ")'"

let my_ctrlp_git_command = "" .
  \ "cd %s && git ls-files . -co | " .
  \ ctrlp_filter_greps

if has("unix")
  let my_ctrlp_user_command = "" .
    \ "find %s '(' -type f -or -type l ')' -not -path '*/\\.*/*' | " .
    \ ctrlp_filter_greps .
    \ " | head -" . g:ctrlp_max_files

  let g:ctrlp_user_command = ['.git/', my_ctrlp_git_command,
    \ my_ctrlp_user_command]
elseif has('win32')
  let my_ctrlp_user_command = "" .
    \ "dir %s /-n /b /s /a-d" .
    \ ctrlp_filter_greps

  let g:ctrlp_user_command = ['.git/', my_ctrlp_git_command,
    \ my_ctrlp_user_command]
else
  let g:ctrlp_user_command = ['.git/', my_ctrlp_git_command]
endif


" NeoComplete Settings
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_fuzzy_completion = 1
let g:neocomplete#auto_completion_start_length = 1
let g:neocomplete#data_directory = $HOME.'/.vim/cache/neocompl'
let g:neocomplete#min_keyword_length = 4
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#enable_smart_case = 1

" Fix bizzaro full line autocomplete
" inoremap <expr><BS>  neocomplete#smart_close_popup()."\<C-h>"

augroup omnicomplete
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
  " Commenting out in favor of tern#CompleteJS as a test
  " autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType javascript setlocal omnifunc=tern#Complete
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END


" DetectIndent Settings
let g:detectindent_preferred_expandtab = 0
let g:detectindent_preferred_indent = 4
let g:detectindent_max_lines_to_analyse = 1024
augroup detectindent
  autocmd!
  autocmd BufReadPost * :DetectIndent
augroup END


" TESTING: .conf to yaml
augroup yaml
  autocmd!
  autocmd BufNewFile,BufRead *.conf setl filetype=yaml
augroup END


" TESTING: ZenCoding Tweaks
let g:user_zen_leader_key = '<c-q>'


" TESTING: Don't clobber the unnamed register when pasting over
" text in visual mode. Seems like a bit of a hack, but I'll try it
vnoremap p pgvy


" TESTING: NERDTree settings
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeIgnore=['\.pyc$']
augroup nerdtree
  autocmd!
  " Hiding list chars because of the cursorline in NERDTree
  autocmd FileType nerdtree setlocal nolist
augroup END


" TESTING: Search for selected text
vnoremap <silent> <c-s> :<C-U>
  \ let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \ gvy/<C-R><C-R>=substitute(
  \ escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \ gV:call setreg('"', old_reg, old_regtype)<CR>

vnoremap <silent> # :<C-U>
  \ let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \ gvy?<C-R><C-R>=substitute(
  \ escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \ gV:call setreg('"', old_reg, old_regtype)<CR>


" TESTING: Make our shell interactive
set shellcmdflag=-ic


" TESTING: Save as sudo
ca w!! w !sudo tee "%"


" TESTING: CSS Specific Motions
" Change inner/around CSS Key
onoremap ik :<c-u>execute "normal! ^vt:"<cr>
onoremap ak :<c-u>execute "normal! 0vf:"<cr>

" Change inner/around CSS Property
onoremap ir :<c-u>execute "normal! 0f:lvt;"<cr>
onoremap ar :<c-u>execute "normal! 0f:lvf;"<cr>

" Change function arguments
onoremap ia :<c-u>execute "normal! ^f(vi("<cr>


" TESTING: Javascript and CSS folding - also force all folds open
augroup syntaxfolding
  autocmd!
  autocmd FileType javascript,json,css,html setlocal foldenable|
  \ setlocal foldmethod=syntax|setlocal foldlevel=20
augroup END


" TESTING: NeoComplete Settings tests
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" if !exists('g:neocomplete#force_omni_input_patterns')
"   let g:neocomplete#force_omni_input_patterns = {}
" endif
" let g:neocomplete#force_omni_input_patterns.javascript = '[^. \t]\.\w*'
" let g:neocomplete#force_omni_input_patterns.javascript = '\h\w*\|[^. \t]\.\w*'

" Attempting to fix neocomplete converter_case
call neocomplete#custom#source('_', 'converters',
  \ ['converter_remove_overlap', 'converter_remove_last_paren',
  \  'converter_delimiter', 'converter_abbr'])

" TESTING: Force vim to think of 2 spaces as a sentence
set cpo+=J


" TESTING: NERDCommenter Tweaks
let g:NERDSpaceDelims = 1


" TESTING: Signify/GitGutter Settings
nmap <leader>gj <Plug>GitGutterNextHunk
nmap <leader>gk <Plug>GitGutterPrevHunk
nmap <leader>sh <Plug>GitGutterStageHunk
nmap <leader>rh <Plug>GitGutterRevertHunk
nmap <leader>ga <Plug>GitGutterAll
" Testing realtime updating... could ruin Vim performance
" So far it has resulted in awesome performance
" sometimes a bit jumpy... not the end of the world tho
set updatetime=200

" Old signify mappings, in case I ever revert
" let g:signify_mapping_next_hunk = '<leader>j'
" let g:signify_mapping_prev_hunk = '<leader>k'
" let g:signify_vcs_list = [ 'git', 'hg' ]
" let g:signify_skip_filetype = { 'help': 1 }


" TESTING: Show the stack of syntax hilighting classes affecting
" whatever is under the cursor.
function! SynStack()
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'),
    \ " > ")
endfunc

nnoremap <F7> :call SynStack()<CR>


" TESTING: Better completion?
set complete=.,w,b,u,t
" Used to have preview on this puppy - caused all sorts of probs
" set completeopt=menuone,preview
set completeopt=menuone


" TESTING: Fun tiems
iabbrev ldis ಠ_ಠ
iabbrev lsad ಥ_ಥ
iabbrev lhap ಥ‿ಥ
iabbrev lmis ಠ‿ಠ
iabbrev ldiz ( ͠° ͟ʖ ͡°)
vnoremap u <nop>
vnoremap gu u
" nnoremap <leader>sx :syntax sync fromstart<cr>:redraw!<cr>
nnoremap <leader>se :source Session.vim<cr>


" TESTING: fuck swapfiles
set noswapfile


" TESTING: New JSBeautify Stuff
nnoremap <leader>fj :call JsBeautify()<cr>
nnoremap <leader>fh :call HtmlBeautify()<cr>
nnoremap <leader>fc :call CSSBeautify()<cr>


" TESTING: Set htmldjango.html on all html files - don't need this?
augroup htmljinja
  autocmd!
  " By forcing htmldjango to htmldjango.html, I allow snipmate to work
  " autocmd FileType html setl filetype=htmldjango
  " Fix data- attributes in html elements
  autocmd Syntax html setlocal iskeyword+=-
  autocmd Syntax jinja setlocal iskeyword+=-
  " autocmd Syntax htmldjango setlocal iskeyword+=-
augroup END


" TESTING: Startify Settings
let g:startify_bookmarks = [
  \ '~/Sites/app.kiip.me',
  \ '~/Sites/kiip.me',
  \ '~/Development/ether/App',
  \ '~/Dropbox/Ether/story',
  \ '~/Development/Engine.js',
  \ '~/.vim/bundle',
  \ ]
" \ '~/Sites/eightbit.me',

if filereadable(expand('$HOME/.vim/misc/bookmarks.vim'))
  source $HOME/.vim/misc/bookmarks.vim
endif

let g:startify_custom_header = [
  \ '                                _________  __  __',
  \ '            __                 /\_____   \/\ \/\ `\',
  \ '   __   __ /\_\    ___ ___     \/____/   /\ \ \ \  \',
  \ '  /\ \ /\ \\/\ \ /` __` __`\        /   /  \ \ \_\  \__',
  \ '  \ \ \_/ / \ \ \/\ \/\ \/\ \      /   / __ \ \___   __\',
  \ '   \ \___/   \ \_\ \_\ \_\ \_\    /\__/ /\_\ \/___/\_\_/',
  \ '    \/__/     \/_/\/_/\/_/\/_/    \/_/  \/_/      \/_/',
  \ '',
  \ '  ======================================================',
  \ '',
  \ ]

let g:startify_custom_footer = [
  \ '',
  \ '  ======================================================',
  \ '',
  \ '  Copyright Tubez, 2015'
  \ ]

let g:NERDTreeHijackNetrw = 0
let g:startify_session_autoload = 1
let g:ctrlp_reuse_window = 'startify'
let g:startify_list_order = ['bookmarks', 'files']
let g:startify_change_to_dir = 1

let g:startify_skiplist = [
  \ 'COMMIT_EDITMSG',
  \ $VIMRUNTIME .'/doc',
  \ 'bundle/.*/doc',
  \ '\.DS_Store'
  \ ]


" Disable startify in terminal vim
" it just doesn't feel right
if !has("gui_running")
  let g:startify_disable_at_vimenter = 1
endif

augroup startify
  autocmd!
  " Hacky way to disable Powerline in Startify
  autocmd BufNew * set laststatus=2|highlight CursorLine guibg=NONE
  autocmd FileType startify set laststatus=0|highlight CursorLine guibg=#000000|setlocal cursorline
augroup END


" Enabling my old snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/vim-misc/snippets'


" Disable smartindent in python, because it sucks
augroup pythonsmartindent
  autocmd!
  autocmd FileType python setlocal nosmartindent
augroup END


" TESTING: CSS Prefix Macro - converts a webkit prefixed property
" into all the other vender prefixed variety
let @z='Yplct-mozjkYpllxrsYplxroYpdf-Vkkkk:Tabularize /:/r0r0'
let @x='vi{:s/:\ /:/g'


" TESTING: Adding more fonts to CSS
" syn keyword cssFontAttr contained
augroup cssupdates
  autocmd!
  autocmd FileType css,scss syn keyword cssFontAttr contained Inconsolata Noteworthy AvenirNext Medium Avenir Next
augroup END


" TESTING: Command Mode Improvements
cnoremap <c-k> <up>
cnoremap <c-j> <down>


" TESTING: Gitv configuration
let g:Gitv_DoNotMapCtrlKey = 1
let g:Gitv_WipeAllOnClose = 1
nnoremap <leader>gv :Gitv! --all<cr>
vnoremap <leader>gv :Gitv! --all<cr>
" cabbrev git Git
" let g:Gitv_TruncateCommitSubjects = 1


" TESTING: IndentLine Settings
let g:indentLine_enabled = 0
let g:indentLine_char = '⋅'
let g:indentLine_first_char = '⋅'
let g:indentLine_color_gui = '#444444'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_indentLevel = 5
let g:indentLine_faster = 1
let g:indentLine_fileType = ['python', 'py']
let g:indentLine_fileTypeExclude = ['help', 'vim', 'javascript', 'startify']
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*', 'startify']
let g:indentLine_noConcealCursor=1


" TESTING: Return to last known position in file
augroup restorecursor
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")
    \ |exe "normal! g`\"" | endif
augroup END


" TESTING: Tweaks to split fillchars
set fillchars+=vert:┆


" TESTING: Enable Github flavored markdown
augroup markdown
    autocmd!
    " autocmd BufNewFile,BufRead *.md,*.markdown setlocal textwidth=79
    autocmd BufNewFile,BufRead *.md,*.markdown setlocal filetype=ghmarkdown |setlocal textwidth=79
augroup END


" TESTING: Enable cursorline on gitcommit
augroup gitcommit
  autocmd!
  autocmd FileType gitcommit setlocal nolist
augroup END


" TESTING: Long wrapped line stuff
set display=lastline


" TESTING: Better fugitive file support
" I want the fugitive buffers to just delete themselves
" if I close them; no need for them to stick around.
" It also helps with auto closing diff views
augroup fugitivefix
  autocmd!
  autocmd BufReadPost fugitive:// set bufhidden=delete
augroup END


" TESTING: NeoSnippets - Attempting to move away from
" the use of a tab character, since it triggers bugs sometimes
imap <c-a> <Plug>(neosnippet_expand_or_jump)
smap <c-a> <Plug>(neosnippet_expand_or_jump)
xmap <c-a> <Plug>(neosnippet_expand_target)


" TESTING: Set JSON Filetype
augroup json
  au!
  au BufRead,BufNewFile .jshintrc set filetype=json
augroup END


" TESTING: Disabling JSON conceal feature
let g:vim_json_syntax_conceal = 0


" TEMP: This is to better train myself for the new preserve whitespace B.S.
nnoremap <leader>p <nop>


" TESTING: Format Options Tweaks
set formatoptions+=njt
set formatoptions-=o


" TESTING: Breakindent
if exists('&breakindent')
  set breakindent
endif
" set breakindentopt=sbr


" TESTING: ColorColumn Jazz
" I only want my special ColorColumn used on the JS filetype
" It requires that I add and remove it on a per file/window basis
function! ToggleColorColumn()
  " Only run matchadd if it doesn't exist in a JS file
  if &filetype == 'javascript' && !exists('w:js_color_column')
    let w:js_color_column = matchadd('ColorColumn', '\%121v', -1)
  " Otherwise clear it out completely
  elseif &filetype != 'javascript' && exists('w:js_color_column')
    call matchdelete(w:js_color_column)
    unlet w:js_color_column
  end
endfunction

augroup colorColumn
  autocmd!
  autocmd BufEnter * :call ToggleColorColumn()
augroup END


" Troll
" highlight ColorColumn guibg=#000000 guifg=#444444
" exec 'set colorcolumn=' . join(range(2,80,3), ',')


" TESTING: New easy-motion
map <leader><leader><leader> <Plug>(easymotion-repeat)
map <SPACE> <Plug>(easymotion-s)

" Crazy easymotion searches
map  <leader>/ <Plug>(easymotion-sn)
omap <leader>/ <Plug>(easymotion-tn)
map  <leader>n <Plug>(easymotion-next)
map  <leader>N <Plug>(easymotion-prev)
map  <leader>k <Plug>(easymotion-bd-jk)
map  <leader>j <Plug>(easymotion-bd-jk)
" map  <leader>k <Plug>(easymotion-k)
let g:EasyMotion_smartcase = 1


" TESTING: JS Indent Tweaks
let g:javascript_indent_to_parens = 0


" TESTING: Dope patch - not integrated yet
if exists('&indentmarker')
  " set indentmarker=⋅
  set indentmarker=•

  augroup showindent
    autocmd!
    autocmd FileType * setlocal showindent
    autocmd FileType help,startify,markdown,nerdtree,git setlocal noshowindent
  augroup END

  " For some reason I have to set this after showindent or
  " incsearch never gets set for some weird reason
  set incsearch
endif


" TESTING: Fix quickfix scrollof
function! SetScrolloff()
  if &buftype=='quickfix'
    setlocal scrolloff=0
  else
    setlocal scrolloff=3
  endif
endfunction

augroup fixscrolloff
  autocmd!
  autocmd Filetype,BufEnter,BufCreate,BufAdd * :call SetScrolloff()
augroup END


" TESTING: Dos Long Lines Doh
set synmaxcol=3000


" TESTING: csv.vim
let g:csv_delim=','


" TESTING: Fix quickfix
augroup fixquickfix
  autocmd!
  autocmd FileType qf setlocal nocursorline
augroup END


" TESTING: Custom Entity Replacements
let g:CustomEntities = [
  \ ['(c)',  '\&copy;'],
\ ]


" TESTING: CloseTag
inoremap <C-_> <C-R>=GetCloseTag()<CR>


" TESTING: GitGutter Fixes
let g:gitgutter_max_signs = 500
" set textwidth=80 - causes a major issue in html files - need to figure out

" TESTING: Vim Javascript indent tests
let g:javascript_indent_to_parens=0

" TESTING: WindowSapper
let g:windowswap_map_keys = 0
nnoremap <silent> <leader>wy :call WindowSwap#MarkWindowSwap()<CR>
nnoremap <silent> <leader>wp :call WindowSwap#DoWindowSwap()<CR>
nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>


" TESTING: Better sessionoptions
set sessionoptions=buffers,curdir,help,tabpages


" TESTING: NeoSnippets - hide cursor jump positions
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

let g:startify_session_autoload = 1
let g:startify_session_dir = '.'

" TESTING: Don't screw up folds when inserting text that might affect them, until
" leaving insert mode. Foldmethod is local to the window. Protect against
" screwing up folding when switching between windows.
augroup fixfoldmethod
  autocmd!
  autocmd InsertEnter javascript if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
  autocmd InsertLeave,WinLeave javascript if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif
augroup END


" TESTING: Mostly due to Gitv, however seeing if it
" might help with larger files and doin shiiiz
set lazyredraw
nnoremap <F5> :syntax sync fromstart<cr>


" TESTING: Fu/Nofu shortcuts
command! Fu :set fu|redraw!
command! Nofu :set nofu|redraw!


" TESTING: Turn off CursorLine on non active buffers and change the numberline color dependng on the mode
augroup cursorline
  autocmd!
  hi CursorLine guifg=NONE guibg=NONE gui=NONE
  autocmd BufLeave,BufWinLeave,FocusLost * setlocal nocursorline
  autocmd BufEnter,TabEnter,WinEnter,BufWinEnter,FocusGained * setlocal cursorline
  autocmd InsertLeave * hi CursorLineNr guifg=#121212 guibg=#3cff00 gui=BOLD
  autocmd InsertEnter * hi CursorLineNr guifg=#121212 guibg=#008ffd gui=BOLD
augroup END

" TESTING: Better sourcing of vimrc
cnoreabbrev Src source $MYVIMRC

" TESTING: Goyo settings
let g:goyo_margin_top=5
let g:goyo_margin_bottom=5
