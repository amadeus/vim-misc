" Misc app settings
set encoding=utf-8
scriptencoding utf-8
set linebreak
set ttyfast
set confirm
set hidden
set autoread
set nomodeline

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
set updatetime=100
set belloff=esc
set clipboard=unnamed
set backupcopy=yes

" Show invisibles
set list
set listchars=tab:›\ ,trail:⋅,nbsp:␣
set showbreak=…
set noshowmode
" Have the showbreak appear in the number column
set cpoptions+=n
augroup terminal_list_tweaks
  autocmd!
  autocmd TerminalOpen * setlocal nolist
augroup END

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Lots of history
set history=1000

" Search settings
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion when entering filenames
set wildmenu
set wildmode=longest:full
set wildignore+=*.o,*.obj,.git,*.rbc,.hg,.svn,*.pyc,.vagrant,.DS_Store,*.jpg,
  \*.eps,*.jpeg,*.png,*.gif,*.bmp,*.psd,*.sublime-project

" Syntax, Colorscheme and Gui Options
" This should be before syntax on
set background=dark
syntax on
syntax sync fromstart
set cursorline

" Fold Settings
set foldlevel=99
" foldmethod=syntax is REALLY slow, so is FastFold, indent is
" close enough and is very performant
set foldmethod=indent
" set foldmethod=syntax
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
if has('termguicolors')
  set termguicolors
  colorscheme evokai
else
  colorscheme molokai
endif

set guioptions=c
set guicursor=n-v-c:block-Cursor/lCursor-blinkwait300-blinkoff300-blinkon300,ve:ver35-Cursor,o:hor15-Cursor,i-ci-c:ver25-Cursor/lCursor-blinkwait300-blinkoff300-blinkon300,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait300-blinkoff300-blinkon300
set shortmess=ITaoc
" Set title string to current working directory!
set titlestring=%{substitute(getcwd(),\ $HOME,\ '~',\ '')}
set noruler
set fillchars=vert:⋅,fold:-

" Don't clobber the unnamed register when pasting over text in visual mode
vnoremap p pgvy

set number
set numberwidth=3
augroup hidenumber
  autocmd!
  autocmd FileType vaffle setlocal nonumber
augroup END

set signcolumn=yes
augroup hidesigns
  autocmd!
  autocmd BufNew * setlocal signcolumn=yes
  autocmd BufNew __Scratch__ setlocal signcolumn=no
  autocmd BufNew .scratch.md setlocal signcolumn=no
  autocmd FileType vim-plug,vaffle,qf,help,startify,markdown,nerdtree,git,gitcommit setlocal signcolumn=no
augroup END

set laststatus=2
augroup laststatus
  autocmd!
  autocmd BufNew * setlocal laststatus=2
  autocmd FileType startify setlocal laststatus=0
augroup END

" Force vim to think of 2 spaces as a sentence
set cpoptions+=J

" For some reason, it seems that Mac has a different
" font API for declaring the font
if has('gui_running')
  " Keeing this for reference - but trying out a new font
  " set guifont=SourceCodePro-Medium:h14
  set guifont=InputMono-Regular:h15
  " Using linespace=4 and disabling the old fontsize stuff will enable me to
  " resize the font better and have it stay visually centered, since it has a
  " built in 1.2 line-height which really messes with things
  set linespace=4
  " Slight spacing tweak to make font not look so spread out
  set columnspace=-1
endif

" Improve splitting logic
set splitright
set splitbelow

" Add buffer to cursor while scrolling
set scrolloff=3
" Trying the default value here... might be fun... might be annoying
set sidescroll=0
set sidescrolloff=5

" Better completion
set complete=.,w,b,u,t

" Used to have preview on this puppy - caused all sorts of probs
set completeopt=menuone,menu,noselect,noinsert

" Diff settings
set diffopt+=algorithm:patience,vertical,indent-heuristic

" Disable scrolloff in quickfix
function! SetScrolloff()
  if &buftype ==? 'quickfix'
    setlocal scrolloff=0
  else
    setlocal scrolloff=3
  endif
endfunction

augroup fixscrolloff
  autocmd!
  autocmd Filetype,BufEnter,BufCreate,BufAdd * :call SetScrolloff()
augroup END


" Key Mappings
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
cnoreabbrev db   bd
cnoreabbrev Tabe tabe
cnoreabbrev Edit edit
cnoreabbrev Vsplit vsplit
cnoreabbrev Set  set
cnoreabbrev Cd   cd
cnoreabbrev CD   cd
cnoreabbrev Src source $MYVIMRC
command! Fu :set fu!|redraw!
" Make closing buffers easier
nnoremap    <c-w>q :bd<cr>

" Improved line wrap movement
vnoremap j gj
nnoremap j gj
vnoremap k gk
nnoremap k gk

