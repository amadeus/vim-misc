let g:coc_filetype_map = {'css.module': 'scss'}
nnoremap <leader>fe :CocCommand eslint.executeAutofix<cr>

nnoremap <leader>ff  :CocCommand prettier.formatFile<cr>
nmap <leader>jd  <Plug>(coc-definition)
nmap <leader>aa  :call CocAction('doHover')<cr>
if has('mac')
  nmap <silent> ˚ <Plug>(coc-diagnostic-prev)
  nmap <silent> ∆ <Plug>(coc-diagnostic-next)
else
  nmap <silent> <a-k> <Plug>(coc-diagnostic-prev)
  nmap <silent> <a-j> <Plug>(coc-diagnostic-next)
endif

nmap <d-j> <Plug>(coc-git-nextchunk)
nmap <d-k> <Plug>(coc-git-prevchunk)

nnoremap <leader>sh  :CocCommand git.chunkStage<cr>
nnoremap <leader>rh  :CocCommand git.chunkUndo<cr>

function! SetupCoCExtensions()
  call coc#add_extension(
    \ 'coc-css',
    \ 'coc-dictionary',
    \ 'coc-emoji',
    \ 'coc-eslint',
    \ 'coc-git',
    \ 'coc-json',
    \ 'coc-prettier',
    \ 'coc-python',
    \ 'coc-stylelint',
    \ 'coc-vimlsp',
  \ )
endfunction
