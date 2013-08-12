" Monokai v2
" A custom theme, based on the original monokai

set background=dark
highlight clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "monokai2"

" ================================= "
" === Base Vim Highlight Groups === "
" ================================= "

hi Normal                guifg=#efefef   guibg=#1b1b13   gui=NONE
hi Title                 guifg=#ffffff   guibg=NONE      gui=NONE

hi Comment               guifg=#75715e   guibg=NONE      gui=NONE
hi Constant              guifg=#c500ff   guibg=NONE      gui=NONE
hi String                guifg=#fff600   guibg=#333100   gui=NONE
hi Character             guifg=#c500ff   guibg=NONE      gui=NONE
hi Number                guifg=#c500ff   guibg=NONE      gui=NONE
hi Boolean               guifg=#c500ff   guibg=NONE      gui=NONE
hi Float                 guifg=#c500ff   guibg=NONE      gui=NONE
hi Identifier            guifg=#00d5dd   guibg=NONE      gui=NONE
hi Function              guifg=#00d5dd   guibg=NONE      gui=NONE

hi Statement             guifg=#ff027f   guibg=NONE      gui=NONE
hi Conditional           guifg=#e60000   guibg=NONE      gui=NONE
hi Repeat                guifg=#e60000   guibg=NONE      gui=NONE
hi Label                 guifg=#ff027f   guibg=NONE      gui=NONE
hi Operator              guifg=#ff027f   guibg=NONE      gui=NONE
hi Keyword               guifg=#d7d7d7   guibg=#e60000   gui=NONE
hi Exception             guifg=#e60000   guibg=NONE      gui=NONE

hi PreProc               guifg=#3cff00   guibg=NONE      gui=NONE
hi Include               guifg=#75715e   guibg=#000000   gui=NONE
hi Define                guifg=#75715e   guibg=#000000   gui=NONE
hi Macro                 guifg=#75715e   guibg=#000000   gui=NONE
hi PreCondit             guifg=#75715e   guibg=#000000   gui=NONE

hi Type                  guifg=#3cff00   guibg=NONE      gui=NONE
hi StorageClass          guifg=#ff4b00   guibg=NONE      gui=NONE
hi Structure             guifg=#3cff00   guibg=NONE      gui=NONE
hi Typedef               guifg=#3cff00   guibg=NONE      gui=NONE

hi Special               guifg=#ff4b00   guibg=NONE      gui=NONE
hi SpecialChar           guifg=#ff4b00   guibg=#571a00   gui=NONE
hi Tag                   guifg=#d7d7d7   guibg=#e60000   gui=NONE
hi Delimiter             guifg=#ff027f   guibg=NONE      gui=NONE
hi SpecialComment        guifg=#d7d7d7   guibg=#e60000   gui=NONE
hi Debug                 guifg=#d7d7d7   guibg=#e60000   gui=NONE

hi Underlined            guifg=NONE      guibg=NONE      gui=NONE
hi Ignore                guifg=NONE      guibg=NONE      gui=NONE
hi Error                 guifg=#d7d7d7   guibg=#e60000   gui=NONE
hi Todo                  guifg=#000000   guibg=#75715e   gui=NONE

hi Noise                 guifg=#8200a8   guibg=NONE      gui=NONE

" Vim UI Stuff
hi Cursor                guifg=#000000   guibg=#04a0f7   gui=NONE
hi NonText               guifg=#333333   guibg=NONE      gui=NONE
hi LineNr                guifg=#666666   guibg=#0e0e0a   gui=NONE
hi SignColumn            guifg=#666666   guibg=#0e0e0a   gui=NONE
hi Visual                guifg=NONE      guibg=#800140   gui=NONE
hi VisualNOS             guifg=#ffffff   guibg=#ff0000   gui=NONE
hi VertSplit             guifg=#333333   guibg=#0e0e0a   gui=NONE
hi Pmenu                 guifg=NONE      guibg=#000000   gui=NONE
hi PmenuSel              guifg=#000000   guibg=#72faff   gui=NONE
hi SpecialKey            guifg=#333333   guibg=NONE      gui=NONE
hi StatusLine            guifg=NONE      guibg=#2a2a1c   gui=bold
hi StatusLineNC          guifg=#444444   guibg=#1b1b13   gui=NONE
hi CursorLine            guifg=NONE      guibg=#000000   gui=NONE
hi CursorColumn          guifg=NONE      guibg=#000000   gui=NONE
hi MatchParen            guifg=NONE      guibg=NONE      gui=inverse
hi Search                guifg=#000000   guibg=#fff600   gui=NONE
hi IncSearch             guifg=#000000   guibg=#ff027f   gui=NONE

