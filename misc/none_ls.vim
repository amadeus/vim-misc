lua << EOF
-- Found this plugin to require way too much configuration, which really
-- sucked.  Currently think ALE works much better and is less config

-- Function for ESLint formatting
function _G.format_eslint()
  vim.lsp.buf.format({
    filter = function(client)
      return client.name == "eslint" or client.name == "null-ls"
    end
  })
end

-- Function for generic formatting
function _G.format_buffer()
    vim.lsp.buf.format({ async = true })
end
EOF

" Equivalent keybindings to your ALE mappings
" ALEFix -> LSP formatting
nnoremap <leader>ff :lua format_buffer()<CR>

" ALEGoToDefinition -> LSP go to definition
nnoremap <leader>jd :lua vim.lsp.buf.definition()<CR>

" ALEHover -> LSP hover
nnoremap <leader>aa :lua vim.lsp.buf.hover()<CR>

" ALEDetail -> LSP diagnostics at current position
nnoremap <leader>ad :lua vim.diagnostic.open_float()<CR>

" ALEFix eslint -> LSP format with eslint
nnoremap <leader>fe :lua format_eslint()<CR>

" ALEFindReferences -> LSP find references
nnoremap <leader>fr :lua vim.lsp.buf.references()<CR>

" ALERename -> LSP rename
nnoremap <leader>rr :lua vim.lsp.buf.rename()<CR>

" ALECodeAction -> LSP code action
nnoremap <leader>ca :lua vim.lsp.buf.code_action()<CR>
