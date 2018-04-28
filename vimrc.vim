" Misc app settings
set linebreak
set encoding=utf-8
set ttyfast
set confirm
set hidden
set foldmethod=manual
set autoread

" Indent settings
set tabstop=4
set shiftwidth=4
set shiftround
set noexpandtab
set smartindent
set autoindent
set smarttab
set nowrap
set display=lastline
set lazyredraw

" Show invisibles
set list
set listchars=tab:›\ ,trail:⋅,nbsp:␣
set showbreak=…

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Lots of history
set history=1000

" Search settings
set nohlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion when entering filenames
set wildmenu
set wildmode=longest:full
set wildignore+=*.o,*.obj,.git,*.rbc,.hg,.svn,*.pyc,.vagrant,.DS_Store,*.jpg,
  \*.eps,*.jpeg,*.png,*.gif,*.bmp,*.psd,*.sublime-project

" Syntax, Colorscheme and Gui Options
syntax on
syntax sync fromstart
set cursorline
set background=dark

" Fold Settings
set foldlevel=99
set foldmethod=syntax
set sessionoptions=buffers,tabpages,curdir,slash
set viewoptions=cursor,slash,curdir

" Format Options
set formatoptions+=njt
set formatoptions-=o
set formatoptions-=r
if exists('&breakindent')
  set breakindent
  set breakindentopt=sbr
endif

" Basically use a fancier colortheme in MacVim
if has("gui_running") || has('nvim')
  colorscheme evokai
else
  colorscheme molokai
endif

set guioptions=aAc
set guicursor=n-v-c:block-Cursor/lCursor-blinkwait300-blinkoff130-blinkon130,ve:ver35-Cursor,o:hor50-Cursor,i-ci:ver25-Cursor/lCursor-blinkwait130-blinkoff130-blinkon130,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait175-blinkoff150-blinkon175
set shortmess=ITaoc
" Set title string to current working directory!
set titlestring=%{substitute(getcwd(),\ $HOME,\ '~',\ '')}
set number
set numberwidth=3
set noruler
set laststatus=2
set fillchars=vert:⋅,fold:-

" Force vim to think of 2 spaces as a sentence
set cpo+=J

" For some reason, it seems that Mac has a different
" font API for declaring the font
if has('gui_running')
  set guifont=Source\ Code\ Pro:h14
endif

" Improve splitting logic
set splitright
set splitbelow

" Add buffer to cursor while scrolling
set scrolloff=3
set sidescroll=1
set sidescrolloff=5

" Disable scrolloff in quickfix
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


" Key remappings
noremap     <F1> <Esc>
inoremap    <F1> <Esc>
inoremap    <c-x><c-x> <c-x><c-o>
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
cnoreabbrev Src source $MYVIMRC
command! Fu :set fu|redraw!
command! Nofu :set nofu|redraw!

" Improved line wrap movement
vnoremap j gj
nnoremap j gj
vnoremap k gk
nnoremap k gk

" Various leader shortcuts
let mapleader="\\"
let maplocalleader="\\"
nnoremap q <nop>
vnoremap q <nop>
nmap q \
vmap q \
nnoremap Q q
vnoremap Q q
nnoremap <F5> :syntax sync fromstart<cr>
nnoremap <leader>nn  :set hls!<cr>
nnoremap <leader>e   :e ~/.vim/bundle/vim-misc/vimrc.vim<cr>
nnoremap <leader>mc  :e ~/.vim/bundle/vim-evokai/colors/evokai.vim<cr>
nnoremap <leader>hh  :so $VIMRUNTIME/syntax/hitest.vim<cr>
nnoremap <leader>u   :MundoToggle<cr>
nnoremap <leader>dd  :bd<cr>
nnoremap <leader>ss  :setlocal spell!<cr>
nnoremap <leader>at  :ALEToggle<cr>
nnoremap <leader>af  :ALEFix<cr>
nnoremap <leader>gg  :Gvdiff<cr>
nnoremap <leader>pp  :pwd<cr>
nnoremap <leader>gs  :Gstatus<cr>
nnoremap <leader>gc  :Gcommit -v<cr>
nnoremap <leader>gd  :Git difftool --staged<cr>
nnoremap <leader>rr  :syntax sync fromstart<cr>
nnoremap <leader>sf  :set filetype=javascript.jsx<cr>
nnoremap <leader>rd  :redraw!<cr>
nnoremap <leader>jd  :FlowJumpToDef<cr>
nmap <d-cr> :set fu!<cr>

