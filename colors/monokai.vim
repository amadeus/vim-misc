" Monokai from Textmate
" Converted from TextMate Monokai Extreme theme, then modified to suit my needs

set background=dark
highlight clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "monokai"

hi Cursor                     guifg=#000000   guibg=#04a0f7   gui=NONE
hi Error                      guifg=#ffffff   guibg=#a00000   gui=NONE
hi Visual                                     guibg=#114483   gui=NONE
hi CursorLine                                 guibg=#000000   gui=NONE
hi CursorColumn               guifg=NONE      guibg=#2d2d27   gui=NONE
hi LineNr                     guifg=#666666   guibg=#000000   gui=NONE
hi SignColumn                 guifg=#666666   guibg=#000000   gui=NONE
hi VertSplit                  guifg=#808080   guibg=#000000   gui=bold
hi MatchParen                 guifg=#04a0f7   guibg=#000000   gui=NONE
hi StatusLine                 guifg=#ffffff   guibg=#222222   gui=bold
hi StatusLineNC               guifg=#444444   guibg=#222222   gui=NONE
hi Pmenu                      guifg=NONE      guibg=#373730   gui=NONE
hi PmenuSel                   guifg=NONE      guibg=#00badc   gui=NONE
hi IncSearch                  guifg=#000000   guibg=#ffe402   gui=NONE
hi Search                     guifg=#ffffff   guibg=#f92672   gui=NONE
hi Directory                  guifg=#bb40f5   guibg=NONE      gui=NONE
hi Folded                     guifg=#75715e   guibg=#000000   gui=NONE
hi FoldColumn                 guifg=#75715e   guibg=#000000   gui=NONE
hi Ignore                     guifg=#000000

hi Normal                     guifg=#ffffff   guibg=#1e1e1a   gui=NONE
hi Boolean                    guifg=#bb40f5   guibg=NONE      gui=NONE
hi Character                  guifg=#bb40f5   guibg=NONE      gui=NONE
hi Comment                    guifg=#75715e   guibg=#000000   gui=italic
hi Conditional                guifg=#ff0013   guibg=NONE      gui=NONE
hi Constant                   guifg=NONE      guibg=NONE      gui=NONE
hi Define                     guifg=#ff0013   guibg=NONE      gui=NONE
hi ErrorMsg                   guifg=#f8f8f0   guibg=#f92672   gui=inverse
hi WarningMsg                 guifg=#f8f8f0   guibg=#f92672   gui=NONE
hi Float                      guifg=#bb40f5   guibg=NONE      gui=NONE
hi Identifier                 guifg=#00d9ef   guibg=NONE      gui=italic
hi Keyword                    guifg=#ff0013   guibg=NONE      gui=NONE
hi Label                      guifg=#7ae902   guibg=NONE      gui=NONE
hi Globals                    guifg=#7ae902   guibg=NONE      gui=NONE
hi Function                   guifg=#85ff00   guibg=NONE      gui=NONE
hi NonText                    guifg=#333333   guibg=NONE      gui=NONE
hi SpecialKey                 guifg=#333333   guibg=NONE      gui=NONE
hi Delimiter                  guifg=#ff0275   guibg=NONE      gui=NONE
hi VisualNOS                  guifg=bg
hi StatusLine                 guifg=bg

hi Number                     guifg=#bb40f5   guibg=NONE      gui=NONE
hi Operator                   guifg=#ff0013   guibg=NONE      gui=NONE
hi PreProc                    guifg=#bb40f5   guibg=NONE      gui=NONE
hi Special                    guifg=#ff0275   guibg=NONE      gui=NONE
hi Statement                  guifg=#ff0013   guibg=NONE      gui=NONE
hi StorageClass               guifg=#00d9ef   guibg=NONE      gui=italic
hi String                     guifg=#fff200   guibg=#2d2e21   gui=NONE
hi Tag                        guifg=#36a6ff   guibg=#002d53   gui=NONE
hi Title                      guifg=#ffffff   guibg=NONE      gui=NONE
hi Todo                       guifg=#75715e   guibg=#000000   gui=inverse,bold,italic
hi Type                       guifg=NONE      guibg=NONE      gui=NONE
hi Underlined                 guifg=NONE      guibg=NONE      gui=NONE
hi Type                       guifg=#66d9ef

hi DiffAdd                    guifg=NONE      guibg=#1a3e1a   gui=NONE
hi DiffText                   guifg=NONE      guibg=#430077   gui=NONE
hi DiffDelete                 guifg=NONE      guibg=#510202   gui=NONE
hi DiffChange                 guifg=NONE      guibg=#21003a   gui=NONE
hi diffAdded                  guifg=NONE      guibg=#005706   gui=NONE
hi diffRemoved                guifg=NONE      guibg=#7f0000   gui=NONE
hi diffLine                   guifg=NONE      guibg=NONE      gui=NONE

" Language Specific Stuff
hi yamlKey                    guifg=#36a6ff   guibg=#002d53   gui=NONE
hi yamlAnchor                 guifg=#ff6701   guibg=NONE      gui=NONE
hi yamlAlias                  guifg=#ff6701   guibg=NONE      gui=NONE
hi yamlDocumentHeader         guifg=#fff200   guibg=#2d2e21   gui=NONE

