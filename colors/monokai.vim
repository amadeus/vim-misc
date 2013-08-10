" Monokai from Textmate
" Converted from TextMate Monokai Extreme theme, then modified to suit my needs

set background=dark
highlight clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "monokai"


hi Normal               guifg=#efefef   guibg=#1b1b13   gui=NONE
hi Title                guifg=#ffffff   guibg=NONE      gui=NONE

hi Comment              guifg=#75715e   guibg=NONE      gui=NONE
hi Constant             guifg=#c500ff   guibg=NONE      gui=NONE
hi String               guifg=#fff600   guibg=#333100   gui=NONE
hi Character            guifg=#c500ff   guibg=NONE      gui=NONE
hi Number               guifg=#c500ff   guibg=NONE      gui=NONE
hi Boolean              guifg=#c500ff   guibg=NONE      gui=NONE
hi Float                guifg=#c500ff   guibg=NONE      gui=NONE
hi Identifier           guifg=#00d5dd   guibg=NONE      gui=NONE
hi Function             guifg=#00d5dd   guibg=NONE      gui=NONE

hi Statement            guifg=#ff027f   guibg=NONE      gui=NONE
hi Conditional          guifg=#e60000   guibg=NONE      gui=NONE
hi Repeat               guifg=#e60000   guibg=NONE      gui=NONE
hi Label                guifg=#ff027f   guibg=NONE      gui=NONE
hi Operator             guifg=#ff027f   guibg=NONE      gui=NONE
hi Keyword              guifg=#d7d7d7   guibg=#e60000   gui=NONE
hi Exception            guifg=#e60000   guibg=NONE      gui=NONE

hi PreProc              guifg=#3cff00   guibg=NONE      gui=NONE
hi Include              guifg=#75715e   guibg=#000000   gui=NONE
hi Define               guifg=#75715e   guibg=#000000   gui=NONE
hi Macro                guifg=#75715e   guibg=#000000   gui=NONE
hi PreCondit            guifg=#75715e   guibg=#000000   gui=NONE

hi Type                 guifg=#3cff00   guibg=NONE      gui=NONE
hi StorageClass         guifg=#ff4b00   guibg=NONE      gui=NONE
hi Structure            guifg=#3cff00   guibg=NONE      gui=NONE
hi Typedef              guifg=#3cff00   guibg=NONE      gui=NONE

hi Special              guifg=#ff4b00   guibg=NONE      gui=NONE
hi SpecialChar          guifg=#ff4b00   guibg=#571a00   gui=NONE
hi Tag                  guifg=#d7d7d7   guibg=#e60000   gui=NONE
hi Delimiter            guifg=#ff027f   guibg=NONE      gui=NONE
hi SpecialComment       guifg=#d7d7d7   guibg=#e60000   gui=NONE
hi Debug                guifg=#d7d7d7   guibg=#e60000   gui=NONE

hi Underlined           guifg=NONE      guibg=NONE      gui=NONE
hi Ignore               guifg=NONE      guibg=NONE      gui=NONE
hi Error                guifg=#d7d7d7   guibg=#e60000   gui=NONE
hi Todo                 guifg=#000000   guibg=#75715e   gui=NONE

hi Noise                guifg=#8200a8   guibg=NONE      gui=NONE

" Vim UI Stuff
hi Cursor               guifg=#000000   guibg=#04a0f7   gui=NONE
hi NonText              guifg=#333333   guibg=NONE      gui=NONE
hi LineNr               guifg=#666666   guibg=#0e0e0a   gui=NONE
hi SignColumn           guifg=#666666   guibg=#0e0e0a   gui=NONE
hi Visual               guifg=NONE      guibg=#800140   gui=NONE
hi VisualNOS            guifg=#ffffff   guibg=#ff0000   gui=NONE
hi VertSplit            guifg=#808080   guibg=#000000   gui=NONE
hi Pmenu                guifg=NONE      guibg=#000000   gui=NONE
hi PmenuSel             guifg=#000000   guibg=#72faff   gui=NONE
hi SpecialKey           guifg=#333333   guibg=NONE      gui=NONE
hi StatusLine           guifg=NONE      guibg=#2a2a1c   gui=bold
hi StatusLineNC         guifg=#444444   guibg=#1b1b13   gui=NONE
hi CursorLine           guifg=NONE      guibg=#000000   gui=NONE
hi CursorColumn         guifg=NONE      guibg=#000000   gui=NONE
hi MatchParen           guifg=#04a0f7   guibg=#000000   gui=NONE
hi Search               guifg=#000000   guibg=#fff600   gui=NONE
hi IncSearch            guifg=#000000   guibg=#ff027f   gui=NONE

hi Directory            guifg=#36a6ff   guibg=NONE      gui=NONE
hi Folded               guifg=#75715e   guibg=#000000   gui=NONE
hi FoldColumn           guifg=#75715e   guibg=#0e0e0a   gui=NONE

hi ErrorMsg             guifg=#e60000   guibg=NONE      gui=NONE
hi WarningMsg           guifg=#fff600   guibg=NONE      gui=NONE


" === Language Specific Stuff === "

" Startify
hi StartifyBracket      guifg=#8200a8   guibg=NONE      gui=NONE
hi StartifyNumber       guifg=#ff027f   guibg=NONE      gui=NONE

" HTML Specific
hi htmlTag                      guifg=#ff027f   guibg=NONE      gui=NONE
hi htmlEndTag                   guifg=#ff027f   guibg=NONE      gui=NONE
hi htmlSpecialTagName           guifg=#36a6ff   guibg=#003e65   gui=NONE
hi htmlTagName                  guifg=#36a6ff   guibg=#003e65   gui=NONE
hi htmlArg                      guifg=#00d9ef   guibg=NONE      gui=NONE
hi htmlSpecialChar              guifg=#bb40f5   guibg=NONE      gui=NONE
hi djangoVarBrackets            guifg=#8200a8   guibg=NONE      gui=NONE
hi djangoTagBrackets            guifg=#8200a8   guibg=NONE      gui=NONE
hi djangoTagBlock               guifg=#c500ff   guibg=NONE      gui=NONE
hi djangoVarBlock               guifg=#c500ff   guibg=NONE      gui=NONE
hi djangoFilter                 guifg=#c500ff   guibg=NONE      gui=NONE

" Javascript Specific
hi jsFuncCall                   guifg=#cefdff   guibg=#000000   gui=NONE
hi jsUndefined                  guifg=#c500ff   guibg=NONE      gui=NONE
hi jsNull                       guifg=#c500ff   guibg=NONE      gui=NONE
hi jsFunction                   guifg=#00d5dd   guibg=NONE      gui=NONE
hi jsFuncName                   guifg=#00d5dd   guibg=NONE      gui=BOLD
hi jsFuncParens                 guifg=#00d5dd   guibg=NONE      gui=BOLD
hi jsFuncBraces                 guifg=#00d5dd   guibg=NONE      gui=NONE
hi jsFuncArgCommas              guifg=#397d80   guibg=NONE      gui=NONE
hi jsFuncArgs                   guifg=#ff4b00   guibg=NONE      gui=italic
hi jsGlobalObjects              guifg=#00d5dd   guibg=NONE      gui=NONE
hi jsOpAssign                   guifg=#ff027f   guibg=NONE      gui=NONE
hi jsSpecial                    guifg=#ff4b00   guibg=#330f00   gui=NONE
hi jsParens                     guifg=#ff027f   guibg=NONE      gui=NONE
hi jsBraces                     guifg=#ff027f   guibg=NONE      gui=NONE
hi jsBrackets                   guifg=#ff027f   guibg=NONE      gui=NONE
hi jsObjectKey                  guifg=#3cff00   guibg=NONE      gui=NONE
hi jsBooleanTrue                guifg=#3cff00   guibg=#155800     gui=NONE
hi jsBooleanFalse               guifg=#ff221e   guibg=#761210     gui=NONE

" YAML Specific
" hi yamlKey                    guifg=#36a6ff   guibg=#002d53   gui=NONE
" hi yamlAnchor                 guifg=#ff6701   guibg=NONE      gui=NONE
" hi yamlAlias                  guifg=#ff6701   guibg=NONE      gui=NONE
" hi yamlDocumentHeader         guifg=#fff200   guibg=#2d2e21   gui=NONE

" Python Specifics
hi pythonBooleanTrue          guifg=#3cff00   guibg=#155800     gui=NONE
hi pythonBooleanFalse         guifg=#ff221e   guibg=#761210     gui=NONE