" Slicker way to move around splits
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l
nnoremap gF <c-w>v0f.gf

" Improved way of Escaping out of insert mode
inoremap jk <Esc>
inoremap JK <Esc>

" General cursor moves in insert mode
inoremap <c-k> <esc>O
inoremap <c-l> <esc>A
inoremap <c-h> <esc>I
inoremap <c-j> <esc>o
inoremap <c-d> <esc>v^c
inoremap <c-e> <c-x><c-e>
inoremap <c-y> <c-x><c-y>

" Don't clobber the unnamed register when pasting over text in visual mode
vnoremap p pgvy

" Command Mode Improvements
cnoremap <c-k> <up>
cnoremap <c-j> <down>

" Expand folder of current file in command mode
cnoremap %% <c-r>=expand('%:h').'/'<cr>

" Vaffle configs
nnoremap <leader>vv  :Vaffle<cr>
nnoremap <leader>vf  :Vaffle %:h<cr>
nmap <Tab> <Plug>(vaffle-toggle-current)

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
set noswapfile
set undofile


" Remove trailing whitespace on save
function! ClearTrailingWhitespace(command)
  " Allow me to preserve whitespace on certain files
  if exists('b:preserve_whitespace') || exists('g:preserve_whitespace')
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
  echom 'Trailing whitespace cleared'
endfunction

" Execute clear whitespace on save
augroup whitespace
  autocmd!
  autocmd BufWritePre * :call ClearTrailingWhitespace("%s/\\s\\+$//e")
augroup END

"  Toggle whitespace save shortcut
function! ToggleWhitespaceSave(force)
  if a:force == 1
    let b:preserve_whitespace = 1
  elseif exists('b:preserve_whitespace') && b:preserve_whitespace == 1
    unlet b:preserve_whitespace
    echo 'Stripping whitespace on save'
  else
    let b:preserve_whitespace = 1
    echo 'Preserving whitespace on save'
  endif
endfunction
nnoremap <leader>pw :call ToggleWhitespaceSave(0)<cr>


" Gist settings
let g:gist_clip_command = 'pbcopy'
let g:gist_open_browser_after_post = 1


" CtrlP Settings
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:20,results:20'
let g:ctrlp_cache_dir = $HOME.'/.vim/cache/ctrlp'
let g:ctrlp_switch_buffer = 'e'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 0
nnoremap <leader>t :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>mm :CtrlPMRUFiles<cr>
nnoremap <leader>l :CtrlPLine<cr>
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_line_prefix = '› '
let g:ctrlp_map = ''
call ctrlp_bdelete#init()

" CtrlP Optimizations
let ctrlp_filter_greps = "".
  \ "egrep -iv '\\.(" .
  \ "jar|class|swp|swo|log|so|o|pyc|pyo|jpe?g|eps|png|gif|psd" .
  \ "|mo|po|DS_Store|a|beam|tar.gz|tar.bz2|map" .
  \ ")$' | " .
  \ "egrep -v '(\\./)?(" .
  \ ".git/|.rbc/|.hg/|.svn/|.vagrant/|ignore_me/|website/source/|" .
  \ "node_modules/|bower_components/|compressed/|_site/|static_components/|" .
  \ "bin/|env/|build/|static/compressed/|.sass-cache/|webrtc/|Session.vim" .
  \ ")'"

let my_ctrlp_git_command = "" .
  \ "cd %s && git ls-files . -co | " .
  \ ctrlp_filter_greps

if has("unix")
  let my_ctrlp_user_command = "" .
    \ "rg %s --files --color=never --glob '(' -type f -or -type l ')' -not -path '*/\\.*/*' | " .
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
let g:ctrlp_match_func = {'match': 'cpsm#CtrlPMatch'}
let g:user_command_async = 1

augroup omnicomplete
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType html setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  " autocmd FileType javascript setl omnifunc=flowcomplete#Complete
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END


" DetectIndent Settings
let g:detectindent_preferred_indent = 4
let g:detectindent_min_indent = 2
let g:detectindent_max_indent = 8
let g:detectindent_max_lines_to_analyse = 1024
let g:detectindent_preferred_when_mixed = 1
augroup detectindent
  autocmd!
  autocmd BufReadPost * DetectIndent
augroup END


