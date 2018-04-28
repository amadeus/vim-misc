" Adds a couple CSS Module plugins that we have to highlight properly
function! CSSModuleTweaks()
  syntax match cssProp contained /\%(fixed\|absolute\|relative\|size\)/
endfunction
nnoremap  <leader>css :call CSSModuleTweaks()<cr>:
