scriptencoding utf-8

" Plugins
function! MyReadonly() abort
  if &buftype ==# 'help' || &filetype ==# 'fugitive'
    return ''
  endif
  return &readonly ? '×' : ''
endfunction

function! MyFugitive() abort
  " Do not show branchname on short windows
  if winwidth(0) < 75
    return ''
  endif

  " Never display in help or fugitive buffers
  if &buftype ==# 'help' || &filetype ==# 'fugitive' || &buftype ==# 'quickfix'
    return ''
  endif

  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

function! s:TruncateVafflePath(filename) abort
    let cleaned = substitute(a:filename, '^vaffle://[0-9]/', '', '')
    let cwd = getcwd()
    let is_root = 1
    if cleaned[:len(cwd) - 1] is# cwd
      let cleaned = substitute(cleaned, '^'.getcwd().'/\=', '', '')
      let is_root = 0
    endif
    let remaining = len(cleaned) - (winwidth(0) - 15)
    if remaining > 0
      let items = split(cleaned, '/')
      let i = 0
      while remaining > 0 && i < len(items) - 1
        let remaining = remaining - (len(items[i]) - 1)
        let items[i] = items[i][0]
        let i = i + 1
      endwhile
      let cleaned = join(items, '/')
    endif
    return (is_root ? '' : './').cleaned
endfunction

function! MyRelativePath() abort
  let filename = expand('%f')
  if &buftype ==# 'terminal' || &buftype ==# 'help' || &filetype ==# 'gitcommit'
    return split(filename, '/')[-1]
  endif
  if &filetype ==# 'vaffle'
    return s:TruncateVafflePath(filename)
  endif
  if exists('*fugitive#head') && &filetype ==# 'fugitive'
    return ' '.fugitive#head()
  endif
  return filename
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
  if &buftype ==# 'terminal'
    return ''
  endif
  return &modified ? '+' : ''
endfunction

function! MyMode() abort
  if &buftype ==# 'terminal'
    return 'TERM'
  endif
  if &buftype ==# 'quickfix'
    return 'QF'
  endif
  if &filetype ==# 'fugitive'
    return 'GIT'
  endif
  if &buftype ==# 'help'
    return 'HELP'
  endif
  if &filetype ==# 'vaffle'
    return 'VAFFLE'
  endif
  return lightline#mode()
endfunction

function! MyFiletype() abort
  if &buftype ==# 'terminal' || &buftype ==# 'quickfix' || &filetype ==# 'fugitive'
        \ || &buftype ==# 'help' || &filetype ==# 'vaffle'
    return ''
  endif
  return &filetype
endfunction


" Theme
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [['#085e0b', '#49fd2f', 'bold'], ['#efefef', '#444444']]
let s:p.normal.right = [ ['#9e9e9e', '#444444'], ['#ff027f', '#303030'], ['#ff4b00', '#303030'] ]
let s:p.normal.middle = [ [ 'gray7', '#303030' ] ]
let s:p.normal.error = [ [ 'white', '#ff027f' ] ]
let s:p.normal.warning = [ [ 'gray1', 'yellow' ] ]

let s:p.inactive.right = [ [ '#888888', '#303030' ] ]
let s:p.inactive.middle = s:p.inactive.right
let s:p.inactive.left = s:p.inactive.right

let s:p.insert.left = [ ['#00d5dd', '#ffffff', 'bold'], ['#ffffff', '#00d5dd'] ]
let s:p.insert.middle = s:p.normal.middle
let s:p.insert.right = s:p.normal.right

let s:p.visual.left = [ ['#ff4b00', 'white', 'bold'], ['white', '#ff4b00'] ]

let s:p.replace.left = [ ['#ff027f', 'white' , 'bold'], ['white', '#ff027f'] ]
let s:p.replace.right = s:p.normal.right
let s:p.replace.middle = s:p.normal.middle

let s:p.tabline.left = [ ['#888888', '#303030'] ]
let s:p.tabline.tabsel = [ [ '#481a28', '#FC167C' ] ]
let s:p.tabline.middle = [ ['#888888', '#303030'] ]
let s:p.tabline.right = [ ['#888888', '#303030'] ]
let g:lightline#colorscheme#evokai#palette = lightline#colorscheme#fill(s:p)

" Config
let g:lightline = {
\ 'active': {
\   'left': [
\     ['mymode', 'paste'],
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
\    ['myrelativepath']
\   ],
\   'right': []
\ },
\ 'separator': {
\   'left': '',
\   'right': ''
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
\   'mymode': 'MyMode',
\   'mygitbranch': 'MyFugitive',
\   'myreadonly': 'MyReadonly',
\   'myrelativepath': 'MyRelativePath',
\   'alewarning': 'LightlineLinterWarnings',
\   'aleerror': 'LightlineLinterErrors',
\   'mymodified': 'MyModified',
\   'myfiletype': 'MyFiletype',
\ },
\ 'component': {
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
