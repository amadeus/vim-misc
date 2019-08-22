let g:lightline = {
\ 'active': {
\   'left': [
\     ['mode', 'paste'],
\     ['relativepath'],
\     ['gitbranch', 'readonlyhack', 'modified']
\   ],
\   'right': [
\     ['lineinfo'],
\     ['filetype']
\   ]
\ },
\ 'inactive': {
\   'left': [
\    ['relativepath', 'filename']
\   ],
\   'right': [
\     ['filetype']
\   ]
\ },
\ 'separator': {
\   'left': '',
\   'right': ''
\ },
\ 'subseparator': {
\   'left': '',
\   'right': ''
\ },
\ 'tabline_separator': {
\   'left': '',
\   'right': '',
\ },
\ 'tabline_subseparator': {
\   'left': '',
\   'right': '',
\ },
\ 'mode_map': {
\   'n' : 'N',
\   'i' : 'I',
\   'R' : 'R',
\   'v' : 'V',
\   'V' : 'V',
\   "\<C-v>": 'V',
\   'c' : 'C',
\   's' : 'S',
\   'S' : 'S',
\   "\<C-s>": 'S',
\   't': 'T',
\ },
\ 'tabline': {
\   'left': [['tabs']],
\   'right': [[]],
\ },
\ 'component_function': {
\   'gitbranch': 'LightlineFugitive',
\   'readonlyhack': 'LightlineReadonly'
\ },
\}

" Old fugitive stuff
" 'gitbranch': 'fugitive#head'

function! LightlineReadonly()
  return &readonly ? '×' : ''
endfunction

function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction
