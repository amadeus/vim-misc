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
hi Identifier           guifg=#72faff   guibg=NONE      gui=NONE
hi Statement            guifg=#e60000   guibg=NONE      gui=NONE
hi Operator             guifg=#ff027f   guibg=NONE      gui=NONE
hi PreProc              guifg=#75715e   guibg=#000000   gui=BOLD
hi Special              guifg=#ff4b00   guibg=NONE      gui=NONE
hi Type                 guifg=#3cff00   guibg=NONE      gui=NONE
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
hi VertSplit            guifg=#808080   guibg=#000000   gui=NONE
hi Pmenu                guifg=NONE      guibg=#000000   gui=NONE
hi PmenuSel             guifg=#000000   guibg=#72faff   gui=NONE
hi SpecialKey           guifg=#333333   guibg=NONE      gui=NONE
hi StatusLine           guifg=NONE      guibg=#2a2a1c   gui=bold
hi StatusLineNC         guifg=#444444   guibg=#1b1b13   gui=NONE


" hi Boolean
" hi Float
" hi Function
" hi Statement
" hi Conditional
" hi Repeat
" hi Label
" hi Keyword
" hi Exception
" hi Include
" hi Define
" hi Macro
" hi PreCondit
" hi StorageClass
" hi Structure
" hi Typedef
" hi SpecialChar
" hi Tag
" hi Delimiter
" hi SpecialComment
" hi Debug
" hi Underlined
" hi Ignore
" hi Error
" hi Todo

" hi Error                      guifg=#ffffff   guibg=#a00000   gui=NONE
" hi CursorLine                                 guibg=#000000   gui=NONE
" hi CursorColumn               guifg=NONE      guibg=#2d2d27   gui=NONE
" hi MatchParen                 guifg=#04a0f7   guibg=#000000   gui=NONE
" hi IncSearch                  guifg=#000000   guibg=#ffe402   gui=NONE
" hi Search                     guifg=#ffffff   guibg=#f92672   gui=NONE
" hi Directory                  guifg=#bb40f5   guibg=NONE      gui=NONE
" hi Folded                     guifg=#75715e   guibg=#000000   gui=NONE
" hi FoldColumn                 guifg=#75715e   guibg=#000000   gui=NONE
" hi Ignore                     guifg=#000000
"
" hi Boolean                    guifg=#bb40f5   guibg=NONE      gui=NONE
" hi Number                     guifg=#bb40f5   guibg=NONE      gui=NONE
" hi Conditional                guifg=#ff1800   guibg=NONE      gui=none
" hi Repeat                     guifg=#ff1800   guibg=NONE      gui=none
" hi Define                     guifg=#fb5815   guibg=NONE      gui=NONE
" hi ErrorMsg                   guifg=#f8f8f0   guibg=#f92672   gui=inverse
" hi WarningMsg                 guifg=#f8f8f0   guibg=#f92672   gui=NONE
" hi Float                      guifg=#bb40f5   guibg=NONE      gui=NONE
" hi Keyword                    guifg=#ff0013   guibg=NONE      gui=NONE
" hi Label                      guifg=#7ae902   guibg=NONE      gui=NONE
" hi Globals                    guifg=#7ae902   guibg=NONE      gui=NONE
" hi Function                   guifg=#00d9ef   guibg=NONE      gui=bold
" hi SpecialKey                 guifg=#333333   guibg=NONE      gui=NONE
" hi Delimiter                  guifg=#ff0275   guibg=NONE      gui=NONE
" hi VisualNOS                  guifg=bg
" hi StatusLine                 guifg=bg
" hi PreProc                    guifg=#bb40f5   guibg=NONE      gui=NONE
" hi StorageClass               guifg=#00d9ef   guibg=NONE      gui=italic
" hi Tag                        guifg=#36a6ff   guibg=#002d53   gui=NONE
" hi Todo                       guifg=#75715e   guibg=#000000   gui=inverse,bold,italic
" hi Underlined                 guifg=NONE      guibg=NONE      gui=NONE
" hi SpecialChar                guifg=#ff6600   guibg=#3b1800




" Language Specific Stuff

