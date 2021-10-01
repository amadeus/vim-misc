" call ddc#custom#patch_global('sources', ['tabnine', 'ale', 'buffer'])
call ddc#custom#patch_global('sources', ['ale', 'buffer'])
" Enable this for testing my file source
" call ddc#custom#patch_global('sources', ['ale', 'buffer', 'file'])

call ddc#custom#patch_global('sourceOptions', {
  \ '_': {
    \ 'matchers': ['matcher_head'],
    \ 'converters': ['converter_remove_overlap'],
    \ 'sorters': ['sorter_rank'],
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
  \ 'tabnine': {
    \ 'mark': 'TN',
    \ 'isVolatile': v:true,
    \ 'maxSize': 200,
  \ }
\ })

call ddc#enable()

let g:echodoc#enable_at_startup = 1
" let g:denops#debug = 1
" let g:denops#trace = 1
