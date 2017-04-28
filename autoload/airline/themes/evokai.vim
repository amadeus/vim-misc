" Theme to mimic the default colorscheme of powerline
" Not 100% the same so it's powerline... ish.
"
" Differences from default powerline:
" * Paste indicator isn't colored different
" * Far right hand section matches the color of the mode indicator
"
" Differences from other airline themes:
" * No color differences when you're in a modified buffer
" * Visual mode only changes the mode section. Otherwise
"   it appears the same as normal mode

" Normal mode                                    " fg             & bg
let s:N1 = [ '#085e0b' , '#49fd2f' , 22  , 148 ] " darkestgreen   & brightgreen
let s:N2 = [ '#9e9e9e' , '#444444' , 247 , 236 ] " gray8          & gray2
let s:N3 = [ '#9e9e9e' , '#303030' , 231 , 233 ] " white          & gray4

" Insert mode                                    " fg             & bg
let s:I1 = [ '#1488ad' , '#ffffff' , 23  , 231 ] " darkestcyan    & white
let s:I2 = [ '#ffffff' , '#1488ad' , 74  , 31  ] " darkcyan       & darkblue
let s:I3 = [ '#87d7ff' , '#005f87' , 117 , 24  ] " mediumcyan     & darkestblue

" Visual mode                                    " fg             & bg
let s:V1 = [ '#ffffff' , '#fc4c1e' , 232 , 214 ] " gray3          & brightestorange

" Replace mode                                   " fg             & bg
let s:RE = [ '#ffffff' , '#fc1780' , 231 , 160 ] " white          & brightred

let g:airline#themes#evokai#palette = {}

let g:airline#themes#evokai#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)

let g:airline#themes#evokai#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#evokai#palette.insert_replace = {'airline_a': [ s:RE[0], s:I1[1], s:RE[1], s:I1[3], '' ]}

let g:airline#themes#evokai#palette.visual = {'airline_a': [ s:V1[0], s:V1[1], s:V1[2], s:V1[3], '' ]}

let g:airline#themes#evokai#palette.replace = copy(airline#themes#evokai#palette.normal)
let g:airline#themes#evokai#palette.replace.airline_a = [ s:RE[0] , s:RE[1] , s:RE[2] , s:RE[3] , '' ]


let s:IA = [s:N2[0], s:N3[1], s:N2[2], s:N3[3], '']
let g:airline#themes#evokai#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)