" Various leader shortcuts
nnoremap q <nop>
vnoremap q <nop>
let g:mapleader='q'
let g:maplocalleader='q'
nnoremap Q q
vnoremap Q q
nnoremap <F5> :syntax sync fromstart<cr>
nnoremap <leader>nn  :set hls!<cr>
nnoremap <leader>e   :e ~/.vim/bundle/vim-misc/vimrc.vim<cr>
nnoremap <leader>mc  :e ~/.vim/bundle/vim-evokai/colors/evokai.vim<cr>
nnoremap <leader>hh  :runtime! /syntax/hitest.vim<cr>
nnoremap <leader>u   :MundoToggle<cr>
nnoremap <leader>dd  <c-w>h:bd<cr>
nnoremap <leader>ss  :setlocal spell!<cr>
nnoremap <leader>gg  :Gvdiff<cr>
nnoremap <leader>pp  :pwd<cr>
nnoremap <leader>gs  :Gstatus<cr>
nnoremap <leader>gc  :Gcommit -v<cr>
nnoremap <leader>gd  :silent Git difftool --staged<cr>
nnoremap <leader>rr  :syntax sync fromstart<cr>
nnoremap <leader>sf  :set filetype=javascript.jsx<cr>
nnoremap <leader>rd  :redraw!<cr>
nnoremap <leader>w   :w<cr>
nmap <d-cr> :set fu!<cr>

" Slicker way to move around splits
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l
nnoremap gF <c-w>vg_hhgf

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

" Command Mode Improvements
cnoremap <c-k> <up>
cnoremap <c-j> <down>

" Expand folder of current file in command mode
cnoremap %% <c-r>=expand('%:h').'/'<cr>

" Disable weird middle mouse behavior
nnoremap <MiddleMouse> <Nop>
nnoremap <2-MiddleMouse> <Nop>
nnoremap <3-MiddleMouse> <Nop>
nnoremap <4-MiddleMouse> <Nop>
inoremap <MiddleMouse> <Nop>
inoremap <2-MiddleMouse> <Nop>
inoremap <3-MiddleMouse> <Nop>
inoremap <4-MiddleMouse> <Nop>
vnoremap <MiddleMouse> <Nop>
vnoremap <2-MiddleMouse> <Nop>
vnoremap <3-MiddleMouse> <Nop>
vnoremap <4-MiddleMouse> <Nop>

" Sidescrolling shortcuts
if has('mac')
  " <opt-h>
  nmap <silent> ˙ zh
  " <opt-l>
  nmap <silent> ¬ zl
else
  " <alt-h>
  nmap <silent> <a-h> zh
  " <alt-l>
  nmap <silent> <a-l> zl
endif

" Vaffle configs
nnoremap <leader>vv  :Vaffle<cr>
nnoremap <leader>vf  :Vaffle %:h<cr>
augroup vaffletab
  autocmd!
  autocmd FileType vaffle nmap <buffer> <Tab> <Plug>(vaffle-toggle-current)
  autocmd FileType vaffle nmap <buffer> s <Plug>(vaffle-open-selected-vsplit)
augroup END

" Swap, Undo and Backup Folder Configuration
set directory=~/.vim/swap
set backupdir=~/.vim/backup
set undodir=~/.vim/undo
set nobackup
set noswapfile
set undofile

" Search for selected text
function! GetSelection()
    let old_reg = getreg('v')
    normal! gv"vy
    let raw_search = getreg('v')
    call setreg('v', old_reg)
    return substitute(escape(raw_search, '\/.*$^~[]'), "\n", '\\n', 'g')
endfunction

vnoremap <c-s> <C-c>/<C-r>=GetSelection()<CR><CR>
vnoremap # <C-c>?<C-r>=GetSelection()<CR><CR>

" .conf to yaml
augroup yaml
  autocmd!
  autocmd BufNewFile,BufRead *.conf setl filetype=yaml
augroup END

" CSS Specific Motions
" Change inner/around CSS Key
onoremap ik :<c-u>execute "normal! ^vt:"<cr>
onoremap ak :<c-u>execute "normal! 0vf:"<cr>

" Change inner/around CSS Property
onoremap ir :<c-u>execute "normal! 0f:lvt;"<cr>
onoremap ar :<c-u>execute "normal! 0f:lvf;"<cr>

" Paste whatever is in the default register as a react prop
nnoremap <leader>po :<c-u>execute 'normal a <c-r>"={<c-r>"'<cr>
nnoremap <leader>Po :<c-u>execute 'normal i <c-r>"={<c-r>"'<cr>

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
command! MiniTerm term ++rows=10

function! WipeoutBuffers()
  exec '%bwipeout'
endfunction
command! -nargs=0 Wipeout call WipeoutBuffers()


" ==== PLUGIN SETTINGS ===

