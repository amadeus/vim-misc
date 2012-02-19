""" General App Settings
set nowrap
set lbr
set tabstop=4
set shiftwidth=4

set cindent
set smartindent
set autoindent
set cinkeys=0{,0},:,0#,!,!^F

set noexpandtab
set list
set listchars=tab:▸\ ,eol:¬
set showbreak=↪
" Disable matching parens
let loaded_matchparen = 1
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
set history=1000
set hidden
"set cursorline


""" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase


""" Tab completion when entering filenames, etc
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,.hg,.svn,*.pyc,.vagrant,.gitignore,.DS_Store,*.jpg,*.jpeg,*.png,*.gif,*.bmp


""" Syntax, color scheme and gui options
syntax on
set background=dark
colorscheme monokai
set transparency=0
set guioptions=aAce
set title titlestring=%t
set number
set ruler
set laststatus=2
" Improve splitting logic
set splitright
set splitbelow
" Schmexy Shcrolling
set scrolloff=3
set sidescroll=1
set sidescrolloff=3


""" Various Keyboard shortcuts
"let mapleader=","
" Disable annoying keys
noremap <F1> <nop>
nnoremap K <nop>
" Various leader shortcuts
nmap <leader>w :w<cr>
nmap <leader>q :q<cr>
nmap <leader>n :nohl<cr>
map <leader>e :e ~/.vim/bundle/vim-misc/vimrc.vim<cr>
map <leader>c :e ~/.vim/bundle/vim-misc/colors/monokai.vim<cr>
map <leader>s :so $VIMRUNTIME/syntax/hitest.vim<cr>
" Slick way to move around slices
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
" Save and restore vim session
set sessionoptions=blank,buffers,curdir,folds,localoptions,resize,tabpages,winsize
map <C-Z> :mksession! ~/.vim/.session <cr>
map <C-X> :source ~/.vim/.session <cr>
" Toggle spellcheck
map <leader>ss :setlocal spell!<cr>
" Disable Ex Mode
map Q <Nop>


""" Powerline Settings
set guifont=Menlo\ Regular\ for\ Powerline:h12
let g:Powerline_symbols = 'fancy'
let g:Powerline_theme = "custom"
let g:Powerline_colorscheme = "custom"


""" File and Filetype Settings
" Javascript test
"au FileType javascript setl nocindent
" Set htmldjango.html on all html files
au BufNewFile,BufRead,BufWrite *.html,*.htm setl filetype=htmldjango.html
" Fix Python
au FileType make set noexpandtab
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self
" Enable file backup (atomic)
set directory=~/.vim/swap
set backupdir=~/.vim/backup
set backup
" Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
" Automatically read files when they were modified externally
set autoread


""" CtrlP Settings
let g:ctrlp_working_path_mode = 0
map <leader>t :CtrlP<cr>
let g:ctrlp_max_height = 20
let g:ctrlp_cache_dir = $HOME.'/.vim/cache/ctrlp'
let g:ctrlp_jump_to_buffer = 1


""" Syntastic
let g:syntastic_auto_loc_list=1
let g:syntastic_javascript_jsl_conf = "-conf ~/.jslintrc"
let g:syntastic_mode_map = { 'mode': 'active',
	\ 'active_filetypes': [],
	\ 'passive_filetypes': ['html', 'htmldjango'] }


""" Temp & Testing

" Get file folder
cnoremap %% <C-R>=expand('%:h').'/'<cr>

" Fix marks
nnoremap ' `
nnoremap ` '
