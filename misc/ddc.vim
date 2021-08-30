call ddc#custom#patch_global('sources', ['ale', 'buffer'])

call ddc#custom#patch_global('sourceOptions', {
  \ '_': {
    \ 'matchers': ['matcher_head'],
    \ 'converters': ['converter_remove_overlap'],
    \ 'sorters': ['sorter_rank'],
    \ 'minAutoCompleteLength': 1,
    \ 'isVolatile': v:true,
  \ },
  \ 'ale': {
    \ 'mark': 'lsp',
    \ 'forceCompletionPattern': '\.|:|->'
  \ },
  \ 'buffer': { 'mark': 'buf' },
\ })

call ddc#custom#patch_global('sourceParams', {
  \ 'buffer': {'requireSameFiletype': v:false},
\ })

" Stuff I may want to experiment with, at some point?
" <TAB>: completion.
" inoremap <silent><expr> <TAB>
" \ pumvisible() ? '<C-n>' :
" \ (col('.') <= 1 <Bar><Bar> getline('.')[col('.') - 2] =~# '\s') ?
" \ '<TAB>' : ddc#manual_complete()
"
" " <S-TAB>: completion back.
" inoremap <expr><S-TAB>  pumvisible() ? '<C-p>' : '<C-h>'

" let g:denops#debug = 1
call ddc#enable()

let g:echodoc#enable_at_startup = 1
