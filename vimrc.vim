" Disable wrapping by default
set nowrap
set linebreak
set encoding=utf-8
set ttyfast
set confirm


" Indent settings
set tabstop=4
set shiftwidth=4
set shiftround
set noexpandtab
set smartindent
set autoindent
set smarttab
"set cinkeys=0{,0},:,0#,!,!^F

" Show invisibles
set list
"set listchars=tab:›\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set listchars=tab:›\ ,eol:¬,trail:⋅,nbsp:␣
"set showbreak=↪


" Disable matching parens - the real way
let loaded_matchparen = 0


" Allow backspacing over everything in insert mode
set backspace=indent,eol,start


" Lots of history
set history=1000


" Allow buffers to be changed on unsaved files
set hidden


" Searching made less specific
set nohlsearch
set incsearch
set ignorecase
set smartcase


" Tab completion when entering filenames
set wildmode=list:full
set wildignore+=*.o,*.obj,.git,*.rbc,.hg,.svn,*.pyc,.vagrant,.gitignore,.DS_Store,*.jpg,*.eps,*.jpeg,*.png,*.gif,*.bmp,*.psd


" Syntax, Colorscheme and Gui Options
syntax on
set background=dark

if has("gui_running")
    colorscheme monokai
else
    colorscheme molokai
endif

set guioptions=aAce
set shortmess=I
set title titlestring=%t
set number
set numberwidth=4
set ruler
set laststatus=2


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
cnoreabbrev W    w
cnoreabbrev Wq   wq
cnoreabbrev WQ   wq
cnoreabbrev Q    q
cnoreabbrev Tabe tabe
cnoreabbrev Set  set
cnoreabbrev Cd   cd


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
"let mapleader=","
let mapleader="q"
nnoremap q <nop>
vnoremap q <nop>
nnoremap Q q
vnoremap Q q
"let maplocalleader="\\"
nnoremap <leader>w   :w<cr>
"nnoremap <leader>q   :q<cr>
" Toggle hlsearch
nnoremap <leader>nn  :set hls!<cr>
nnoremap <leader>e   :e ~/.vim/bundle/vim-misc/vimrc.vim<cr>
nnoremap <leader>m   :e ~/.vim/bundle/vim-misc/colors/monokai.vim<cr>
nnoremap <leader>h   :so $VIMRUNTIME/syntax/hitest.vim<cr>
nnoremap <leader>u   :GundoToggle<cr>
nnoremap <leader>d   :bd<cr>
nnoremap <leader>ss  :setlocal spell!<cr>
nnoremap <leader>st  :SyntasticToggle<cr>
nnoremap <leader>gq  :diffoff<cr><c-h>:q<cr>:set nowrap<cr>
nnoremap <leader>gg  :Gdiff<cr>
nnoremap <leader>p   :pwd<cr>
nnoremap <leader>a   :Ack '
nnoremap <leader>nt  :NERDTreeToggle<cr>
nnoremap <leader>gs  :Gstatus<cr>
nnoremap <leader>gc  :Gcommit -v<cr>
nnoremap <leader>gd  :Git difftool --staged<cr>

" Slicker way to move around splits
noremap <c-j> <C-W>j
noremap <c-k> <C-W>k
noremap <c-h> <C-W>h
noremap <c-l> <C-W>l

" General cursor moves in insert mode
inoremap <c-k> <esc>O
inoremap <c-l> <esc>A
inoremap <c-h> <esc>I
inoremap <c-j> <esc>o

" Make and restore sessions
set sessionoptions=blank,buffers,curdir,folds,tabpages
noremap <leader>ms :mksession! ~/.vim/.session<cr>
noremap <leader>rs :source ~/.vim/.session<cr>

" Expand folder of current file in command mode
cnoremap %% <c-r>=expand('%:h').'/'<cr>


" Powerline Settings
set guifont=Source\ Code\ Pro:h12
set noshowmode
let g:Powerline_symbols = 'fancy'


" Set htmldjango.html on all html files - don't need this?
augroup htmldjango
	autocmd!
	autocmd BufNewFile,BufRead,BufWrite *.html,*.htm setl filetype=htmldjango.html
augroup END


