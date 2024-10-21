vim9script

var options = {
	completer: {shuffleEqualPriority: true, postfixClobber: true},
	buffer: {enable: true, priority: 10, urlcomplete: true, envComplete: true},
	lsp: {enable: true, priority: 11},
	vimscript: {enable: true, priority: 10}
}

var lspServers = [
	{
		name: 'tsserver',
		filetype: ['javascript', 'typescript', 'typescript.tsx'],
		path: exepath('typescript-language-server'),
		args: ['--stdio']
	}
]

autocmd VimEnter * g:VimCompleteOptionsSet(options)
autocmd User LspSetup call LspAddServer(lspServers)
