let g:startify_custom_header = [
  \ '                                ______      ',
  \ '            __                /\  ____`\    ',
  \ '   __   __ /\_\    ___ ___    \ \ \___\ \   ',
  \ '  /\ \ /\ \\/\ \ /` __` __`\   \ \  ____ \  ',
  \ '  \ \ \_/ / \ \ \/\ \/\ \/\ \   \ \ \___\ \ ',
  \ '   \ \___/   \ \_\ \_\ \_\ \_\   \ \_______\',
  \ '    \/__/     \/_/\/_/\/_/\/_/    \/_______/',
  \ '                                            ',
  \ '  ==========================================',
  \ '                                            ',
  \ ]
let g:ascii = []
let g:startify_custom_footer = 'map(startify#fortune#boxed() + g:ascii, "\"   \".v:val")'
let g:startify_session_autoload = 0 " Testing out my new session sourcing code
let g:startify_change_to_dir = 1
let g:ctrlp_reuse_window = 'startify'
let g:startify_list_order = ['bookmarks', 'files']
let g:startify_skiplist = [
  \ 'COMMIT_EDITMSG',
  \ $VIMRUNTIME .'/doc',
  \ 'bundle/.*/doc',
  \ '\.DS_Store'
  \ ]
let g:startify_fortune_use_unicode = 1

" Disable startify in terminal vim it just doesn't feel right
if !has('gui_running')
  let g:startify_disable_at_vimenter = 1
endif

