scriptencoding utf-8

" ALE Linter Settings
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_save = 1
let g:ale_fix_on_save = 0
let g:ale_warn_about_trailing_whitespace = 0
let g:ale_sign_column_always = 1
let g:ale_echo_msg_format = '[%linter%]% (code)% %s'
let g:ale_fixers = {}
let g:ale_fixers.javascript = ['prettier']
let g:ale_fixers.python = ['black', 'isort']
let g:ale_fixers.json = ['prettier']
let g:ale_fixers.typescript = ['prettier']
let g:ale_fixers.css = ['prettier']
let g:ale_fixers.stylus = ['prettier']
let g:ale_fixers.c = ['clang-format']
let g:ale_hover_cursor = 1
let g:asyncomplete_matchfuzzy = 0
let g:ale_set_balloons = 0
" Kinda looks gross - since I can't make the popup borders more minimal
" I don't want them at all
" let g:ale_floating_preview = 1
" let g:ale_hover_to_floating_preview = 1
" let g:ale_floating_window_border = ['', '', '', '', '', '']
" let g:ale_completion_tsserver_autoimport = 1

let g:ale_completion_autoimport = 1
" It should be noticed, in certain projects, increasing this value too much
" will actually completely break the results I get back from tsserver... not
" sure why yet...
" let g:ale_completion_max_suggestions = 50
let g:ale_completion_max_suggestions = 200
" This should be 0 when using external language servers...
let g:ale_completion_delay = 0
" let g:ale_completion_enabled = 0

if !exists('g:ale_linters')
  let g:ale_linters = {}
endif

" Disabling flow stuff for now - since it gets in the way
" Also disabling deno in typescript as it completely breaks dds.vim
let g:ale_linters = {
\   'javascript': ['eslint', 'fecs', 'jscs', 'jshint', 'standard', 'tsserver', 'xo'],
\   'typescript': ['eslint', 'tslint', 'tsserver', 'typecheck', 'xo'],
\}


" Probably don't need this guy anymore
" let g:ale_echo_delay = 1000

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
