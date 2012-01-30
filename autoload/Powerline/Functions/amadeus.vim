function! Powerline#Functions#amadeus#GetCurrentFolder() " {{{
	return substitute(getcwd(), '/Users/amadeus/\?', '~/', 'g')
endfunction " }}}
