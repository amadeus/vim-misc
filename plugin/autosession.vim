if exists('g:did_run_autosession')
 finish
endif

let s:timer = 0

function! s:FileNamesToChoices(key, val)
  let l:filename = matchstr(a:val, 'Session.*\.vim')
  return "&".(a:key + 1).l:filename
endfunc

function! s:Source(session_file, _) abort
  execute 'source' a:session_file
  let s:timer = 0
endfunction

function! s:DetectSessionFile(from_autocmd) abort
  " Cancel detection if a source is in progress or we are already running a session
  if s:timer != 0
    return
  endif

  " Find all session files in the current working directory
  let l:session_files = split(globpath('.', "Session*.vim"), "\n")
  if len(l:session_files) == 0
    return
  endif

  " Create a choice string for confirm(), we MUST use " or else bad things happen
  let l:choice_string = join(map(copy(l:session_files), function('s:FileNamesToChoices')), "\n")."\n&Cancel"
  let l:cancel_index = len(l:session_files) + 1

  if a:from_autocmd == 1
    " Clear the autocmd - so we never inadvertently see it again
    autocmd! autosource DirChanged global
  endif

  " `:help confirm()` for more details
  let l:choice = confirm('Would you like to source a Session?', l:choice_string, 1)
  if l:choice == 0 || l:choice == l:cancel_index
    return
  endif

  " We have to use a timer on DirChanged autocmd
  if a:from_autocmd == 1
    let s:timer = timer_start(300, function('s:Source', [l:session_files[l:choice - 1]]))
  else
    call s:Source(l:session_files[l:choice - 1], '')
  endif
endfunction

augroup autosource
  autocmd!
  autocmd DirChanged global exec <SID>DetectSessionFile(1)
augroup END

command! DetectSessions call s:DetectSessionFile(0)
let g:did_run_autosession = 1
