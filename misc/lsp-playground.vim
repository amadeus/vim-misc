" For debugging only...
let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')

" let g:asyncomplete_log_file = expand('~/asyncomplete.log')
" let g:asyncomplete_auto_popup = 1
" let g:lsp_diagnostics_echo_cursor = 0
" let g:lsp_highlights_enabled = 0
" let g:lsp_textprop_enabled = 0
" let g:lsp_highlight_references_enabled = 0
" let g:lsp_diagnostics_highlights_enabled = 0
" let g:lsp_diagnostics_highlights_insert_mode_enabled = 0
" let g:lsp_diagnostics_signs_enabled = 0
" let g:lsp_diagnostics_virtual_text_enabled = 0

let g:lsp_diagnostics_signs_enabled = 0
let g:lsp_document_code_action_signs_enabled = 0
let g:lsp_signature_help_enabled = 0
let g:lsp_semantic_enabled = 0
let g:lsp_untitled_buffer_enabled = 0
let g:lsp_diagnostics_virtual_text_enabled = 0
let g:lsp_diagnostics_signs_insert_mode_enabled = 0
let g:lsp_diagnostics_highlights_insert_mode_enabled = 0
let g:lsp_diagnostics_highlights_enabled = 0
let g:lsp_diagnostics_enabled = 0
let g:lsp_document_highlight_enabled = 0
let g:lsp_fold_enabled = 0
let g:lsp_signs_enabled = 0
let g:lsp_completion_resolve_timeout = 30000

" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
" " inoremap <c-space> <Plug>(asyncomplete_force_refresh)
" inoremap <expr> <CR> pumvisible() ? asyncomplete#close_popup() . "\<CR>" : "\<CR>"
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