" Search for selected text
vnoremap <silent> <c-s> :<C-U>
  \ let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \ gvy/<C-R><C-R>=substitute(escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \ :call setreg('"', old_reg, old_regtype)<CR>

vnoremap <silent> # :<C-U>
  \ let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \ gvy?<C-R><C-R>=substitute(
  \ escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \ gV:call setreg('"', old_reg, old_regtype)<CR>


" NERDCommenter Tweaks
let g:NERDSpaceDelims = 1


" GitGutter Settings
nmap <d-j> <Plug>GitGutterNextHunk
nmap <d-k> <Plug>GitGutterPrevHunk
nmap <leader>sh <Plug>GitGutterStageHunk
nmap <leader>rh <Plug>GitGutterRevertHunk
nmap <leader>ga <Plug>GitGutterAll
let g:gitgutter_async = 1
let g:gitgutter_eager = 1
let g:gitgutter_realtime = 1
" Testing realtime updating... could ruin Vim performance
" So far it has resulted in awesome performance
" sometimes a bit jumpy... not the end of the world tho
set updatetime=100


" Show the stack of syntax hilighting classes affecting
" whatever is under the cursor.
function! SynStack()
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'),
    \ " > ")
endfunc

nnoremap <F7> :call SynStack()<CR>
inoremap <F7> exec "call SynStack()"


" Better completion
set complete=.,w,b,u,t
" Used to have preview on this puppy - caused all sorts of probs
set completeopt=menuone,menu


" Fugitive Settings - delete fugitive buffers on hide
augroup fugitivefix
  autocmd!
  autocmd BufReadPost fugitive:// setlocal bufhidden=delete
augroup END

augroup gitcommit
  autocmd!
  autocmd FileType gitcommit setlocal nolist
augroup END


" Set markdown textwidth
augroup markdowntextwidth
  autocmd!
  autocmd BufNewFile,BufRead *.md,*.markdown,*.wiki setlocal textwidth=79|set tabstop=2|set shiftwidth=2
augroup END


" Custom Entity Replacements for vim-escaper
let g:CustomEntities = [
  \ ['(c)',  '\&copy;'],
\ ]


" Disabling JSON conceal feature
let g:vim_json_syntax_conceal = 0


" TESTING: .conf to yaml
augroup yaml
  autocmd!
  autocmd BufNewFile,BufRead *.conf setl filetype=yaml
augroup END


" HOLY SHIT THIS SLOWS DOWN MACVIM...
" TESTING: Make our shell interactive
" if has("gui_running")
"   set shellcmdflag=-ic
" endif


" Save as sudo
ca w!! w !sudo tee "%"


" CSS Specific Motions
" Change inner/around CSS Key
onoremap ik :<c-u>execute "normal! ^vt:"<cr>
onoremap ak :<c-u>execute "normal! 0vf:"<cr>

" Change inner/around CSS Property
onoremap ir :<c-u>execute "normal! 0f:lvt;"<cr>
onoremap ar :<c-u>execute "normal! 0f:lvf;"<cr>

" Change function arguments
onoremap ia :<c-u>execute "normal! ^f(vi("<cr>


" Startify Settings
let g:startify_custom_header = [
  \ '                                ______      ',
  \ '            __                /\  ____`\    ',
  \ '   __   __ /\_\    ___ ___    \ \ \___\ \   ',
  \ '  /\ \ /\ \\/\ \ /` __` __`\   \ \  ____ \  ',
  \ '  \ \ \_/ / \ \ \/\ \/\ \/\ \   \ \ \___\ \ ',
  \ '   \ \___/   \ \_\ \_\ \_\ \_\   \ \_______\',
  \ '    \/__/     \/_/\/_/\/_/\/_/    \/_______/',
  \ '                                            ',
  \ '  ==========================================',
  \ '                                            ',
  \ ]
let g:ascii = [
  \ '                                            ',
  \ '============================================',
  \ '                                            ',
  \ 'Copyright Tubez, 2017                       '
  \ ]
let g:startify_custom_footer = 'map(startify#fortune#boxed() + g:ascii, "\"   \".v:val")'
let g:startify_session_autoload = 1
let g:startify_change_to_dir = 1
let g:ctrlp_reuse_window = 'startify'
let g:startify_list_order = ['bookmarks', 'files']
let g:startify_skiplist = [
  \ 'COMMIT_EDITMSG',
  \ $VIMRUNTIME .'/doc',
  \ 'bundle/.*/doc',
  \ '\.DS_Store'
  \ ]
let g:startify_fortune_use_unicode = 1


" Disable startify in terminal vim it just doesn't feel right
if !has("gui_running")
  let g:startify_disable_at_vimenter = 1
endif


" Fancy cursorline settings
" Only set cursorline on the active buffer
" Only highlight the number column
" Change highlight based on mode
" Startify should have full cursorline
function! SetCursorLine(mode)
  highlight CursorLine guifg=NONE guibg=NONE gui=NONE
  highlight CursorLineNr guifg=#121212 guibg=#3cff00 gui=BOLD
  set laststatus=2

  if &buftype == 'quickfix' || a:mode == 'leave' || (exists('&filetype') && (&filetype == 'fugitiveblame' || &filetype == 'gitv'))
    setlocal nocursorline
  else
    setlocal cursorline
  end

  if exists('&filetype') && a:mode == 'enter' && &filetype == 'startify'
    set laststatus=0
    hi CursorLine guibg=#000000
  end
endfunction

function! SetCursorNumber(mode)
  if a:mode == 'enter'
    hi CursorLineNr guifg=#121212 guibg=#008ffd gui=BOLD
  else
    hi CursorLineNr guifg=#121212 guibg=#3cff00 gui=BOLD
  end
endfunction

augroup cursorline
  autocmd!
  autocmd BufEnter,WinEnter,FileType,FocusGained,TabEnter,TabNew,CmdlineLeave,CmdwinLeave * :call SetCursorLine('enter')
  autocmd BufLeave,WinLeave,FocusLost,TabLeave,CmdwinLeave,TabLeave,CmdlineEnter,CmdwinEnter * :call SetCursorLine('leave')
  autocmd InsertLeave * :call SetCursorNumber('leave')
  autocmd InsertEnter * :call SetCursorNumber('enter')
augroup END


" Disable smartindent in python, because it sucks
augroup pythonsmartindent
  autocmd!
  autocmd FileType python setlocal nosmartindent
augroup END


" Fun tiems
iabbrev ldis ಠ_ಠ
iabbrev lsad ಥ_ಥ
iabbrev lhap ಥ‿ಥ
iabbrev lmis ಠ‿ಠ
iabbrev ldiz ( ͠° ͟ʖ ͡°)
vnoremap u <nop>
vnoremap gu u
nnoremap <leader>se :source Session.vim<cr>


" Ale Linter Settings
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'always'
" let g:ale_lint_on_insert_leave = 1
let g:ale_lint_delay = 1000
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 0
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_history_enabled = 20
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%]%s'
if has('mac')
  nmap <silent> ˚ <Plug>(ale_previous_wrap)
  nmap <silent> ∆ <Plug>(ale_next_wrap)