hi Directory             guifg=#36a6ff   guibg=NONE      gui=NONE
hi Folded                guifg=#75715e   guibg=#000000   gui=NONE
hi FoldColumn            guifg=#75715e   guibg=#0e0e0a   gui=NONE

hi ErrorMsg              guifg=#e60000   guibg=NONE      gui=NONE
hi WarningMsg            guifg=#fff600   guibg=NONE      gui=NONE


" ==================================== "
" === Language and Plugin Specific === "
" ==================================== "

" HTML Specific
hi htmlTag               guifg=#ff027f   guibg=NONE      gui=NONE
hi htmlEndTag            guifg=#ff027f   guibg=NONE      gui=NONE
hi htmlSpecialTagName    guifg=#36a6ff   guibg=#003e65   gui=NONE
hi htmlTagName           guifg=#36a6ff   guibg=#003e65   gui=NONE
hi htmlArg               guifg=#00d9ef   guibg=NONE      gui=NONE
hi htmlSpecialChar       guifg=#bb40f5   guibg=NONE      gui=NONE
hi djangoVarBrackets     guifg=#8200a8   guibg=NONE      gui=NONE
hi djangoTagBrackets     guifg=#8200a8   guibg=NONE      gui=NONE
hi djangoTagBlock        guifg=#c500ff   guibg=NONE      gui=NONE
hi djangoVarBlock        guifg=#c500ff   guibg=NONE      gui=NONE
hi djangoFilter          guifg=#c500ff   guibg=NONE      gui=NONE

" Javascript Specific
hi jsFuncCall            guifg=#cefdff   guibg=#000000   gui=NONE
hi jsUndefined           guifg=#c500ff   guibg=NONE      gui=NONE
hi jsNull                guifg=#c500ff   guibg=NONE      gui=NONE
hi jsFunction            guifg=#00d5dd   guibg=NONE      gui=NONE
hi jsFuncName            guifg=#00d5dd   guibg=NONE      gui=BOLD
hi jsFuncParens          guifg=#00d5dd   guibg=NONE      gui=BOLD
hi jsFuncBraces          guifg=#00d5dd   guibg=NONE      gui=NONE
hi jsFuncArgCommas       guifg=#397d80   guibg=NONE      gui=NONE
hi jsFuncArgs            guifg=#ff4b00   guibg=NONE      gui=italic
hi jsGlobalObjects       guifg=#00d5dd   guibg=NONE      gui=NONE
hi jsOpAssign            guifg=#ff027f   guibg=NONE      gui=NONE
hi jsSpecial             guifg=#ff4b00   guibg=#330f00   gui=NONE
hi jsParens              guifg=#ff027f   guibg=NONE      gui=NONE
hi jsBraces              guifg=#ff027f   guibg=NONE      gui=NONE
hi jsBrackets            guifg=#ff027f   guibg=NONE      gui=NONE
hi jsObjectKey           guifg=#3cff00   guibg=NONE      gui=NONE
hi jsBooleanTrue         guifg=#3cff00   guibg=#155800   gui=NONE
hi jsBooleanFalse        guifg=#ff221e   guibg=#761210   gui=NONE

" YAML Specific
" hi yamlKey             guifg=#36a6ff   guibg=#002d53   gui=NONE
" hi yamlAnchor          guifg=#ff6701   guibg=NONE      gui=NONE
" hi yamlAlias           guifg=#ff6701   guibg=NONE      gui=NONE
" hi yamlDocumentHeader  guifg=#fff200   guibg=#2d2e21   gui=NONE

