" Airline Settings - BACK TO POWERLINE ATM
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.notexists = ''
let g:airline_symbols.readonly = '×'
" Dirty symbol seems broken anyways
let g:airline_symbols.dirty = ''
let g:airline_theme='evokai'
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#default#section_truncate_width = {}
let g:airline#extensions#ctrlp#color_template = 'replace'
let g:airline_highlighting_cache = 1

" Airline performance hax
let g:airline#extensions#disable_rtp_load = 1
let g:airline#extensions#bufferline#enabled = 0
let g:airline#extensions#csv#enabled = 0
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
let g:airline#extensions#ale#enabled = 0

" Tabline settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" let g:airline#extensions#tabline#fnamemod = 'unique_tail_improved'
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#tabs_label = ''
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_tab_count = 0

" Misc Settings
let airline#extensions#ale#show_line_numbers = 0
let g:airline#extensions#branch#format = 2

let g:airline_mode_map = {
\ '__' : '-',
\ 'n'  : 'N',
\ 'no' : 'N',
\ 'ni' : 'N',
\ 'i'  : 'I',
\ 'ix' : 'I',
\ 'ic' : 'I',
\ 'R'  : 'R',
\ 'Rv' : 'R',
\ 'c'  : 'C',
\ 'v'  : 'V',
\ 'V'  : 'V',
\ '' : 'V',
\ 's'  : 'S',
\ 'S'  : 'S',
\ '' : 'S',
\ }
