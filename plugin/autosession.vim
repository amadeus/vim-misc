let s:timer = 0

function! s:DetectSessionFile() abort
  " Only trigger detection if empty buffer or startify, it might be worth also
  " checking that there is no more than 1 open buffer
  if s:timer != 0 || (exists('g:this_obsession_status') && g:this_obsession_status == 2)
    return
  endif
  let l:session_file = getcwd().'/Session.vim'
  if !filereadable(session_file)
    return
  endif
  let l:choice = confirm('Would you like to source Session.vim?', "&Yes\n&No")
  if l:choice == 1
    let s:timer = timer_start(500, function('s:Source', [l:session_file]))
  endif
endfunction

function! s:Source(session_file, _) abort
  execute 'source' a:session_file
  let s:timer = 0
endfunction

augroup autosource
  autocmd!
  autocmd DirChanged * exec <SID>DetectSessionFile()
augroup END