" HTML Specific
hi htmlTag                      guifg=#ff027f   guibg=NONE      gui=NONE
hi htmlEndTag                   guifg=#ff027f   guibg=NONE      gui=NONE
hi htmlSpecialTagName           guifg=#36a6ff   guibg=#003e65   gui=NONE
hi htmlTagName                  guifg=#36a6ff   guibg=#003e65   gui=NONE
hi htmlArg                      guifg=#00d9ef   guibg=NONE      gui=NONE
hi htmlSpecialChar              guifg=#bb40f5   guibg=NONE      gui=NONE

" Javascript Specific
hi jsFuncCall                   guifg=NONE      guibg=NONE      gui=NONE
hi jsUndefined                  guifg=#c500ff   guibg=NONE      gui=NONE
hi jsNull                       guifg=#c500ff   guibg=NONE      gui=NONE
hi jsFunction                   guifg=#72faff   guibg=NONE      gui=NONE
hi jsFuncName                   guifg=#72faff   guibg=NONE      gui=BOLD
hi jsFuncParens                 guifg=#72faff   guibg=NONE      gui=BOLD
hi jsFuncBraces                 guifg=#72faff   guibg=NONE      gui=BOLD
hi jsFuncArgCommas              guifg=#397d80   guibg=NONE      gui=NONE
hi jsFuncArgs                   guifg=#ff4b00   guibg=NONE      gui=italic
hi jsGlobalObjects              guifg=#72faff   guibg=NONE      gui=NONE
hi jsOpAssign                   guifg=#ff027f   guibg=NONE      gui=NONE
" hi jsFuncDef                  guifg=#aff8ff
" hi jsFuncParenths             guifg=#00d9ef
" hi jsBooleanTrue              guifg=#00d245   guibg=#014216   gui=bold
" hi jsBooleanFalse             guifg=#ff221e   guibg=#761210   gui=bold
" hi jsFuncComma                guifg=#027985
" hi jsSpecial                  guifg=#c600ff   guibg=#2d2e21   gui=NONE

" Already commented out
" hi jsFunctionArgs             guifg=#fb5815
" hi jsParenths                 guifg=#ff027b
" hi jsSeparators               guifg=#b40056
" hi Noise                      guifg=#b40056
" hi jsFunction                 guifg=#00d9ef   guibg=NONE      gui=italic
" hi jsFuncKeyword              guifg=#00d9ef   guibg=NONE      gui=bold
" hi jsFunctionLabel            guifg=#85ff00   guibg=NONE      gui=italic
" hi jsRailsFunction            guifg=#66d9ef   guibg=NONE      gui=NONE
" hi jsThis                     guifg=#fb5815   guibg=NONE      gui=NONE
" hi jsType                     guifg=#fb5815   guibg=NONE      gui=NONE
" hi jsFuncArg                  guifg=#fb5815   guibg=NONE
" hi jsArguments                guifg=#ffffff   guibg=#ff0000   gui=italic
" hi jsStatics                  guifg=#66d9ef
" hi jsGlobalObjects            guifg=#66d9ef
" hi jsNull                     guifg=#b700ff
" hi jsReturn                   guifg=#7ae902
" hi jsIdentifier               guifg=#ffffff

" YAML Specific
" hi yamlKey                    guifg=#36a6ff   guibg=#002d53   gui=NONE
" hi yamlAnchor                 guifg=#ff6701   guibg=NONE      gui=NONE
" hi yamlAlias                  guifg=#ff6701   guibg=NONE      gui=NONE
" hi yamlDocumentHeader         guifg=#fff200   guibg=#2d2e21   gui=NONE

" Python Specifics
hi pythonBooleanTrue          guifg=#00d245   guibg=#014216   gui=bold
hi pythonBooleanFalse         guifg=#ff221e   guibg=#761210   gui=bold

