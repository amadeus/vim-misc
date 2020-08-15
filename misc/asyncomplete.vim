" AsyncComplete
" let g:lsp_highlight_references_enabled = 0
" let g:lsp_highlights_enabled = 0
" let g:lsp_textprop_enabled = 0
" let g:lsp_diagnostics_echo_cursor = 0
" let g:lsp_signs_enabled = 0
" let g:lsp_virtual_text_enabled = 0
" function! s:get_flowbin(server_info)
"     let l:nodemodules_dir = lsp#utils#find_nearest_parent_directory(lsp#utils#get_buffer_path(), 'node_modules')
"     if !empty(nodemodules_dir)
"         " you might also want to verify if flow binary actually exists
"         return [&shell, &shellcmdflag, l:nodemodules_dir . '/.bin/flow lsp']
"     endif
"     " instead of returning empty you could also return ['flow', 'lsp] to tell it to use global flow.
"     return []
" endfunction

" let g:asyncomplete_preprocessor =
"   \ [function('asyncomplete#preprocessor#ezfilter#filter')]
"
" let g:asyncomplete#preprocessor#ezfilter#config = {}
" let g:asyncomplete#preprocessor#ezfilter#config['*'] =
"   \ {ctx, items -> filter(items, 'stridx(v:val.word, ctx.base) == 0')}

inoremap <expr> <CR> pumvisible() ? asyncomplete#close_popup() . "\<CR>" : "\<CR>"

augroup asyncomplete_custom_sources
  autocmd!
  autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#ale#get_source_options({}))
  " vim-lsp is disabled for now - while I use ALE instead
  " autocmd User lsp_setup call lsp#register_server({
  "   \ 'name': 'flow',
  "   \ 'cmd': function('s:get_flowbin'),
  "   \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), '.flowconfig'))},
  "   \ 'whitelist': ['javascript', 'javascript.jsx'],
  "   \ })
  autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
    \ 'name': 'omni',
    \ 'whitelist': ['css', 'css.module'],
    \ 'completor': function('asyncomplete#sources#omni#completor')
    \  }))
  " autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
  "   \ 'name': 'file',
  "   \ 'whitelist': ['*'],
  "   \ 'completor': function('asyncomplete#sources#file#completor')
  "   \ }))
  autocmd User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#buffer#get_source_options({
    \ 'name': 'buffer',
    \ 'whitelist': ['*'],
    \ 'completor': function('asyncomplete#sources#buffer#completor'),
    \ }))
augroup END
