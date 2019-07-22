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
let g:ale_fixers.json = ['prettier']
let g:ale_fixers.typescript = ['prettier']
let g:ale_fixers.css = ['prettier']
let g:ale_fixers.stylus = ['prettier']
" Probably don't need this guy anymore
" let g:ale_echo_delay = 1000

nnoremap <leader>at  :ALEToggle<cr>
nnoremap <leader>ff  :ALEFix<cr>
nnoremap <leader>jd  :ALEGoToDefinition<cr>
nmap <leader>jt  <Plug>(coc-implementation)
nnoremap <leader>aa  :ALEHover<cr>
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

