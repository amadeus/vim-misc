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
set wildignore+=*.o,*.obj,.git,*.rbc,.hg,.svn,*.pyc,.vagrant,.gitignore,.DS_Store,*.jpg,*.jpeg,*.png,*.gif,*.bmp,*.psd


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
au BufEnter,TabEnter,BufWinEnter * exe 'IndentGuidesDisable'
au BufEnter,TabEnter,BufWinEnter *.py,*.rb,Vagrantfile exe 'IndentGuidesEnable'


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
let g:syntastic_javascript_jsl_conf = "~/.jslintrc"
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

"deploy/|classes/|vendor/|.git/|.hg/|.svn/|.*migrations/|.vagrant" .
let ctrlp_filter_greps = "".
    \ "egrep -iv '\\.(" .
    \ "jar|class|swp|swo|log|so|o|pyc|jpe?g|png|gif|mo|po|DS_Store" .
    \ ")$' | " .
    \ "egrep -v '^(\\./)?(" .
    \ ".o/|.obj/|.git/|.rbc/|.hg/|.svn/|.pyc/|.vagrant/|.gitignore/|.DS_Store/|.jpg/|.jpeg/|.png/|.gif/|.bmp/|.psd" .
    \ ")'"

let my_ctrlp_git_command = "" .
    \ "cd %s && git ls-files . -co | " .
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


" TESTING: Save as sudo
ca w!! w !sudo tee "%"


" TESTING: Entity Escaper
command Entities :call Entities()
function Entities()
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
