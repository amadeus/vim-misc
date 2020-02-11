" FZF Configuration

" NOTE: passing a dict to window enables the popup window functionality
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.6 } }

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'IncSearch'],
  \ 'fg+':     ['fg', 'WildMenu'],
  \ 'bg+':     ['bg', 'WildMenu'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" https://github.com/junegunn/fzf.vim/pull/733#issuecomment-559720813
" https://github.com/junegunn/fzf/blob/master/README-VIM.md
function! Bufs()
  redir => list
  silent ls
  redir END
  return split(list, "\n")
endfunction

let s:config = {
  \ 'source': Bufs(),
  \ 'sink*': { lines -> execute('bwipeout '.join(map(lines, {_, line -> split(line)[0]}))) },
  \ 'options': '--multi --reverse --bind ctrl-a:select-all+accept'
\ }

command! BD call fzf#run(fzf#wrap(s:config))

nnoremap <leader>t :GFiles<cr>
" nnoremap <leader>gf :Files<cr>
nnoremap <leader>b :Buffers<cr>
nnoremap <leader>/ :Rg<cr>
