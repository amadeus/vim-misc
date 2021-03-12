" Markdown hax to allow lists greater than 2 levels of indentation
syntax clear markdownListMarker
syntax clear markdownOrderedListMarker

syn match markdownListMarker "\%(\t\| \{0,12\}\)[-*+]\%(\s\+\S\)\@=" contained
syn match markdownOrderedListMarker "\%(\t\| \{0,12}\)\<\d\+\.\%(\s\+\S\)\@=" contained
