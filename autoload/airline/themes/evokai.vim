" Custom Evokai Theme

" Normal mode
let s:N1 = ['#085e0b', '#49fd2f', 22,  148, 'bold']
let s:N2 = ['#9e9e9e', '#444444', 247, 236, 'none']
let s:N3 = ['#9e9e9e', '#303030', 231, 233]

" Insert mode
let s:I1 = ['#1488ad', '#ffffff', 23,  231, 'bold']
let s:I2 = ['#ffffff', '#1488ad', 74,  31]
let s:I3 = ['#87d7ff', '#005f87', 117, 24]

" Visual mode
let s:V1 = ['#ffffff', '#fc4c1e', 232, 214, 'bold']

" Replace mode
let s:RE = ['#ffffff', '#fc1780', 231, 160, 'bold']

" Ale Error Colors
let s:EC = ['#e60000', '#6a100c', 231, 160]

" Ale Warning Colors
let s:WC = ['#ff4600', '#66290d', 231, 160]

let g:airline#themes#evokai#palette = {}

let g:airline#themes#evokai#palette.normal = airline#themes#generate_color_map(s:N1, s:N2, s:N3)
let g:airline#themes#evokai#palette.normal.airline_error = s:EC
let g:airline#themes#evokai#palette.normal.airline_warning = s:WC

let g:airline#themes#evokai#palette.insert = airline#themes#generate_color_map(s:I1, s:I2, s:I3)
let g:airline#themes#evokai#palette.insert.airline_error = s:EC
let g:airline#themes#evokai#palette.insert.airline_warning = s:WC

let g:airline#themes#evokai#palette.insert_replace = {'airline_a': [ s:RE[0], s:I1[1], s:RE[1], s:I1[3], '']}
let g:airline#themes#evokai#palette.insert_replace.airline_error = s:EC
let g:airline#themes#evokai#palette.insert_replace.airline_warning = s:WC

let g:airline#themes#evokai#palette.visual = {'airline_a': [ s:V1[0], s:V1[1], s:V1[2], s:V1[3], '']}
let g:airline#themes#evokai#palette.visual.airline_error = s:EC
let g:airline#themes#evokai#palette.visual.airline_warning = s:WC

let g:airline#themes#evokai#palette.replace = copy(airline#themes#evokai#palette.normal)
let g:airline#themes#evokai#palette.replace.airline_a = [ s:RE[0] , s:RE[1] , s:RE[2] , s:RE[3] , '']
let g:airline#themes#evokai#palette.replace.airline_error = s:EC
let g:airline#themes#evokai#palette.replace.airline_warning = s:WC

" Tabline Theme colors
let s:TLDefault = ['#444444', '#121212', 231, 160, 'bold']
let s:TLSelected = ['#fc1780', '#121212', 231, 160, 'bold']
let s:TLModified = ['#121212', '#fc1780', 231, 160, 'bold']
let g:airline#themes#evokai#palette.tabline = {}
let g:airline#themes#evokai#palette.tabline.airline_tab = s:TLDefault
let g:airline#themes#evokai#palette.tabline.airline_tabsel = s:TLSelected
let g:airline#themes#evokai#palette.tabline.airline_tabmod = s:TLModified
let g:airline#themes#evokai#palette.tabline.airline_tablabel = s:TLDefault
let g:airline#themes#evokai#palette.tabline.airline_tabtype = s:TLDefault
let g:airline#themes#evokai#palette.tabline.airline_tabfill = s:TLDefault
let g:airline#themes#evokai#palette.tabline.airline_tabmod_unsel = s:TLDefault
let g:airline#themes#evokai#palette.tabline.airline_tabhid = s:TLDefault

let s:IA = ['#555555', '#222222', s:N2[2], s:N3[3], '']
let g:airline#themes#evokai#palette.inactive = airline#themes#generate_color_map(s:IA, s:IA, s:IA)

" Remove bold text from line numbers
call airline#parts#define_accent('linenr', 'none')
call airline#parts#define_accent('maxlinenr', 'none')

" Remove the hideous red color on the readonly indicator
call airline#parts#define_accent('readonly', 'none')

" Prevent filetype from ever truncating
let g:airline_section_x = ''

" Remove file format
let g:airline_section_y = '%{&filetype}'

" Remove cursor percentage position
" let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr', g:airline_symbols.space.':%3v'])
let g:airline_section_z = airline#section#create(['linenr', 'maxlinenr'])

" Using Ale for warnings and errors
" TESTING: I don't think I need this anymore
" let g:airline_section_warning = ''
" let g:airline_section_error = ''
let g:airline_section_warning = airline#section#create(['ale_warning_count'])
let g:airline_section_error = airline#section#create(['ale_error_count'])
