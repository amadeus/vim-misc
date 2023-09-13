scriptencoding utf-8

let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 0
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%]% (code)% %s'

let g:ale_hover_cursor = 1
let g:asyncomplete_matchfuzzy = 0
let g:ale_set_balloons = 0
let g:ale_completion_max_suggestions = 200
" This should be 0 when using external completion tools
let g:ale_completion_delay = 0
let g:ale_echo_delay = 200
let g:ale_virtualtext_cursor = 1
let g:ale_echo_cursor = 0

if !exists('g:ale_linters')
  let g:ale_linters = {}
endif
let g:ale_linters.javascript = ['eslint', 'fecs', 'jscs', 'jshint', 'standard', 'tsserver', 'xo']
let g:ale_linters.typescript = ['eslint', 'tslint', 'tsserver', 'typecheck', 'xo']

if !exists('g:ale_fixers')
  let g:ale_fixers = {}
endif
let g:ale_fixers.javascript = ['prettier']
let g:ale_fixers.python = ['black', 'isort']
let g:ale_fixers.json = ['prettier']
let g:ale_fixers.typescript = ['prettier']
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

if has('mac')
  nmap <silent> ˚ <Plug>(ale_previous_wrap)
  nmap <silent> ∆ <Plug>(ale_next_wrap)
else
  nmap <silent> <a-k> <Plug>(ale_previous_wrap)
  nmap <silent> <a-j> <Plug>(ale_next_wrap)
endif

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

let g:ale_cpp_clangd_options="-I /Users/amadeus/Developer/PlaydateSDK/C_API"
let g:ale_c_clangd_options="-I /Users/amadeus/Developer/PlaydateSDK/C_API"
let g:ale_c_cc_options="-I /Users/amadeus/Developer/PlaydateSDK/C_API"
let g:ale_cpp_cc_options="-I /Users/amadeus/Developer/PlaydateSDK/C_API"
