if has('nvim') == 1
  " inoremap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
  " inoremap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>
  " inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
  " inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>
  " inoremap <PageDown> <Cmd>call pum#map#insert_relative_page(+1)<CR>
  " inoremap <PageUp>   <Cmd>call pum#map#insert_relative_page(-1)<CR>

  call ddc#custom#patch_global('sources', ['lsp', 'vsnip'])

  call ddc#custom#patch_global('sourceOptions', #{
  \   _: #{
  \     matchers: ['matcher_head'],
  \     sorters: ['sorter_rank'],
  \     converters: ['converter_remove_overlap'],
  \     minAutoCompleteLength: 0,
  \   },
  \   lsp: #{
  \     mark: 'lsp',
  \     forceCompletionPattern: "\.\w*|:\w*|->\w*|=\"|='",
  \   },
  \   vsnip: #{
  \     mark: 'vsnip'
  \   }
  \ })

  " \   snippetEngine: denops#callback#register({ body -> vsnip#anonymous(body) }),
  call ddc#custom#patch_global('sourceParams', #{
  \   lsp: #{
  \     snippetEngine: denops#callback#register({
  \       body -> vsnip#anonymous(body)
  \     }),
  \     enableResolveItem: v:true,
  \     enableAdditionalTextEdit: v:true,
  \   },
  \ })
else
  " call ddc#custom#patch_global('sources', ['tabnine', 'ale', 'buffer'])
  call ddc#custom#patch_global('sources', ['ale', 'buffer'])
  " Enable this for testing my file source
  " call ddc#custom#patch_global('sources', ['ale', 'buffer', 'file'])
  call ddc#custom#patch_global('backspaceCompletion', v:true)
  call ddc#custom#patch_global('autoCompleteEvents', ['InsertEnter', 'TextChangedI', 'TextChangedP', 'CmdlineChanged'])

  " \ 'file': {
  "   \ 'mark': 'file',
  " \ },
  "  \ 'tabnine': {
  "    \ 'mark': 'TN',
  "    \ 'isVolatile': v:true,
  "  \ }
  "  \ 'omni': {
  "    \ 'mark': 'omni',
  "  \ }
  call ddc#custom#patch_global('sourceOptions', {
    \ '_': {
      \ 'matchers': ['matcher_head'],
      \ 'sorters': ['sorter_rank'],
      \ 'converters': ['converter_remove_overlap'],
      \ 'minAutoCompleteLength': 0,
    \ },
    \ 'ale': {
      \ 'mark': 'lsp',
      \ 'forceCompletionPattern': '\.|: |->|\./',
    \ },
    \ 'buffer': {
      \ 'mark': 'buf',
    \ }
  \ })

  " pum.vim has fixed the wrapping issue since someone else found a good repro,
  " now I just need to test it a bit more to find out if it's actually right for me!
  " call ddc#custom#patch_global('completionMenu', 'pum.vim')
  " inoremap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
  " inoremap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>
  " inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
  " inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>

  " This autocommand hack allows the auto import functionality to work after a
  " completion is implemented
  " augroup DDCCompletions
  "   autocmd!
  "   autocmd User PumCompleteDone call ale#completion#HandleUserData(g:pum#completed_item)
  " augroup END
endif

call ddc#custom#patch_global('ui', 'native')

call ddc#enable()

let g:echodoc#enable_at_startup = 1
" let g:denops#debug = 1
" let g:denops#trace = 1
