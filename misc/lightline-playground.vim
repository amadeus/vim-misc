scriptencoding utf-8

function! IsGitBuffer() abort
  let filename = substitute(expand('%:p'), '/\./', '/', 'g')
  if  &filetype ==# 'GV'
    \ || &filetype ==# 'fugitive'
    \ || &filetype ==# 'git'
    \ || match(filename, '^fugitive://') == 0
    return 1
  endif
  return 0
endfunction

" Component Functions
function! MyReadonly() abort
  if &buftype ==# 'help' || &filetype ==# 'fugitive' || &filetype ==# 'git'
    return ''
  endif
  return &readonly ? '×' : ''
endfunction

function! MyFugitive() abort
  if winwidth(0) < 75 || IsGitBuffer()
    return ''
  endif

  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction

" NOTE: Revisit this a bit - it's getting better, but not perfect yet
function! s:TruncatePath(filename) abort
  let cleaned = substitute(a:filename, '^vaffle://[0-9]/', '', '')

  " If it's an empty path, return early
  if cleaned ==# ''
    return ''
  endif

  " Sometimes the filename comes through as an absolute path, sometimes it
  " comes through as a relative path, attempt to clean it up
  let is_root = 0
  let cwd = getcwd()
  if cleaned[:0] !=# '/'
    let cleaned = './'.cleaned
  elseif cwd !=# '/' && cleaned[:len(cwd) - 1] ==# cwd
    let cleaned = substitute(cleaned, '^'.getcwd().'/\=', '', '')
  else
    let cleaned = substitute(cleaned, '^'.$HOME, '~', '')
    let is_root = 1
  endif

  " We have special shrinking logic for vaffle, that we can't currently apply
  " anywhere else
  if &filetype ==# 'vaffle'
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
  endif
  return (is_root ? '' : './').cleaned
endfunction

function! MyRelativePath() abort
  let filename = substitute(expand('%:p'), '/\./', '/', 'g')

  if IsGitBuffer()
    if &diff
      return 'diff://'.split(filename, '/')[-1]
    endif

    if match(filename, '^fugitive://.\+\.git//') == 0
      let filename = substitute(filename, '^fugitive:.\+\.git\/\+', '', '')
      let items = split(filename, '/')
      return items[0].':'.items[-1]
    endif

    if exists('*fugitive#head')
      \ && (&filetype ==# 'fugitive' || &filetype ==# 'GV' || &filetype ==# 'git')
      return ' '.fugitive#head()
    endif
  endif

  let parts = split(filename, '/')

  " Handle Terminal buffers specially
  if &buftype ==# 'terminal' || &buftype ==# 'help' || &filetype ==# 'gitcommit'
    return parts[-1]
  endif

  if len(parts) > 0
  " Handle special Scratch buffer
    if parts[-1] ==# '__Scratch__'
      return 'Scratch'
    endif

    " Mundo support
    if parts[-1] ==# '__Mundo__'
      return 'History'
    endif
    if parts[-1] ==# '__Mundo_Preview__'
      return 'Preview'
    endif
    if parts[-1] ==# '[Plugins]'
      return ''
    endif
  endif

  return s:TruncatePath(filename)
endfunction

function! LightlineLinterWarnings() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:all_non_errors == 0 ? '' : printf('○ %d', l:all_non_errors)
endfunction

function! LightlineLinterErrors() abort
  let l:counts = ale#statusline#Count(bufnr(''))
  let l:all_errors = l:counts.error + l:counts.style_error
  let l:all_non_errors = l:counts.total - l:all_errors
  return l:all_errors == 0 ? '' : printf('● %d', l:all_errors)
endfunction

function! MyModified() abort
  if &buftype ==# 'terminal' || &buftype ==# 'nowrite' || &filetype ==# 'fugitive'
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
  if IsGitBuffer()
    return 'GIT'
  endif
  if &buftype ==# 'help'
    return 'HELP'
  endif
  if &filetype ==# 'vaffle'
    return 'VAFFLE'
  endif
  if &filetype ==# 'Mundo' || &filetype ==# 'MundoDiff'
    return 'UNDO'
  endif
  if &filetype ==# 'vim-plug'
    return 'PLUG'
  endif
  return lightline#mode()
endfunction

function! MyFiletype() abort
  if &buftype ==# 'terminal' || &buftype ==# 'quickfix' || &buftype ==# 'help'
    \ || &filetype ==# 'fugitive' || &filetype ==# 'git' || &filetype ==# 'vaffle' || &filetype ==# 'GV'
    \ || &filetype ==# 'Mundo' || &filetype ==# 'MundoDiff'
    \ || &diff
    return ''
  endif
  return &filetype
endfunction


" Theme
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}
let s:p.normal.left = [['#085e0b', '#49fd2f', 'bold'], ['#efefef', '#444444']]
let s:p.normal.right = [[ '#9e9e9e', '#303030' ]]
let s:p.normal.filetype = [ ['#9e9e9e', '#444444'] ]
let s:p.normal.middle = [ [ '#9e9e9e', '#303030' ] ]
let s:p.normal.error = [ ['#ffffff', '#E60000'] ]
let s:p.normal.warning = [ ['#ffffff', '#ff4b00'] ]
let s:p.normal.modified = [ [ '#000000', '#ffff00', 'bold'] ]