hi htmlTag                    guifg=#ff027e   guibg=NONE      gui=NONE
hi htmlEndTag                 guifg=#ff027e   guibg=NONE      gui=NONE
hi htmlTagName                guifg=#36a6ff   guibg=#003e65   gui=NONE
hi htmlArg                    guifg=#00d9ef   guibg=NONE      gui=NONE
hi htmlSpecialChar            guifg=#bb40f5   guibg=NONE      gui=NONE

hi jsBooleanTrue              guifg=#00d245   guibg=#014216   gui=bold
hi jsBooleanFalse             guifg=#ff221e   guibg=#761210   gui=bold
hi jsFunctionArgs             guifg=#fb5815
hi jsParenths                 guifg=#ff027b
hi jsFunction                 guifg=#00d9ef   guibg=NONE      gui=italic
hi jsFunctionLabel            guifg=#85ff00   guibg=NONE      gui=italic
hi jsRailsFunction            guifg=#66d9ef   guibg=NONE      gui=NONE
hi jsThis                     guifg=#fb5815   guibg=NONE      gui=NONE
hi jsFuncArgs                 guifg=#ffffff   guibg=#ff0000   gui=italic
hi jsArguments                guifg=#ffffff   guibg=#ff0000   gui=italic
hi jsParenths                 guifg=#ff027b
hi jsStatics                  guifg=#66d9ef
hi jsNull                     guifg=#b700ff

hi cssURL                     guifg=#ffb000   guibg=NONE      gui=italic
hi cssFunctionName            guifg=#66d9ef   guibg=NONE      gui=NONE
hi cssColor                   guifg=#bb40f5   guibg=NONE      gui=NONE
hi cssPseudoClassId           guifg=#a6e22e   guibg=NONE      gui=NONE
hi cssClassName               guifg=#a6e22e   guibg=NONE      gui=NONE
hi cssValueLength             guifg=#b700ff   guibg=NONE      gui=NONE
hi cssBraket                  guifg=#ff0f51   guibg=NONE      gui=NONE
hi cssTagName                 guifg=#36a6ff   guibg=#003e65
hi cssAtkeyword               guifg=#ff027e
hi cssAtType                  guifg=#f70f18
hi cssClass                   guifg=#a6e229
hi cssProp                    guifg=#66d9ef
hi cssAtkey                   guifg=#59d9ef
hi cssUnits                   guifg=#ff0013
hi cssAttr                    guifg=#66d9ef
hi cssAttributeSelector       guifg=#66d9ef
hi cssAtProps                 guifg=#ff027e
hi cssPathFn                  guifg=#f8ab00   guibg=NONE      gui=italic
hi cssValFn                   guifg=#66d9ef
hi cssPseudo                  guifg=#a6e229   guibg=#000000
hi cssPseudoClass             guifg=#a6e229   guibg=#000000
hi cssPrefix                  guifg=#66d9ef   guibg=#10282c
hi cssFuncBracket             guifg=#ff027e
hi cssPunctuation             guifg=#ff027e
hi cssFontDescriptorBlock     guifg=#ff027e
hi cssFunction                guifg=#66d9ef
hi cssBraces                  guifg=#ff0275

hi IndentGuidesOdd            guibg=#2a2a26
hi IndentGuidesEven           guibg=#2a2a26

" Styles that I need to figure out still...
hi cssDefinition              guifg=#ff0000
hi cssMediaBlock              guifg=#ff0000
hi cssAttrBlock               guifg=#00d9ef

hi cssPropRegion              guifg=#ff0000
hi cssFuncRegion              guifg=#ff0000
hi cssAttrBlock               guifg=#ff0000
hi cssMediaComma              guifg=#ff0000
hi cssFontDescriptorFunction  guifg=#ff0000
hi cssUnicodeRange            guifg=#ff0000
hi cssPseudoClassLang         guifg=#ff0000
hi cssValBlock                guifg=#ff0000
hi cssAtValBlock              guifg=#ff0000
hi cssAttValFn                guifg=#ff0000

hi todotxtPriA                guifg=#ff0000
hi todotxtPriB                guifg=#d40000
hi todotxtPriC                guifg=#9d0000
hi todotxtPriD                guifg=#6f0000

" TESTING: Fixing GitGutter and Syntastic colors
hi GitGutterAdd               guifg=#00d245 guibg=#000000 ctermfg=2 ctermbg=NONE
hi GitGutterChange            guifg=#fff200 guibg=#000000 ctermfg=3 ctermbg=NONE
hi GitGutterDelete            guifg=#ff221e guibg=#000000 ctermfg=1 ctermbg=NONE
hi GitGutterChangeDelete      guifg=#ff221e guibg=#000000 ctermfg=1 ctermbg=NONE

hi SyntasticErrorSign         guifg=#ff221e guibg=#000000 gui=bold
hi SyntasticWarningSign       guifg=#fff200 guibg=#000000 gui=bold