" Gist settings
let g:gist_clip_command = 'pbcopy'
let g:gist_open_browser_after_post = 1


" DetectIndent Settings
let g:detectindent_max_lines_to_analyse = 1024
augroup detectindent
  autocmd!
  autocmd BufReadPost * DetectIndent
augroup END


" Fugitive Settings - delete fugitive buffers on hide
" let g:fugitive_autoreload_status = 1
augroup fugitivefix
  autocmd!
  autocmd BufReadPost fugitive:// setlocal bufhidden=delete
augroup END

augroup gitcommit
  autocmd!
  autocmd FileType gitcommit setlocal nolist
augroup END


" vim-escaper Custom Entity Replacements
let g:CustomEntities = [['(c)',  '\&copy;']]


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
let g:ascii = []
let g:startify_custom_footer = 'map(startify#fortune#boxed() + g:ascii, "\"   \".v:val")'
let g:startify_session_autoload = 0 " Testing out my new session sourcing code
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
if !has('gui_running')
  let g:startify_disable_at_vimenter = 1
endif

" Grepper
let g:grepper = {}
let g:grepper.tools = ['rg', 'ag', 'ack', 'ack-grep', 'grep', 'findstr', 'pt', 'sift', 'git']
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)


" JS and JSX Config
" Always enable JSX in JS files... who am I kidding...
let g:jsx_ext_required = 0
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
" I generally use prettier now... so ignore all this stuff
augroup jsfixes
  autocmd!
  autocmd Syntax javascript setlocal nosmartindent|setlocal noautoindent
augroup END


" Goyo settings
let g:goyo_margin_top=5
let g:goyo_margin_bottom=5
let g:goyo_width = 90


" Easymotion mappings
map  <leader>/ <Plug>(easymotion-sn)
omap <leader>/ <Plug>(easymotion-tn)
map  <leader>n <Plug>(easymotion-next)
map  <leader>N <Plug>(easymotion-prev)
map  <leader>kk <Plug>(easymotion-bd-jk)
map  <leader>jj <Plug>(easymotion-bd-jk)
map  <leader><leader><leader> <Plug>(easymotion-repeat)
map  <space> <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1


" Dope patch - not integrated yet, probably would make indentLine not needed?
if exists('&indentmarker')
  " set indentmarker=⋅
  set indentmarker=⋅
  augroup showindent
    autocmd!
    autocmd FileType * setlocal showindent
    autocmd FileType help,startify,markdown,nerdtree,git setlocal noshowindent
  augroup END

  " For some reason I have to set this after showindent or
  " incsearch never gets set for some weird reason
  set incsearch
endif


" LocalVimRC Settings
let g:localvimrc_sandbox = 0
let g:localvimrc_persistent = 1


" targets.vim
augroup targets_tweaks
  autocmd!
  autocmd User targets#mappings#user call targets#mappings#extend({
    \ 'a': {'argument': [{'o': '[{([]', 'c': '[])}]', 's': ','}]},
    \ })
augroup END

" Scratch settings
let g:scratch_autohide = 0
let g:scratch_insert_autohide = 0
let g:scratch_filetype = 'markdown'
let g:scratch_top = 0


" vim-hexokinase
let g:Hexokinase_highlighters = ['sign_column']
runtime! /misc/discord-color-variables.vim


" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.\*']
let g:EditorConfig_disable_rules = ['trim_trailing_whitespace']

" VIM Open Url
let g:open_url_default_mappings = 0
nmap gx <Plug>(open-url-browser)
xmap gx <Plug>(open-url-browser)

" Vim Matchup Settings
" Auto changes closing tag when editing opening tag
let g:matchup_transmute_enabled = 1
" Disable the statusline takeover, I think it looks pretty bad
let g:matchup_matchparen_offscreen = {}

" Playgrounds and old unused settings
" Asyncomplete Settings
if 1
  runtime! /misc/asyncomplete.vim
endif

" LSC Settings (it kinda sucked...)
if 0
  runtime! /misc/lsc.vim
endif

" ALE settings
if 1
  runtime! /misc/ale.vim
endif

" Lightline Playground Settings
if 1
  runtime! /misc/lightline-playground.vim
endif

" Airline Playground Settings
if 0
  runtime! /misc/airline-config.vim
endif

" LanguageServer Playground Settings
if 0
  runtime! /misc/lsp-playground.vim
endif

" CtrlP Settings
if 0
  runtime! /misc/ctrlp-settings.vim
endif

" Omnicomplete settings
if 0
  runtime! /misc/omni-complete.vim
endif

" Completer settings
if 0
  runtime! /misc/completor-config.vim
endif

" GitGutter settings
if 1
  runtime! /misc/gitgutter.vim
endif

" CoC settings
if 0
  runtime! /misc/coc.vim
endif

" FZF settings
if 1
  runtime! /misc/fzf.vim
endif
