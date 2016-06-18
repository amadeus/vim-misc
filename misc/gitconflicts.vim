syntax region  gitMergeConflict matchgroup=gitMergeMarkers start=/\_^\%(<<<<<<<\|>>>>>>>\) \@=/ end=/$/ oneline containedin=ALL contains=jsMergeConflictNoise,gitMergeKeywords,gitMergeCommit
syntax match   gitMergeSeparator /\_^=======$/ containedin=ALL

syntax keyword gitMergeKeywords        contained HEAD
syntax match   gitMergeCommit          contained /[a-zA-Z0-9]*:\@=/ nextgroup=gitMergeCommitSeparator
syntax match   gitMergeCommitSeparator contained /:/ nextgroup=gitMergeCommitFile
syntax match   gitMergeCommitFile      contained /.*/

highlight default link gitMergeConflict             PreProc
highlight default link gitMergeMiddle               PreProc
highlight default link gitMergeSeparator            gitMergeConflict
highlight default link gitMergeKeywords             gitMergeCommit
highlight default link gitMergeCommitSeparator      PreProc
highlight default link gitMergeCommit               PreProc
highlight default link gitMergeCommitFile           PreProc
