" call ddc#custom#patch_global('sources', ['tabnine', 'ale', 'buffer'])
call ddc#custom#patch_global('sources', ['ale', 'buffer'])
" Enable this for testing my file source
" call ddc#custom#patch_global('sources', ['ale', 'buffer', 'file'])

call ddc#custom#patch_global('sourceOptions', {
  \ '_': {
    \ 'matchers': ['matcher_head'],
    \ 'sorters': ['sorter_rank'],
    \ 'converters': ['converter_remove_overlap'],
    \ 'minAutoCompleteLength': 1,
  \ },
  \ 'ale': {
    \ 'mark': 'lsp',
    \ 'forceCompletionPattern': '\.|:|->|\./',
  \ },
  \ 'buffer': {
    \ 'mark': 'buf',
  \ },
  \ 'file': {
    \ 'mark': 'file',
  \ },
  \ 'omni': {
    \ 'mark': 'omni',
  \ },
  \ 'tabnine': {
    \ 'mark': 'TN',
    \ 'isVolatile': v:true,
    \ 'maxSize': 200,
  \ }
\ })

" Try enabling this after the wrapping issue gets fixed?
" call ddc#custom#patch_global('completionMenu', 'pum.vim')
" inoremap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
" inoremap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>
" inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
" inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

call ddc#enable()

let g:echodoc#enable_at_startup = 1
" let g:denops#debug = 1
" let g:denops#trace = 1