" CSS Specific
" hi cssUnitDecorators          guifg=#ff027b
" hi cssMediaFeature            guifg=#b40056
" hi cssURL                     guifg=#ffb000   guibg=NONE      gui=italic
" hi cssFunctionName            guifg=#00d9ef   guibg=NONE      gui=NONE
" hi cssColor                   guifg=#bb40f5   guibg=NONE      gui=NONE
" hi cssClassName               guifg=#a6e22e   guibg=NONE      gui=NONE
" hi cssValueLength             guifg=#b700ff   guibg=NONE      gui=NONE
" hi cssBraket                  guifg=#ff0f51   guibg=NONE      gui=NONE
" hi cssTagName                 guifg=#36a6ff   guibg=#003e65
" hi cssAtkeyword               guifg=#ff027e
" hi cssAtType                  guifg=#ff027e
" hi cssClass                   guifg=#a6e229
" hi cssProp                    guifg=#66d9ef
" hi cssPropRegion              guifg=#66d9ef
" hi cssFuncRegion              guifg=#66d9ef
" hi cssAtkey                   guifg=#59d9ef
" hi cssAttr                    guifg=#bb40f5
" hi cssAtProps                 guifg=#66d9ef
" hi cssPathFn                  guifg=#f8ab00   guibg=NONE      gui=italic
" hi cssValFn                   guifg=#66d9ef
" hi cssPseudo                  guifg=#a6e229   guibg=#000000
" hi cssPseudoClass             guifg=#a6e229   guibg=#000000
" hi cssPseudoClassId           guifg=#a6e22e   guibg=#000000      gui=NONE
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

" Git Diff Styling
hi DiffAdd                    guifg=NONE      guibg=#1a3e1a   gui=NONE
hi DiffText                   guifg=NONE      guibg=#430077   gui=NONE
hi DiffDelete                 guifg=NONE      guibg=#510202   gui=NONE
hi DiffChange                 guifg=NONE      guibg=#21003a   gui=NONE
hi diffAdded                  guifg=NONE      guibg=#005706   gui=NONE
hi diffRemoved                guifg=NONE      guibg=#7f0000   gui=NONE
hi diffLine                   guifg=NONE      guibg=NONE      gui=NONE







" Styles that I need to figure out still...
" hi cssDefinition              guifg=#ff0000
" hi cssMediaBlock              guifg=#ff0000
" hi cssAttrBlock               guifg=#b80054
"
" hi cssMediaComma              guifg=#ff0000
" hi cssFontDescriptorFunction  guifg=#ff0000
" hi cssUnicodeRange            guifg=#ff0000
" hi cssPseudoClassLang         guifg=#ff0000
" hi cssAtValBlock              guifg=#ff027e
" hi cssAttValFn                guifg=#027985
" hi cssValBlock                guifg=#ff0000







hi IndentGuidesOdd            guibg=#2a2a26
hi IndentGuidesEven           guibg=#2a2a26

" TESTING: Todo Plugins
hi todotxtPriA                guifg=#ff0000
hi todotxtPriB                guifg=#d40000
hi todotxtPriC                guifg=#9d0000
hi todotxtPriD                guifg=#6f0000


" TESTING: Fixing GitGutter and Syntastic colors
hi GitGutterAdd               guifg=#00d245 guibg=#0e0e0a ctermfg=2 ctermbg=NONE
hi GitGutterChange            guifg=#fff200 guibg=#0e0e0a ctermfg=3 ctermbg=NONE
hi GitGutterDelete            guifg=#ff221e guibg=#0e0e0a ctermfg=1 ctermbg=NONE
hi GitGutterChangeDelete      guifg=#ff221e guibg=#0e0e0a ctermfg=1 ctermbg=NONE

hi SyntasticErrorSign         guifg=#ff221e guibg=#000000 gui=bold
hi SyntasticWarningSign       guifg=#fff200 guibg=#000000 gui=bold

" TESTING: VimL specific
hi vimCommand                 guifg=#ff027b   guibg=NONE      gui=NONE

" TESTING: Vim Fugitive stuff
hi gitcommitSummary           guifg=#00d245   guibg=NONE      gui=bold
hi gitcommitOverflow          guifg=#ff221e   guibg=#761210   gui=bold


" TESTING: Fixing CtrlP
hi CtrlPLinePre guifg=#1e1e1a
hi CtrlPMatch   guifg=#00d245 guibg=#000000

" TESTING: Startify
hi StartifyHeader                guifg=#ff6600