else
  nmap <silent> <a-k> <Plug>(ale_previous_wrap)
  nmap <silent> <a-j> <Plug>(ale_next_wrap)
endif
let g:ale_linters = {'javascript': ['eslint', 'flow'], 'markdown': [], 'python': ['flake8']}

function! ToggleFormatSave()
  if exists('b:ale_fix_on_save') && b:ale_fix_on_save == 1
    let b:ale_fix_on_save = 0
    echo 'Preserving formatting on save'
  else
    let b:ale_fix_on_save = 1
    echo 'Formatting file on save'
  endif
endfunction
nnoremap <leader>pf :call ToggleFormatSave()<cr>

let g:ale_javascript_prettier_use_global = 1
let g:ale_javascript_prettier_options = join([
  \ '--single-quote',
  \ '--jsx-bracket-same-line',
  \ '--print-width 120',
  \ '--trailing-comma es5',
  \ '--no-bracket-spacing',
  \ '--fix'],
  \ ' ')

let g:ale_css_prettier_use_global = 1
let g:ale_css_prettier_options = join(['--parser postcss', '--print-width 120'], ' ')

let g:ale_fixers = {}
let g:ale_fixers.javascript = ['prettier']
let g:ale_fixers.css = ['prettier']


" Grepper Maps
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)


" Enable JSX in files that import react
" function! <SID>EnableJSX()
"   setlocal nosmartindent
"   setlocal noautoindent
"   " Don't attempt this search on a large file
"   if getfsize(expand(@%)) > 100000
"     return
"   endif
"   if search("from\\s\\+['\"]react['\"]", 'npw') || search("require(['\"]react['\"])", 'npw')
"     set filetype=javascript.jsx
"   endif
" endfu
" let g:javascript_fold = 1
" let g:js_fold = 1
" augroup enablejsx
"   autocmd!
"   " autocmd BufNewFile,BufRead *.js call <SID>EnableJSX()
"   autocmd Syntax javascript call <SID>EnableJSX()
" augroup END
let g:jsx_ext_required = 0
augroup jsfixes
  autocmd!
  " autocmd BufNewFile,BufRead *.js call <SID>EnableJSX()
  autocmd Syntax javascript setlocal nosmartindent|setlocal noautoindent
