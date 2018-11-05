" TESTING: LanguageClient
let g:LanguageClient_serverCommands = {
	\ 'javascript': ['flow-language-server', '--stdio'],
	\ 'javascript.jsx': ['flow-language-server', '--stdio'],
	\ }
set completefunc=LanguageClient#complete
let g:deoplete#enable_at_startup = 1

" TESTING: vim-lsp settings
if executable('flow-language-server')
	au User lsp_setup call lsp#register_server({
		\ 'name': 'flow-language-server',
		\ 'cmd': {server_info->[&shell, &shellcmdflag, 'flow-language-server --stdio']},
		\ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), '.flowconfig'))},
		\ 'whitelist': ['javascript', 'javascript.jsx'],
		\ })
endif

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#flow#get_source_options({
	\ 'name': 'flow',
	\ 'whitelist': ['javascript', 'javascript.jsx'],
	\ 'completor': function('asyncomplete#sources#flow#completor'),
	\ 'config': {
	\    'prefer_local': 1,
	\    'flowbin_path': expand('/usr/local/bin/flow'),
	\    'show_typeinfo': 1
	\  },
	\ }))

let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')
let g:asyncomplete_log_file = expand('~/asyncomplete.log')
let g:asyncomplete_auto_popup = 1

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif


" TESTING: Deoplete
let g:deoplete#enable_at_startup = 1
let g:neosnippet#enable_completed_snippet = 1
let g:deoplete#auto_complete_start_length = 1
let g:deoplete#enable_yarp = 1
let g:deoplete#file#enable_buffer_path = 1


" TESTING: LanguageClient
let g:nvim_typescript#javascript_support = 1
let g:LanguageClient_serverCommands = {
\ 'javascript': ['flow-language-server', '--stdio'],
\ 'javascript.jsx': ['flow-language-server', '--stdio'],
\ }
