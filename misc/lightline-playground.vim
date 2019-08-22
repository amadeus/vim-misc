scriptencoding utf-8

" Plugins
function! MyReadonly() abort
  return &readonly ? '×' : ''
endfunction

function! MyFugitive() abort
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! MyRelativePath() abort
  " Returns an empty string on no file, which I prefer
  return expand('%f')
endfunction

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:all_non_errors == 0 ? '' : printf('%d', l:all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:all_errors == 0 ? '' : printf('%d', l:all_errors)
endfunction

function! MyModified()
  return &modified ? '+' : ''
endfunction


" Theme
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [['#085e0b', '#49fd2f', 'bold'], ['#9e9e9e', '#444444']]
let s:p.normal.right = [ ['#9e9e9e', '#444444'], ['#ff027f', 'gray2'], ['#ff4b00', 'gray2'] ]
let s:p.normal.middle = [ [ 'gray7', 'gray2' ] ]
let s:p.normal.error = [ [ 'white', '#ff027f' ] ]
let s:p.normal.warning = [ [ 'gray1', 'yellow' ] ]

let s:p.inactive.right = [ ['#444444', '#121212'] ]
let s:p.inactive.middle = s:p.inactive.right
let s:p.inactive.left = s:p.inactive.right

let s:p.insert.left = [ ['#00d5dd', '#ffffff', 'bold'], ['#ffffff', '#00d5dd'] ]
let s:p.insert.middle = s:p.normal.middle
let s:p.insert.right = s:p.normal.right

let s:p.visual.left = [ ['#ff4b00', 'white', 'bold'], ['white', '#ff4b00'] ]

let s:p.replace.left = [ ['#ff027f', 'white' , 'bold'], ['white', '#ff027f'] ]
let s:p.replace.right = s:p.normal.right
let s:p.replace.middle = s:p.normal.middle

let s:p.tabline.left = [ ['#444444', '#1b1b13'] ]
let s:p.tabline.tabsel = [ [ 'white', '#C500FF' ] ]
let s:p.tabline.middle = [ ['#444444', '#1b1b13'] ]
let s:p.tabline.right = [ ['#444444', '#1b1b13'] ]
let g:lightline#colorscheme#evokai#palette = lightline#colorscheme#fill(s:p)

" Config
let g:lightline = {
\ 'active': {
\   'left': [
\     ['mode', 'paste'],
\     ['myrelativepath', 'mymodified'],
\     ['mygitbranch', 'myreadonly'],
\   ],
\   'right': [
\     ['myfiletype'],
\     ['aleerror'],
\     ['alewarning'],
\   ]
\ },
\ 'inactive': {
\   'left': [
\    ['filename']
\   ],
\   'right': []
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
\   'right': [],
\ },
\ 'tab': {
\   'active': ['filename', 'mymodified'],
\   'inactive': ['filename', 'mymodified']
\ },
\ 'component_function': {
\   'mygitbranch': 'MyFugitive',
\   'myreadonly': 'MyReadonly',
\   'myrelativepath': 'MyRelativePath',
\   'alewarning': 'LightlineLinterWarnings',
\   'aleerror': 'LightlineLinterErrors',
\   'mymodified': 'MyModified',
\ },
\ 'component': {
\   'myfiletype': '%{&ft!=#""?&ft:"-"}',
\   'mylineinfo': '%2v',
\ },
\ 'colorscheme': 'evokai',
\}

augroup LightLineOnALE
  autocmd!
  autocmd User ALEFixPre   call lightline#update()
  autocmd User ALEFixPost  call lightline#update()
  autocmd User ALELintPre  call lightline#update()
  autocmd User ALELintPost call lightline#update()
augroup end
