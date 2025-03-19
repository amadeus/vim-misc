" I probably need to figure out a way to silently fail if this doesn't
" exist...
if has('nvim') == 0
  let b:match_words = matchup#util#standard_html()
endif
