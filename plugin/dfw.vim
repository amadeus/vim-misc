" Distraction Free Writing
function! DistractionFreeWriting()
  " Size of the editable area
  set lines=40 columns=80
  " Hide line numbers
  set nonumber
  " MacVim specific setting for editor's background color
  " set fuoptions=background:#001b1b13
  set fuoptions=background:#001b1b13
  " Remove right scrollbar
  set guioptions-=r
  " Don't show status line
  set laststatus=0
  " Fuck with status messages
  set shm=at
  " Wrap text
  set wrap
  " Don't show ruler
  set noruler
  " Go to fullscreen editing mode
  set fullscreen
  " Hide the linebreak character - if it exists
  set showbreak=
  " Hide various other types of whitespace characters
  " hi NonText    guifg=#1b1b13
  hi SpecialKey guifg=#1b1b13
  " Disable NeoComplCache
  let g:neocomplete#enable_at_startup = 0
  silent exec 'NeoCompleteDisable'
  " Disable Signify
  " silent exec 'SignifyToggle'
  silent exec 'GitGutterToggle'
endfunction
