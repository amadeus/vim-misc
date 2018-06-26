let g:vaffle_use_default_mappings = 0

function! s:vaffle_map_default(mode, lhs, vaffle_command, sp_args) abort
  " let rhs = maparg(a:lhs, a:mode)
  " if !empty(rhs)
  "   return
  " endif
  execute printf('%smap %s %s <Plug>(vaffle-%s)',
        \ a:mode,
        \ a:sp_args,
        \ a:lhs,
        \ a:vaffle_command)
endfunction

function! s:CustomVaffleMappings() abort
  " Customize key mappings here
  call s:vaffle_map_default('n', '<c-z>',   'toggle-current',   '<buffer> <silent>')
  call s:vaffle_map_default('v', '<c-z>',   'toggle-current',   '<buffer> <silent>')
  call s:vaffle_map_default('n', '.',       'toggle-hidden',    '<buffer> <silent>')
  call s:vaffle_map_default('n', '*',       'toggle-all',       '<buffer> <silent>')
  " Operations for selected items
  call s:vaffle_map_default('n', 'd',       'delete-selected',  '<buffer> <nowait> <silent>')
  call s:vaffle_map_default('n', 'x',       'fill-cmdline',     '<buffer> <silent>')
  call s:vaffle_map_default('n', 'm',       'move-selected',    '<buffer> <silent>')
  call s:vaffle_map_default('n', '<cr>',    'open-selected',    '<buffer> <silent>')
  call s:vaffle_map_default('n', 'r',       'rename-selected',  '<buffer> <silent>')
  " Operations for a item on cursor
  call s:vaffle_map_default('n', 'l',       'open-current',     '<buffer> <silent>')
  call s:vaffle_map_default('n', 't',       'open-current-tab', '<buffer> <nowait> <silent>')
  " Misc
  call s:vaffle_map_default('n', 'o',       'mkdir',            '<buffer> <silent>')
  call s:vaffle_map_default('n', 'i',       'new-file',         '<buffer> <silent>')
  call s:vaffle_map_default('n', '~',       'open-home',        '<buffer> <silent>')
  call s:vaffle_map_default('n', 'h',       'open-parent',      '<buffer> <silent>')
  call s:vaffle_map_default('n', 'q',       'quit',             '<buffer> <nowait> <silent>')
  call s:vaffle_map_default('n', 'R',       'refresh',          '<buffer> <silent>')
endfunction

augroup custom_vaffle
  autocmd!
  autocmd FileType vaffle call s:CustomVaffleMappings()
augroup END