let s:p.inactive.left = [ [ '#5f5f5f', '#262622' ] ]
let s:p.inactive.middle = s:p.inactive.left
let s:p.inactive.right = s:p.inactive.left

let s:p.insert.left = [ ['#0087dd', '#ffffff', 'bold'], ['#ffffff', '#0087dd'] ]
let s:p.insert.middle = s:p.normal.middle
let s:p.insert.right = s:p.normal.right

let s:p.visual.left = [ ['#ff4b00', '#ffffff', 'bold'], ['#ffffff', '#ff4b00'] ]

let s:p.replace.left = [ ['#ff027f', '#ffffff' , 'bold'], ['#ffffff', '#ff027f'] ]
let s:p.replace.right = s:p.normal.right
let s:p.replace.middle = s:p.normal.middle

let s:p.tabline.left = [ ['#888888', '#303030'] ]
let s:p.tabline.tabsel = [ [ '#fc167c', '#222222' ] ]
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
\     ['aleerror'],
\     ['alewarning'],
\     ['myfiletype'],
\   ]
\ },
\ 'inactive': {
\   'left': [
\    ['myrelativepath', 'mymodifiedinactive'],
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
\   'active': ['filename'],
\   'inactive': ['filename']
\ },
\ 'component_function': {
\   'mymode': 'MyMode',
\   'mygitbranch': 'MyFugitive',
\   'myreadonly': 'MyReadonly',
\   'myrelativepath': 'MyRelativePath',
\ },
\ 'component_expand': {
\   'mymodified': 'MyModified',
\   'myfiletype': 'MyFiletype',
\   'alewarning': 'LightlineLinterWarnings',
\   'aleerror': 'LightlineLinterErrors',
\ },
\ 'component_type': {
\   'mymodified': 'modified',
\   'myfiletype': 'filetype',
\   'alewarning': 'warning',
\   'aleerror': 'error',
\ },
\ 'component_raw': {
\   'mymodifiedinactive': 1
\ },
\ 'component': {
\   'mylineinfo': '%2v',
\   'mymodifiedinactive': '%#lightlineModInactive#%{MyModified()}',
\ },
\ 'colorscheme': 'evokai',
\}

augroup LightLineEvents
  autocmd!
  autocmd User ALEFixPost  call lightline#update()
  autocmd User ALELintPost call lightline#update()
  " This is used to ensure that the modified component updates appropriately
  autocmd TextChanged * call lightline#update()
  autocmd TextChangedI * call lightline#update()
augroup end