" Python Specifics
hi pythonBooleanTrue     guifg=#3cff00   guibg=#155800   gui=NONE
hi pythonBooleanFalse    guifg=#ff221e   guibg=#761210   gui=NONE

" CSS Specific
hi cssClassName          guifg=#3cff00   guibg=NONE      gui=NONE
hi cssProp               guifg=#66d9ef   guibg=NONE      gui=NONE
hi cssTagName            guifg=#36a6ff   guibg=#003e65   gui=NONE
hi cssUnitDecorators     guifg=#ff027f   guibg=NONE      gui=NONE
hi cssBraces             guifg=#8200a8   guibg=NONE      gui=NONE
hi cssMediaFeature       guifg=#8200a8   guibg=NONE      gui=NONE
hi cssURL                guifg=#ff4b00   guibg=NONE      gui=italic
hi cssMedia              guifg=#e60000   guibg=NONE      gui=NONE
hi cssPseudoClass        guifg=#ff027f   guibg=#000000   gui=NONE
hi cssPseudoClassId      guifg=#3cff00   guibg=#000000   gui=NONE
hi cssFunction           guifg=#66d9ef   guibg=NONE      gui=NONE
hi cssFunctionName       guifg=#66d9ef   guibg=#173233   gui=NONE
hi cssFunctionComma      guifg=#397d80   guibg=NONE      gui=NONE

" VimL
hi vimCommand            guifg=#ff027b   guibg=NONE      gui=NONE

" Git Diff and Fugitive Plugin
hi DiffAdd               guifg=NONE      guibg=#192e00   gui=NONE
hi DiffText              guifg=#ff027f   guibg=#000000   gui=NONE
hi DiffDelete            guifg=#ff027f   guibg=#330019   gui=NONE
hi DiffChange            guifg=NONE      guibg=#270033   gui=NONE
hi diffAdded             guifg=NONE      guibg=#0c3300   gui=NONE
hi diffRemoved           guifg=NONE      guibg=#330019   gui=NONE
hi diffLine              guifg=NONE      guibg=#270033   gui=NONE
hi gitcommitSummary      guifg=#3cff00   guibg=NONE      gui=bold
hi gitcommitOverflow     guifg=#e60000   guibg=#2e0000   gui=bold

" Todo Plugin
hi todotxtPriA           guifg=#ff0000   guibg=NONE      gui=NONE
hi todotxtPriB           guifg=#d40000   guibg=NONE      gui=NONE
hi todotxtPriC           guifg=#9d0000   guibg=NONE      gui=NONE
hi todotxtPriD           guifg=#6f0000   guibg=NONE      gui=NONE

" GitGutter Plugin
hi GitGutterAdd          guifg=#3cff00   guibg=#0e0e0a   gui=NONE
hi GitGutterChange       guifg=#fff200   guibg=#0e0e0a   gui=NONE
hi GitGutterDelete       guifg=#e60000   guibg=#0e0e0a   gui=NONE
hi GitGutterChangeDelete guifg=#fff600   guibg=#0e0e0a   gui=NONE

" Syntastic Plugin
hi SyntasticErrorSign    guifg=#e60000   guibg=#0e0e0a   gui=bold
hi SyntasticWarningSign  guifg=#fff600   guibg=#0e0e0a   gui=bold

" CtrlP Plugin
hi CtrlPLinePre          guifg=#1e1e1a   guibg=NONE      gui=NONE
hi CtrlPMatch            guifg=#00d245   guibg=#000000   gui=NONE

" Startify Plugin
hi StartifyBracket       guifg=#8200a8   guibg=NONE      gui=NONE
hi StartifyNumber        guifg=#ff027f   guibg=NONE      gui=NONE
hi StartifyHeader        guifg=#ff6600   guibg=NONE      gui=NONE
hi StartifyPath          guifg=#75715e   guibg=NONE      gui=NONE
hi StartifySlash         guifg=#8200a8   guibg=NONE      gui=NONE
hi StartifySpecial       guifg=#75715e   guibg=NONE      gui=NONE