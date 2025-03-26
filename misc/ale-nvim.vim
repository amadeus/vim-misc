scriptencoding utf-8

let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 0
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%]% (code)% %s'

let g:ale_hover_cursor = 1
let g:ale_set_balloons = 0

let g:ale_echo_delay = 200
let g:ale_virtualtext_cursor = 1
let g:ale_echo_cursor = 0

let g:ale_linter_aliases = {'typescript.tsx': ['typescript', 'tsx']}

if !exists('g:ale_linters')
  let g:ale_linters = {}
endif
let g:ale_linters.javascript = ['eslint', 'tsserver']
let g:ale_linters.javascriptreact = ['eslint', 'tsserver']
let g:ale_linters.typescript = ['eslint', 'tsserver']
let g:ale_linters.typescriptreact = ['eslint', 'tsserver']

if !exists('g:ale_fixers')
  let g:ale_fixers = {}
endif
let g:ale_fixers.javascript = ['prettier']
let g:ale_fixers.python = ['black', 'isort']
let g:ale_fixers.json = ['prettier']
let g:ale_fixers.typescript = ['prettier']
let g:ale_fixers.typescriptreact = ['prettier']
let g:ale_fixers.tsx = ['prettier']
let g:ale_fixers.css = ['prettier']
let g:ale_fixers.stylus = ['prettier']
let g:ale_fixers.c = ['clang-format']
let g:ale_save_hidden = 1

nnoremap <leader>at  :ALEToggle<cr>
nnoremap <leader>ff  :ALEFix<cr>
nnoremap <leader>fw  :ALEFix trim_whitespace<cr>
nnoremap <leader>jd  :ALEGoToDefinition<cr>
nnoremap <leader>aa  :ALEHover<cr>
nnoremap <leader>ad  :ALEDetail<cr>
nnoremap <leader>fe  :ALEFix eslint<cr>
nnoremap <leader>fr  :ALEFindReferences<cr>
nnoremap <leader>rr  :ALERename<cr>
nnoremap <leader>ca  :ALECodeAction<cr>
let g:ale_use_neovim_diagnostics_api = 0

"nmap <silent> <a-k> <Plug>(ale_previous_wrap)
"nmap <silent> <a-j> <Plug>(ale_next_wrap)

function! ToggleFormatSave()
  if exists('b:ale_fix_on_save')
    let b:ale_fix_on_save = !b:ale_fix_on_save
  elseif exists('g:ale_fix_on_save')
    let b:ale_fix_on_save = !g:ale_fix_on_save
  else
    let b:ale_fix_on_save = 1
  endif
  if b:ale_fix_on_save
    echo 'Formatting file on save'
  else
    echo 'Preserving formatting on save'
  endif
endfunction
nnoremap <leader>pf :call ToggleFormatSave()<cr>

" call ale#fix#registry#Add('lua_format', 'lua_format#Fix', ['lua'], 'Fix Lua files with lua-format')

let g:ale_cpp_clangd_options='-I /Users/amadeus/Developer/PlaydateSDK/C_API'
let g:ale_c_clangd_options='-I /Users/amadeus/Developer/PlaydateSDK/C_API'
let g:ale_c_cc_options='-I /Users/amadeus/Developer/PlaydateSDK/C_API'
let g:ale_cpp_cc_options='-I /Users/amadeus/Developer/PlaydateSDK/C_API'

let g:ale_disable_lsp = 1
let g:ale_set_highlights = 0
let g:ale_set_signs = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 0
let g:ale_lint_on_filetype_changed = 0
