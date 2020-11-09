let g:lsc_server_commands = {
 \  'javascript': {
 \    'command': 'typescript-language-server --stdio',
 \    'log_level': -1,
 \    'suppress_stderr': v:true,
 \  },
 \  'typescript': {
 \    'command': 'typescript-language-server --stdio',
 \    'log_level': -1,
 \    'suppress_stderr': v:true,
 \  },
 \  'typescript.tsx': {
 \    'command': 'typescript-language-server --stdio',
 \    'log_level': -1,
 \    'suppress_stderr': v:true,
 \  }
 \}
" let g:lsc_auto_map = {
"  \  'GoToDefinition': 'gd',
"  \  'FindReferences': 'gr',
"  \  'Rename': 'gR',
"  \  'ShowHover': 'K',
"  \  'FindCodeActions': 'ga',
"  \  'Completion': 'omnifunc',
"  \}
let g:lsc_enable_autocomplete  = v:true
let g:lsc_enable_diagnostics   = v:false
let g:lsc_reference_highlights = v:false
let g:lsc_trace_level          = 'off'
