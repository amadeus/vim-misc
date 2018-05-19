let s:timer = 0

function! s:FileNamesToChoices(key, val)
  let l:filename = matchstr(a:val, 'Session.*\.vim')
  return "&".(a:key + 1).l:filename
endfunc

function! s:Source(session_file, _) abort
  execute 'source' a:session_file
  let s:timer = 0
endfunction

function! s:DetectSessionFile() abort
  " Cancel detection if a source is in progress or we are already running a session
  if s:timer != 0 || (exists('g:this_obsession_status') && g:this_obsession_status == 2)
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

  " `:help confirm()` for more details
  let l:choice = confirm('Would you like to source a Session?', l:choice_string, 1)
  if l:choice == 0 || l:choice == l:cancel_index
    return
  endif

  " We have to use a timer or a bizarro race condition from the DirChanged autocommand
  let s:timer = timer_start(300, function('s:Source', [l:session_files[l:choice - 1]]))
endfunction

augroup autosource
  autocmd!
  autocmd DirChanged * exec <SID>DetectSessionFile()
augroup END
