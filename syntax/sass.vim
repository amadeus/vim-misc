runtime! syntax/css.vim
syntax match sassAmpersand contained /&/ nextgroup=cssPseudoClass containedin=cssDefinition

if version >= 508 || !exists("did_css_syn_inits")
  if version < 508
    let did_css_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif
  HiLink sassAmpersand Special
  delcommand HiLink
endif

let b:current_syntax = "sass"