" A simpler, more refined indent guide enabler
augroup indentguides
    autocmd!
	if exists('IndentGuidesDisable')
		autocmd BufEnter,TabEnter,BufWinEnter * exe 'IndentGuidesDisable'
		autocmd BufEnter,TabEnter,BufWinEnter *.py,*.rb,Vagrantfile,*.coffee exe 'IndentGuidesEnable'
	endif
augroup END


" Fix Python
let python_highlight_all = 1
augroup pythontweaks
    autocmd!
    autocmd FileType python syn keyword pythonDecorator True None False self
augroup END


" Swap, Undo and Backup Folder Configuration
set directory=~/.vim/swap
set backupdir=~/.vim/backup
set undodir=~/.vim/undo
set backup
set undofile

" Remove trailing whitespace on save
function! Preserve(command)
    " Allow me to preserve whitespace on certain files
    " if necessary. Simply perform:
    " :let b:pw=1<cr> to preserve whitespace on that buffer
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
    autocmd BufWritePre * :call Preserve("%s/\\s\\+$//e")
augroup END


" Automatically read files when they were modified externally
set autoread


" CtrlP Settings
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 20
let g:ctrlp_cache_dir = $HOME.'/.vim/cache/ctrlp'
let g:ctrlp_jump_to_buffer = 1
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|env/*'
let g:ctrlp_open_new_file = 'r'
nnoremap <leader>t :CtrlP<cr>
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>l :CtrlPLine<cr>
let g:ctrlp_clear_cache_on_exit = 0


" Syntastic
let g:syntastic_auto_loc_list=1
"let g:syntastic_javascript_jsl_conf = "~/.jslintrc"
let g:syntastic_javascript_syntax_checker="jshint"
let g:syntastic_enable_highlighting = 0
"let g:syntastic_javascript_jshint_conf = "~/.jshintrc"
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': ['html', 'htmldjango', 'css'] }


" Gist settings
let g:gist_clip_command = 'pbcopy'
let g:gist_open_browser_after_post = 1


" CtrlP Optimizations
let g:ctrlp_max_files = 10000

"deploy/|classes/|vendor/|.git/|.hg/|.svn/|.*migrations/|.vagrant" .
let ctrlp_filter_greps = "".
    \ "egrep -iv '\\.(" .
    \ "jar|class|swp|swo|log|so|o|pyc|pyo|jpe?g|eps|png|gif|mo|po|DS_Store|a|beam|tar.gz|tar.bz2" .
    \ ")$' | " .
    \ "egrep -v '^(\\./)?(" .
    \ ".git/|.rbc/|.hg/|.svn/|.vagrant/|node_modules/|env/|build/|static/compressed/" .
    \ ")'"

let my_ctrlp_git_command = "" .
    \ "cd %s && git ls-files . -co | " .
    \ ctrlp_filter_greps

if has("unix")
    let my_ctrlp_user_command = "" .
    \ "find %s '(' -type f -or -type l ')' -not -path '*/\\.*/*' | " .
    \ ctrlp_filter_greps .
    \ " | head -" . g:ctrlp_max_files

    let g:ctrlp_user_command = ['.git/', my_ctrlp_git_command, my_ctrlp_user_command]
elseif has('win32')
    let my_ctrlp_user_command = "" .
    \ "dir %s /-n /b /s /a-d" .
    \ ctrlp_filter_greps

    let g:ctrlp_user_command = ['.git/', my_ctrlp_git_command, my_ctrlp_user_command]
else
    let g:ctrlp_user_command = ['.git/', my_ctrlp_git_command]
endif

" Delete buffer from within CtrlPBuf
let g:ctrlp_buffer_func = { 'enter': 'MyCtrlPMappings' }

func! MyCtrlPMappings()
    nnoremap <buffer> <silent> <c-@> :call <sid>DeleteBuffer()<cr>
endfunc

func! s:DeleteBuffer()
    exec "bd" fnamemodify(getline('.')[2:], ':p')
    exec "norm \<F5>"
endfunc


" Distraction Free Writing
function! DistractionFreeWriting()
    " Size of the editable area
    set lines=40 columns=100
    " Hide line numbers
    set nonumber
    " MacVim specific setting for editor's background color
    set fuoptions=background:#001e1e1a
    " Remove right scrollbar
    set guioptions-=r
    " Don't show status line
    set laststatus=0
    " Fuck with status messages
    set shm=at
    " Wrap text
    set wrap
    " Don't show ruler
    set noruler
    " Go to fullscreen editing mode
    set fullscreen
    " Hide invisible chars - required fo set linebreak
    set nolist
    " Break lines on words - cleaner
    set linebreak
    " Hide the linebreak character
    set showbreak=
    " Disable NeoComplCache
    let g:neocomplcache_enable_at_startup = 0
    silent exec 'NeoComplCacheDisable'
    " Hide various other types of whitespace characters
    hi NonText    guifg=#1e1e1a
    hi SpecialKey guifg=#1e1e1a
endfunction


" Indent Guides
let g:indent_guides_guide_size  = 1
let g:indent_guides_auto_colors = 0
let g:indent_guides_start_level = 2


" TESTING: - Testing wrap movement
vnoremap j gj
nnoremap j gj
vnoremap k gk
nnoremap k gk


" TESTING: DetectIndent
let g:detectindent_preferred_expandtab = 0
let g:detectindent_preferred_indent = 4
let g:detectindent_max_lines_to_analyse = 1024
"let g:detectindent_verbosity = 1 -- don't think I need this
augroup detectindent
    autocmd!
	autocmd BufReadPost * :DetectIndent
augroup END


" TESTING: New way of escaping insert mode
inoremap jk <Esc>
" Re-enabling escape because I think I've successfully switched
" inoremap <esc> <nop>


" TESTING: .conf to yaml
augroup yaml
    autocmd!
    autocmd BufNewFile,BufRead *.conf setl filetype=yaml
augroup END


" TESTING: ZenCoding Tweaks
let g:user_zen_leader_key = '<c-q>'


" TESTING: Don't clobber the unnamed register when pasting over text in visual mode.
" Seems like a bit of a hack, but I'll try it
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


" TESTING: Save as sudo
ca w!! w !sudo tee "%"


" TESTING: Entity Escaper
command! Entities :call Entities()
function! Entities()
    silent %s/&/\&amp;/eg
    silent %s/"/\&quot;/eg
    silent %s/'/\&apos;/eg
    silent %s/</\&lt;/eg
    silent %s/>/\&gt;/eg
    silent %s/¡/\&iexcl;/eg
    silent %s/¢/\&cent;/eg
    silent %s/£/\&pound;/eg
    silent %s/¤/\&curren;/eg
    silent %s/¥/\&yen;/eg
    silent %s/¦/\&brvbar;/eg
    silent %s/§/\&sect;/eg
    silent %s/¨/\&uml;/eg
    silent %s/©/\&copy;/eg
    silent %s/ª/\&ordf;/eg
    silent %s/«/\&laquo;/eg
    silent %s/¬/\&not;/eg
    silent %s/®/\&reg;/eg
    silent %s/¯/\&macr;/eg
    silent %s/°/\&deg;/eg
    silent %s/±/\&plusmn;/eg
    silent %s/²/\&sup2;/eg
    silent %s/³/\&sup3;/eg
    silent %s/´/\&acute;/eg
    silent %s/µ/\&micro;/eg
    silent %s/¶/\&para;/eg
    silent %s/·/\&middot;/eg
    silent %s/¸/\&cedil;/eg
    silent %s/¹/\&sup1;/eg
    silent %s/º/\&ordm;/eg
    silent %s/»/\&raquo;/eg
    silent %s/¼/\&frac14;/eg
    silent %s/½/\&frac12;/eg
    silent %s/¾/\&frac34;/eg
    silent %s/¿/\&iquest;/eg
    silent %s/×/\&times;/eg
    silent %s/÷/\&divide;/eg
    silent %s/À/\&Agrave;/eg
    silent %s/Á/\&Aacute;/eg
    silent %s/Â/\&Acirc;/eg
    silent %s/Ã/\&Atilde;/eg
    silent %s/Ä/\&Auml;/eg
    silent %s/Å/\&Aring;/eg
    silent %s/Æ/\&AElig;/eg
    silent %s/Ç/\&Ccedil;/eg
    silent %s/È/\&Egrave;/eg
    silent %s/É/\&Eacute;/eg
    silent %s/Ê/\&Ecirc;/eg
    silent %s/Ë/\&Euml;/eg
    silent %s/Ì/\&Igrave;/eg
    silent %s/Í/\&Iacute;/eg
    silent %s/Î/\&Icirc;/eg
    silent %s/Ï/\&Iuml;/eg
    silent %s/Ð/\&ETH;/eg
    silent %s/Ñ/\&Ntilde;/eg
    silent %s/Ò/\&Ograve;/eg
    silent %s/Ó/\&Oacute;/eg
    silent %s/Ô/\&Ocirc;/eg
    silent %s/Õ/\&Otilde;/eg
    silent %s/Ö/\&Ouml;/eg
    silent %s/Ø/\&Oslash;/eg
    silent %s/Ù/\&Ugrave;/eg
    silent %s/Ú/\&Uacute;/eg
    silent %s/Û/\&Ucirc;/eg
    silent %s/Ü/\&Uuml;/eg
    silent %s/Ý/\&Yacute;/eg
    silent %s/Þ/\&THORN;/eg
    silent %s/ß/\&szlig;/eg
    silent %s/à/\&agrave;/eg
    silent %s/á/\&aacute;/eg
    silent %s/â/\&acirc;/eg
    silent %s/ã/\&atilde;/eg
    silent %s/ä/\&auml;/eg
    silent %s/å/\&aring;/eg
    silent %s/æ/\&aelig;/eg
    silent %s/ç/\&ccedil;/eg
    silent %s/è/\&egrave;/eg
    silent %s/é/\&eacute;/eg
    silent %s/ê/\&ecirc;/eg
    silent %s/ë/\&euml;/eg
    silent %s/ì/\&igrave;/eg
    silent %s/í/\&iacute;/eg
    silent %s/î/\&icirc;/eg
    silent %s/ï/\&iuml;/eg
    silent %s/ð/\&eth;/eg
    silent %s/ñ/\&ntilde;/eg
    silent %s/ò/\&ograve;/eg
    silent %s/ó/\&oacute;/eg
    silent %s/ô/\&ocirc;/eg
    silent %s/õ/\&otilde;/eg
    silent %s/ö/\&ouml;/eg
    silent %s/ø/\&oslash;/eg
    silent %s/ù/\&ugrave;/eg
    silent %s/ú/\&uacute;/eg
    silent %s/û/\&ucirc;/eg
    silent %s/ü/\&uuml;/eg
    silent %s/ý/\&yacute;/eg
    silent %s/þ/\&thorn;/eg
    silent %s/ÿ/\&yuml;/eg
    silent %s/∀/\&forall;/eg
    silent %s/∂/\&part;/eg
    silent %s/∃/\&exist;/eg
    silent %s/∅/\&empty;/eg
    silent %s/∇/\&nabla;/eg
    silent %s/∈/\&isin;/eg
    silent %s/∉/\&notin;/eg
    silent %s/∋/\&ni;/eg
    silent %s/∏/\&prod;/eg
    silent %s/∑/\&sum;/eg
    silent %s/−/\&minus;/eg
    silent %s/∗/\&lowast;/eg
    silent %s/√/\&radic;/eg
    silent %s/∝/\&prop;/eg
    silent %s/∞/\&infin;/eg
    silent %s/∠/\&ang;/eg
    silent %s/∧/\&and;/eg
    silent %s/∨/\&or;/eg
    silent %s/∩/\&cap;/eg
    silent %s/∪/\&cup;/eg
    silent %s/∫/\&int;/eg
    silent %s/∴/\&there4;/eg
    silent %s/∼/\&sim;/eg
    silent %s/≅/\&cong;/eg
    silent %s/≈/\&asymp;/eg
    silent %s/≠/\&ne;/eg
    silent %s/≡/\&equiv;/eg
    silent %s/≤/\&le;/eg
    silent %s/≥/\&ge;/eg
    silent %s/⊂/\&sub;/eg
    silent %s/⊃/\&sup;/eg
    silent %s/⊄/\&nsub;/eg
    silent %s/⊆/\&sube;/eg
    silent %s/⊇/\&supe;/eg
    silent %s/⊕/\&oplus;/eg
    silent %s/⊗/\&otimes;/eg
    silent %s/⊥/\&perp;/eg
    silent %s/⋅/\&sdot;/eg
    silent %s/Α/\&Alpha;/eg
    silent %s/Β/\&Beta;/eg
    silent %s/Γ/\&Gamma;/eg
    silent %s/Δ/\&Delta;/eg
    silent %s/Ε/\&Epsilon;/eg
    silent %s/Ζ/\&Zeta;/eg
    silent %s/Η/\&Eta;/eg
    silent %s/Θ/\&Theta;/eg
    silent %s/Ι/\&Iota;/eg
    silent %s/Κ/\&Kappa;/eg
    silent %s/Λ/\&Lambda;/eg
    silent %s/Μ/\&Mu;/eg
    silent %s/Ν/\&Nu;/eg
    silent %s/Ξ/\&Xi;/eg
    silent %s/Ο/\&Omicron;/eg
    silent %s/Π/\&Pi;/eg
    silent %s/Ρ/\&Rho;/eg
    silent %s/Σ/\&Sigma;/eg
    silent %s/Τ/\&Tau;/eg
    silent %s/Υ/\&Upsilon;/eg
    silent %s/Φ/\&Phi;/eg
    silent %s/Χ/\&Chi;/eg
    silent %s/Ψ/\&Psi;/eg
    silent %s/Ω/\&Omega;/eg
    silent %s/α/\&alpha;/eg
    silent %s/β/\&beta;/eg
    silent %s/γ/\&gamma;/eg
    silent %s/δ/\&delta;/eg
    silent %s/ε/\&epsilon;/eg
    silent %s/ζ/\&zeta;/eg
    silent %s/η/\&eta;/eg
    silent %s/θ/\&theta;/eg
    silent %s/ι/\&iota;/eg
    silent %s/κ/\&kappa;/eg
    silent %s/λ/\&lambda;/eg
    silent %s/μ/\&mu;/eg
    silent %s/ν/\&nu;/eg
    silent %s/ξ/\&xi;/eg
    silent %s/ο/\&omicron;/eg
    silent %s/π/\&pi;/eg
    silent %s/ρ/\&rho;/eg
    silent %s/ς/\&sigmaf;/eg
    silent %s/σ/\&sigma;/eg
    silent %s/τ/\&tau;/eg
    silent %s/υ/\&upsilon;/eg
    silent %s/φ/\&phi;/eg
    silent %s/χ/\&chi;/eg
    silent %s/ψ/\&psi;/eg
    silent %s/ω/\&omega;/eg
    silent %s/ϑ/\&thetasym;/eg
    silent %s/ϒ/\&upsih;/eg
    silent %s/ϖ/\&piv;/eg
    silent %s/Œ/\&OElig;/eg
    silent %s/œ/\&oelig;/eg
    silent %s/Š/\&Scaron;/eg
    silent %s/š/\&scaron;/eg
    silent %s/Ÿ/\&Yuml;/eg
    silent %s/ƒ/\&fnof;/eg
    silent %s/ˆ/\&circ;/eg
    silent %s/˜/\&tilde;/eg
    silent %s/–/\&ndash;/eg
    silent %s/—/\&mdash;/eg
    silent %s/‘/\&lsquo;/eg
    silent %s/’/\&rsquo;/eg
    silent %s/‚/\&sbquo;/eg
    silent %s/“/\&ldquo;/eg
    silent %s/”/\&rdquo;/eg
    silent %s/„/\&bdquo;/eg
    silent %s/†/\&dagger;/eg
    silent %s/‡/\&Dagger;/eg
    silent %s/•/\&bull;/eg
    silent %s/…/\&hellip;/eg
    silent %s/‰/\&permil;/eg
    silent %s/′/\&prime;/eg
    silent %s/″/\&Prime;/eg
    silent %s/‹/\&lsaquo;/eg
    silent %s/›/\&rsaquo;/eg
    silent %s/‾/\&oline;/eg
    silent %s/€/\&euro;/eg
    silent %s/™/\&trade;/eg
    silent %s/←/\&larr;/eg
    silent %s/↑/\&uarr;/eg
    silent %s/→/\&rarr;/eg
    silent %s/↓/\&darr;/eg
    silent %s/↔/\&harr;/eg
    silent %s/↵/\&crarr;/eg
    silent %s/⌈/\&lceil;/eg
    silent %s/⌉/\&rceil;/eg
    silent %s/⌊/\&lfloor;/eg
    silent %s/⌋/\&rfloor;/eg
    silent %s/◊/\&loz;/eg
    silent %s/♠/\&spades;/eg
    silent %s/♣/\&clubs;/eg
    silent %s/♥/\&hearts;/eg
    silent %s/♦/\&diams;/eg
endfunc


" TESTING: Javascript in HTML indent fixes, maybe?
let g:html_indent_inctags = "html,body,head,tbody"
let g:html_indent_script1 = "inc"
let g:html_indent_style1  = "inc"


" TESTING: CSS Specific Motions
" Change inner/around CSS Key
onoremap ik :<c-u>execute "normal! ^vt:"<cr>
onoremap ak :<c-u>execute "normal! 0vf:"<cr>

" Change inner/around CSS Property
onoremap ir :<c-u>execute "normal! 0f:lvt;"<cr>
onoremap ar :<c-u>execute "normal! 0f:lvf;"<cr>

" Change function arguments
onoremap ia :<c-u>execute "normal! ^f(vi("<cr>


" TESTING: Sync
autocmd BufEnter * :syntax sync fromstart


" TESTING: No folding
set nofoldenable


" TESTING: NeoCompleteCache
"let g:neocomplcache_enable_fuzzy_completion = 1
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_camel_case_completion = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_auto_completion_start_length = 1
let g:neocomplcache_caching_limit_file_size = 50000
let g:neocomplcache_temporary_dir = $HOME.'/.vim/cache/noecompl'
let g:neocomplcache_enable_smart_case = 1

augroup omnicomplete
    autocmd!
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END


" TESTING: Force vim to think of 2 spaces as a sentence
set cpo+=J


" TESTING: NERDCommenter Tweaks
let g:NERDSpaceDelims = 1


" TESTING: Fixing gitgutter
let g:gitgutter_all_on_focusgained = 0
nnoremap <silent> <leader>j :GitGutterNextHunk<cr>
nnoremap <silent> <leader>k :GitGutterPrevHunk<cr>

" I do this to remove the bullshit FocusGained update all command
" which creates an ugly lag that I dislike
augroup gitgutter
    autocmd!
    autocmd BufEnter,BufWritePost,FileWritePost * call GitGutter(s:current_file())
    autocmd TabEnter * call GitGutterAll()
    autocmd ColorScheme * call s:define_sign_column_highlight() | call s:define_highlights()
augroup END


" TESTING: Show the stack of syntax hilighting classes affecting whatever is under the cursor.
function! SynStack()
  echo join(map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")'), " > ")
endfunc

nnoremap <F7> :call SynStack()<CR>


" TESTING: Don't try to highlight lines longer than 800 characters.
" set synmaxcol=800


" TESTING: Better completion?
set complete=.,w,b,u,t
set completeopt=menuone,preview


" TESTING: Fun tiems
iabbrev ldis ಠ_ಠ
iabbrev lsad ಥ_ಥ
iabbrev lhap ಥ‿ಥ
iabbrev lmis ಠ‿ಠ
vnoremap u <nop>
vnoremap gu u
nnoremap <leader>sx :syntax sync fromstart<cr>:redraw!<cr>
nnoremap <leader>se :source Session.vim<cr>


" TESTING: fuck swapfiles
set noswapfile


" TESTING: JS Stuff
let g:html_indent_inctags="html,body,head,tbody"
let g:html_indent_script1="inc"
let g:html_indent_style1="inc"

" TESTING: GitV: Fix my Ctrl window navigation hotkeys
let g:Gitv_DoNotMapCtrlKey = 1


" TESTING: Some dude's VIMRC
set magic


" TESTING: New JSBeuatify Stuff
nnoremap <leader>fj  :call JsBeautify()<cr>
nnoremap <leader>fh  :call HtmlBeautify()<cr>
nnoremap <leader>fc  :call CSSBeautify()<cr>