" CSS Specific
hi cssClassName               guifg=#3cff00     guibg=NONE      gui=NONE
hi cssProp                    guifg=#66d9ef     guibg=NONE      gui=NONE
hi cssTagName                 guifg=#36a6ff     guibg=#003e65   gui=NONE
hi cssUnitDecorators          guifg=#ff027f     guibg=NONE      gui=NONE
hi cssBraces                  guifg=#8200a8     guibg=NONE      gui=NONE
hi cssMediaFeature            guifg=#8200a8     guibg=NONE      gui=NONE
hi cssURL                     guifg=#ff4b00     guibg=NONE      gui=italic
hi cssMedia                   guifg=#e60000     guibg=NONE      gui=NONE
hi cssPseudoClass             guifg=#ff027f     guibg=#000000   gui=NONE
hi cssPseudoClassId           guifg=#3cff00     guibg=#000000   gui=NONE
hi cssFunction                guifg=#66d9ef     guibg=NONE
hi cssFunctionName            guifg=#66d9ef     guibg=#173233
hi cssFunctionComma           guifg=#397d80   guibg=NONE      gui=NONE
" hi cssFunctionName            guifg=#00d9ef   guibg=NONE      gui=NONE
" hi cssColor                   guifg=#bb40f5   guibg=NONE      gui=NONE
" hi cssValueLength             guifg=#b700ff   guibg=NONE      gui=NONE
" hi cssBraket                  guifg=#ff0f51   guibg=NONE      gui=NONE
" hi cssTagName                 guifg=#36a6ff   guibg=#003e65
" hi cssAtkeyword               guifg=#ff027e
" hi cssAtType                  guifg=#ff027e
" hi cssClass                   guifg=#a6e229
" hi cssPropRegion              guifg=#66d9ef
" hi cssFuncRegion              guifg=#66d9ef
" hi cssAtkey                   guifg=#59d9ef
" hi cssAttr                    guifg=#bb40f5
" hi cssAtProps                 guifg=#66d9ef
" hi cssPathFn                  guifg=#f8ab00   guibg=NONE      gui=italic
" hi cssValFn                   guifg=#66d9ef
" hi cssPseudoClass             guifg=#a6e229   guibg=#000000
" hi cssPrefix                  guifg=#66d9ef   guibg=#000000
" hi cssFuncBracket             guifg=#ff027e
" hi cssPunctuation             guifg=#ff027e
" hi cssFontDescriptorBlock     guifg=#ff027e
" hi cssFunction                guifg=#00d9ef
" hi cssBraces                  guifg=#ff0275
" hi cssSelector                guifg=#fff200   guibg=#2d2e21   gui=NONE

" hi cssPropRegion
" hi cssAttr                    guifg=#66d9ef
" hi cssAttributeSelector       guifg=#66d9ef
" hi cssPrefix                  guifg=#66d9ef   guibg=#10282c

" Vim Specific - causes weirdness.
" hi vimSetEqual                  guifg=#ff027f   guibg=NONE      gui=NONE

" Git Diff Styling
hi DiffAdd                    guifg=NONE      guibg=#0c3300     gui=NONE
hi DiffText                   guifg=#ff027f   guibg=NONE        gui=NONE
hi DiffDelete                 guifg=#ff027f   guibg=#330019     gui=NONE
hi DiffChange                 guifg=NONE      guibg=#270033     gui=NONE
hi diffAdded                  guifg=NONE      guibg=#0c3300     gui=NONE
hi diffRemoved                guifg=NONE      guibg=#330019     gui=NONE
hi diffLine                   guifg=NONE      guibg=#270033     gui=NONE


" TESTING: Todo Plugin
hi IndentGuidesOdd            guibg=#2a2a26
hi IndentGuidesEven           guibg=#2a2a26


" TESTING: Todo Plugins
hi todotxtPriA                guifg=#ff0000
hi todotxtPriB                guifg=#d40000
hi todotxtPriC                guifg=#9d0000
hi todotxtPriD                guifg=#6f0000


" TESTING: Fixing GitGutter and Syntastic colors
hi GitGutterAdd               guifg=#3cff00 guibg=#0e0e0a ctermfg=2 ctermbg=NONE
hi GitGutterChange            guifg=#fff200 guibg=#0e0e0a ctermfg=3 ctermbg=NONE
hi GitGutterDelete            guifg=#e60000 guibg=#0e0e0a ctermfg=1 ctermbg=NONE
hi GitGutterChangeDelete      guifg=#fff600 guibg=#0e0e0a ctermfg=1 ctermbg=NONE

hi SyntasticErrorSign         guifg=#e60000 guibg=#0e0e0a gui=bold
hi SyntasticWarningSign       guifg=#fff600 guibg=#0e0e0a gui=bold

" TESTING: VimL specific
hi vimCommand                 guifg=#ff027b   guibg=NONE      gui=NONE


" TESTING: Vim Fugitive stuff
hi gitcommitSummary           guifg=#3cff00   guibg=NONE      gui=bold
hi gitcommitOverflow          guifg=#e60000   guibg=#2e0000   gui=bold


" TESTING: Fixing CtrlP
hi CtrlPLinePre guifg=#1e1e1a
hi CtrlPMatch   guifg=#00d245 guibg=#000000


" TESTING: Startify
hi StartifyHeader                guifg=#ff6600