augroup END


" Goyo settings
let g:goyo_margin_top=5
let g:goyo_margin_bottom=5
let g:goyo_width = 90


" JS Syntax Plugins
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1


" Easymotion mappings
map  <leader>/ <Plug>(easymotion-sn)
omap <leader>/ <Plug>(easymotion-tn)
map  <leader>n <Plug>(easymotion-next)
map  <leader>N <Plug>(easymotion-prev)
map  <leader>kk <Plug>(easymotion-overwin-line)
map  <leader>jj <Plug>(easymotion-overwin-line)
map  <leader><leader><leader> <Plug>(easymotion-repeat)
map  <space> <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1


" Vim Flow Settings
let g:flow#enable = 0
let g:flow#autoclose = 1
let g:flow#timeout = 60


" Gitv configuration
let g:Gitv_DoNotMapCtrlKey = 1
let g:Gitv_WipeAllOnClose = 1
let g:Gitv_TruncateCommitSubjects = 1
nnoremap <leader>gv :Gitv! --all<cr>
vnoremap <leader>gv :Gitv! --all<cr>


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


" TESTING: CSS Prefix Macro - converts a webkit prefixed property
" into all the other vender prefixed variety
let @z='Yplct-mozjkYpllxrsYplxroYpdf-Vkkkk:Tabularize /:/r0r0'
let @x='vi{:s/:\ /:/g'
let @c='vi{:s/:/:\ /g'

" Convert keys into key/value pair with same name/value
let @k="^yiwA: \"ysiw'A,j"
" Create React.PropType scaffolding
let @p="0f:wiReact.PropTypes.j0"


" TESTING: IndentLine Settings
let g:indentLine_enabled = 1
let g:indentLine_char = '⋅'
let g:indentLine_first_char = '⋅'
let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_fileTypeExclude = ['help', 'startify', 'markdown']
let g:indentLine_bufNameExclude = ['_.*', 'NERD_tree.*', 'startify']
let g:indentLine_noConcealCursor=1
nnoremap <leader>ii :IndentLinesToggle<cr>


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


" TESTING: Git conflict styles
function! <SID>IsGitConflict()
  " Don't attempt this search on a large file
  if getfsize(expand(@%)) > 100000
    return
  endif
  if search('<<<<<<<', 'npw') && search('>>>>>>>', 'npw')
    runtime misc/gitconflicts.vim
  endif
endfu
" This may be causing issues for me when sourcing
" augroup githighlighting
"   autocmd!
"   autocmd Syntax * call <SID>IsGitConflict()
" augroup END


" TESTING: AsyncRun
command! -bang -nargs=* -complete=file Make AsyncRun -program=make @ <args>


" TESTING: Fastfold
let g:fastfold_max_filesize = 100000


" Easy profiling
function! s:ProfileStart()
  profile start profile.log
  profile func *
  profile file *
endfunction

function! s:ProfileEnd()
  profile pause
  noautocmd qall!
endfunction

command! ProfileStart call s:ProfileStart()
command! ProfileEnd call s:ProfileEnd()


" TESTING: Experiment with this more
" set path+=./node_modules,./discord_uikit
set suffixesadd+=.js
set path+=$PWD/node_modules


" LocalVimRC Settings
let g:localvimrc_sandbox = 0
let g:localvimrc_persistent = 1


" TESTING: Obsession Fix
" Not sure why this is necessary, but at least if fixes Obsession Basically
" Obsession doesn't appear to persist, so instead we have to pause and then
" resume the Obsession task, which requires calling it twice
augroup obsessionfix
  autocmd!
  autocmd SessionLoadPost * silent :Obsession|silent :Obsession
augroup END


" TESTING: Sidescrolling shortcuts
if has('mac')
  nmap <silent> ˙ zh
  nmap <silent> ¬ zl
else
  nmap <silent> <a-h> zh
  nmap <silent> <a-l> zl
endif


" TESTING: Scratch settings
let g:scratch_insert_autohide = 0
let g:scratch_persistence_file = '.scratch.vim'
let g:scratch_filetype = 'markdown'
let g:scratch_horizontal = 1


