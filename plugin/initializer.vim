" A simple script to fetch and download my general project configs that I
" like to use for create-react-app JS projects

if exists('g:did_run_initializer')
 finish
endif


let s:files = {
  \ '.prettierrc': {'url': 'https://gist.github.com/amadeus/b6d360e7e6823ab226be85dc0c1fae29/raw'},
  \ '.lvimrc': {'url': 'https://gist.github.com/amadeus/7b6acc7c292ef5aece87b4b466b84e9a/raw', 'open': 1}
\ }

let s:filenames = keys(s:files)

function! s:fetch_files()
  let existing_files = s:files_exist()
  if len(existing_files) > 0
    echom 'Cannot initialize project, some file already exist: '.join(existing_files, ', ')
    return
  endif
  for filename in s:filenames
    call s:fetch_file(filename)
  endfor
endfunction

function! s:fetch_file(filename)
  let file_info = get(s:files, a:filename)
  call job_start(['curl', '-o', a:filename, get(file_info, 'url').'?r='.reltime()[0], '-L'], {'close_cb': {-> s:fetch_complete(a:filename)}})
endfunction

function! s:files_exist()
  let files = []
  for filename in s:filenames
    if filereadable('./'.filename)
      call add(files, filename)
    endif
  endfor
  return files
endfunction

function! s:fetch_complete(filename)
  let file_info = get(s:files, a:filename)
  if get(file_info, 'open') == 1
    execute ':silent vsplit '.a:filename
  endif
endfunction

command! Initializer call s:fetch_files()
let g:did_run_initializer = 1
