" FZF Configuration

" NOTE: passing a dict to window enables the popup window functionality
let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.6, 'border': 'top', 'yoffset': 1.0} }

let g:fzf_colors = {
  \ 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'IncSearch'],
  \ 'fg+':     ['fg', 'WildMenu'],
  \ 'bg+':     ['bg', 'WildMenu'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'LineNr'],
  \ 'prompt':  ['fg', 'Comment'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'],
  \ 'gutter':  ['bg', 'Normal']
\ }

" https://github.com/junegunn/fzf.vim/pull/733#issuecomment-559720813
" https://github.com/junegunn/fzf/blob/master/README-VIM.md
function! s:list_buffers()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

" I find the preview window ends up taking valuable real estate, and I never
" really find it useful in practice (even if it does feel kinda cool), yet it
" often causes filenames to be trunctated, which I don't love... tbh
let g:fzf_preview_window = []

function! s:delete_buffers(lines)
  execute 'bwipeout' join(map(a:lines, {_, line -> split(line)[0]}))
endfunction

command! BD call fzf#run(fzf#wrap({
  \ 'source': s:list_buffers(),
  \ 'sink*': { lines -> s:delete_buffers(lines) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }))

nnoremap <leader>t :GFiles<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>/ :Rg<cr>