" TESTING: QuickTask Settings
let g:quicktask_snip_path = '~/.vim/quicksnips'


" TESTING: Profile mappings
nnoremap <silent> <leader>DD :exe ":profile start profile.log"<cr>:exe ":profile func *"<cr>:exe ":profile file *"<cr>
nnoremap <silent> <leader>DP :exe ":profile pause"<cr>
nnoremap <silent> <leader>DC :exe ":profile continue"<cr>
nnoremap <silent> <leader>DQ :exe ":profile pause"<cr>:noautocmd qall!<cr>


" TESTING: Deoplete
" let g:deoplete#enable_at_startup = 1
" let g:neosnippet#enable_completed_snippet = 1
" let g:deoplete#auto_complete_start_length = 1
" let g:deoplete#enable_yarp = 1
" let g:deoplete#file#enable_buffer_path = 1


" TESTING: LanguageClient
" let g:nvim_typescript#javascript_support = 1
" let g:LanguageClient_serverCommands = {
" \ 'javascript': ['flow-language-server', '--stdio'],
" \ 'javascript.jsx': ['flow-language-server', '--stdio'],
" \ }


" TESTING: Always enable hlsearch when searching, but only keep it on if it
" was already set on previously
let g:hl_was_on = 0
function! ToggleHLSearch(enter)
  if a:enter == 1 && v:hlsearch == 1
    let g:hl_was_on = 1
  elseif a:enter == 1
    let g:hl_was_on = 0
    set hlsearch
  elseif a:enter == 0 && g:hl_was_on == 0
    let g:hl_was_on = 0
    set nohlsearch
  else
    let g:hl_was_on = 0
  endif
endfunction

augroup searching
  autocmd!
  if has('CmdlineEnter')
    autocmd CmdlineEnter * :call ToggleHLSearch(1)
    autocmd CmdlineLeave * :call ToggleHLSearch(0)
  endif
augroup END

" TESTING: Vim Jedi - disable completions (we get these through deoplete)
let g:jedi#completions_enabled = 0

" TESTING: Timeouts
set timeoutlen=500

" Completer settings
let g:completor_min_chars = 0
let g:completor_css_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'
let g:completor_disable_buffer = ['markdown']

" Adds a couple CSS Module plugins that we have to highlight properly
function! CSSModuleTweaks()
  syntax match cssProp contained /\%(fixed\|absolute\|relative\|size\)/
endfunction
nnoremap  <leader>css :call CSSModuleTweaks()<cr>

" Airline Settings
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.notexists = ''
let g:airline_symbols.readonly = '×'
let g:airline_theme='evokai'
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#default#section_truncate_width = {}

" TESTING: Airline performance hax
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#csv#enabled = 0
let g:airline#extensions#disable_rtp_load = 1
let g:airline#extensions#eclim#enabled = 0
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#syntastic#enabled = 0
let g:airline#extensions#tagbar#enabled = 0
let g:airline#extensions#vimagit#enabled = 0
let g:airline#extensions#virtualenv#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#tmuxline#enabled = 0
let g:airline#extensions#promptline#enabled = 0
let g:airline#extensions#capslock#enabled = 0
let g:airline#extensions#xkblayout#enabled = 0
let g:airline#extensions#windowswap#enabled = 0
let g:airline#extensions#obsession#enabled = 0
let g:airline#extensions#taboo#enabled = 0
let g:airline#extensions#ycm#enabled = 0
let g:airline#extensions#po#enabled = 0
let g:airline#extensions#nrrwrgn#enabled = 0
let g:airline#extensions#ctrlspace#enabled = 0
let g:airline#extensions#vimtex#enabled = 0
let g:airline#extensions#neomake#enabled = 0
let g:airline#extensions#fugitiveline#enabled = 1
let g:airline#extensions#ale#enabled = 1

" Tabline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#tabs_label = ''

" TESTING: Potential performance improvement
let g:airline_highlighting_cache = 1

" Ensure Airline errors show up in statusline
augroup airlinelint
  autocmd!
  autocmd User ALELint AirlineRefresh
augroup END

let g:airline_mode_map = {
\ '__' : '-',
\ 'n'  : 'N',
\ 'i'  : 'I',
\ 'R'  : 'R',
\ 'c'  : 'C',
\ 'v'  : 'V',
\ 'V'  : 'V',
\ '' : 'V',
\ 's'  : 'S',
\ 'S'  : 'S',
\ '' : 'S',
\ }
