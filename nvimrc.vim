lua <<EOF

require('nvim-web-devicons').setup {
  color_icons = true;
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true;
}

require("mason").setup()

local lspconfig = require("mason-lspconfig")
lspconfig.setup({capabilities})
lspconfig.setup_handlers {
  function (server_name) -- default handler (optional)
    require("lspconfig")[server_name].setup({capabilities = capabilities})
  end,
}

-- lspconfig.lua_ls.setup({
--   settings = {
--     Lua = {
--       runtime = {
--         -- Set Lua runtime version
--         version = "LuaJIT",
--       },
--       diagnostics = {
--         -- Recognize 'vim' as a global
--         globals = { "vim" },
--       },
--       workspace = {
--         -- Include Neovim runtime files
--         library = vim.api.nvim_get_runtime_file("", true),
--       },
--       telemetry = {
--         -- Disable telemetry
--         enable = false,
--       },
--     },
--   },
-- })

local blink_cmp = require('blink.cmp')
-- Configure blink.cmp
blink_cmp.setup({
  keymap = {
    preset = 'default',
    ['<C-n>'] = { 'show', 'select_next', 'fallback' },
    ['<C-k>'] = { 'fallback' },
  },
  appearance = {
    use_nvim_cmp_as_default = true,
    -- Set to 'mono' for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
    -- Adjusts spacing to ensure icons are aligned
    nerd_font_variant = 'mono'
  },

  -- Default list of enabled providers
  completion = {
    list = {
      selection = {
        preselect = false,
      }
    },
    trigger = {
      show_on_blocked_trigger_characters = {},
      -- show_on_blocked_trigger_characters = { ' ', '\n', '\t' },
    },
    accept = {
      -- A way to fix neovide cursor animations
      dot_repeat = false,
    },
    documentation = {
      auto_show = true,
    },

  },

  cmdline = {
    completion = {
      list = {
        selection = {
          preselect = false,
        },
      },
      menu = {
        auto_show = true,
      },
    },
  },

  sources = {
    default = { 'lsp', 'path', 'buffer' },
    providers = {
      lsp = {
        override = {
          -- Appears to be broken at the moment, see: https://github.com/Saghen/blink.cmp/issues/836
          get_trigger_characters = function(self)
            local trigger_characters = self:get_trigger_characters()
            vim.list_extend(trigger_characters, { '\n', '\t', ' ' })
            return trigger_characters
          end
        },
      },
    },
  },

  -- Experimental signature help support
  signature = {
    enabled = true,
    window = {
      border = 'none',
    },
  },

  fuzzy = { implementation = "prefer_rust_with_warning" }
})



require('nvim-treesitter.configs').setup {
  ensure_installed = {"typescript", "javascript", "vimdoc", "vim", "lua", "json", "css", "html", "yaml", "css", "vimdoc"},
  -- ignore_install = { "javascript", "tsx" }, -- List of parsers to ignore installing
  highlight = {
    enable = true
    -- disable = { "c", "rust" },  -- list of language that will be disabled
    -- custom_captures = {
    --   ["function_declaration.identifier"] = "TSCFuncName"
    -- },
  },
  indent = {
    enable = true,
    disable = {}
  },
  -- incremental_selection = {enable = true},
  textobjects = {enable = true},
  -- autotag = {
  --   enable = true
  -- }
}

require('ayu').setup({
  mirage = true,
  overrides = {
    Normal = { bg = "None" },
    -- CursorColumn = { bg = "None" },
    -- CursorLine = { style = '' },
    SignColumn = { bg = "None" },
    EndOfBuffer = { fg = "#0f1419" },
  }
})

-- local function remove_underline()
--   local groups_to_update = {
--     'DiffAdd',
--     'DiffChange',
--     'DiffDelete',
--     'DiffText',
--   }
--   for _, group in ipairs(groups_to_update) do
--     vim.api.nvim_set_hl(0, group, { underline = false })
--   end
-- end
-- remove_underline();

require('lualine').setup({
  options = {
    theme = 'ayu_mirage',
    icons_enabled = false,
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = {
      {
        'mode',
        padding = 0,
        -- Print 3 letter shorthands for all modes
        fmt = function(name)
          local firstChar = string.sub(name, 1, 1)
          local secondChar = string.sub(name, 2, 2)
          -- If the first character is not "V", return it with spaces around
          if firstChar ~= "V" or secondChar ~= '-' then
            return " " .. string.sub(name, 1, 3) .. " "
          end

          local afterDash = string.sub(name, 3, 3)
          return " V:" .. afterDash .. " "
        end
      }
    },
    lualine_b = {
      { 'branch', separator = '', padding = {left = 1, right = 0} },
      { 'diff' },
    },
    lualine_c = {
      {
        'filename',
        path = 1,
        symbols = {
          modified = '+',
          readonly = '-',
          unnamed = '----',
          newfile = 'New'
        }
      }
    },
    lualine_x = { 'filetype' },
    lualine_y = {
    },
    lualine_z = {
      {
        'diagnostics',
        color = { fg = '#bfbdb6', bg = '#d85757' }
      }
    }
  }
})

if vim.g.neovide then
  vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
  vim.keymap.set('v', '<D-c>', '"+y') -- Copy
  vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
  vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
  vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
  vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode

  vim.g.neovide_hide_mouse_when_typing = true
  vim.g.neovide_cursor_animation_length = 0.1
  vim.g.neovide_scroll_animation_length = 0.1
  vim.g.neovide_cursor_trail_size = 0.1
  vim.g.neovide_cursor_animate_command_line = false
  vim.opt.linespace = 3
  -- vim.o.guifont="Berkeley Mono:h16"
  local default_path = vim.fn.expand("~")
  vim.api.nvim_set_current_dir(default_path)
  -- Doesn't seem to work...
  -- local alpha = function()
  --   return string.format("%x", 255)
  -- end
  -- vim.g.neovide_background_color = '#1b1b13' .. alpha()
end

-- Allow clipboard copy paste in neovim
vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})

-- Fix various help files being detected properly
vim.cmd([[ autocmd BufRead,BufNewFile */doc/* set filetype=help ]])
EOF

" Misc app settings
set encoding=utf-8
scriptencoding utf-8
set linebreak
set ttyfast
set confirm
set hidden
set autoread
set nomodeline

" Indent settings
set tabstop=2
set shiftwidth=2
set shiftround
set noexpandtab
set smartindent
set autoindent
set smarttab
set nowrap
set display=lastline
set lazyredraw
set updatetime=100
set ttimeoutlen=0
set belloff=esc
set clipboard=unnamed
set backupcopy=yes

" Show invisibles
set list
set listchars=tab:›\ ,trail:⋅,nbsp:␣
set showbreak=…
set noshowmode
set isfname+=[,],40,41
" Have the showbreak appear in the number column
set cpoptions+=n
if has('nvim') == 0
  augroup terminal_list_tweaks
    autocmd!
    autocmd TerminalOpen * setlocal nolist
  augroup END
endif

" Allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Lots of history
set history=1000

" Search settings
set hlsearch
set incsearch
set ignorecase
set smartcase

" Tab completion when entering filenames
set wildmenu
set wildoptions=pum
set wildmode=longest:full
set wildignore+=*.o,*.obj,.git,*.rbc,.hg,.svn,*.pyc,.vagrant,.DS_Store,*.jpg,
  \*.eps,*.jpeg,*.png,*.gif,*.bmp,*.psd,*.sublime-project

" Syntax, Colorscheme and Gui Options
" This should be before syntax on
set background=dark
syntax on
syntax sync fromstart
set cursorline

" Fold Settings
set foldlevel=99
" foldmethod=syntax is REALLY slow, so is FastFold, indent is
" close enough and is very performant
set foldmethod=indent
set sessionoptions=buffers,tabpages,curdir,slash
set viewoptions=slash,cursor
" set viewoptions=slash,curdir

" Format Options
set formatoptions+=njt
set formatoptions-=o
set formatoptions-=r
if exists('&breakindent')
  set breakindent
  set breakindentopt=sbr
endif

" Basically use a fancier colortheme in MacVim
if has('termguicolors')
  set termguicolors
  if has('nvim') == 1
    colorscheme evokai
    "colorscheme ayu
  else
    colorscheme evokai
  endif
else
  colorscheme molokai
endif

set guioptions=c
set guicursor=n-v-c:block-Cursor/lCursor-blinkwait300-blinkoff150-blinkon150,ve:ver35-Cursor,o:hor15-Cursor,i-ci-c:ver25-Cursor/lCursor-blinkwait300-blinkoff150-blinkon150,r-cr:hor20-Cursor/lCursor,sm:block-Cursor-blinkwait300-blinkoff150-blinkon150
set shortmess=ITFaocC
" Set title string to current working directory!
set titlestring=%{substitute(getcwd(),\ $HOME,\ '~',\ '')}
set noruler
set fillchars=vert:⋅,fold:-

" Don't clobber the unnamed register when pasting over text in visual mode
vnoremap p pgvy

set number
set numberwidth=3
augroup hidenumber
  autocmd!
  autocmd FileType vaffle setlocal nonumber
augroup END

set signcolumn=yes
augroup hidesigns
  autocmd!
  autocmd BufNew * setlocal signcolumn=yes
  autocmd BufNew __Scratch__ setlocal signcolumn=no
  autocmd BufNew .scratch.md setlocal signcolumn=no
  autocmd FileType vim-plug,vaffle,qf,help,startify,nerdtree,git,gitcommit setlocal signcolumn=no
augroup END

set laststatus=2
augroup laststatus
  autocmd!
  autocmd BufNew * setlocal laststatus=2
  autocmd FileType startify setlocal laststatus=0
augroup END

" Force vim to think of 2 spaces as a sentence
set cpoptions+=J

" For some reason, it seems that Mac has a different
" font API for declaring the font
if has('nvim') == 1
  set guifont=Berkeley\ Mono:h16
elseif has('gui_running')
  " InputMono Settings
  set guifont=BerkeleyMono-Regular:h16
  set macligatures
  " Make sure preserve font line spacing is checked
  " set linespace=4
  " set columnspace=-1
endif

" Improve splitting logic
set splitright
set splitbelow

" Add buffer to cursor while scrolling
set scrolloff=3
" Trying the default value here... might be fun... might be annoying
set sidescroll=0
set sidescrolloff=5

" Better completion
set complete=.,w,b,u,t

" Used to have preview on this puppy - caused all sorts of probs
set completeopt=menuone,menu,noselect

" Diff settings
set diffopt+=algorithm:patience,vertical,indent-heuristic

" Key Mappings
noremap     <F1> <Esc>
inoremap    <F1> <Esc>
inoremap    <c-x><c-x> <c-x><c-o>
nnoremap    K    <Nop>
nnoremap    Y    yy
cnoreabbrev W    w
cnoreabbrev Wq   wq
cnoreabbrev WQ   wq
cnoreabbrev Q    q
cnoreabbrev Qa   qa
cnoreabbrev QA   qa
cnoreabbrev db   bd
cnoreabbrev Tabe tabe
cnoreabbrev Edit edit
cnoreabbrev Vsplit vsplit
cnoreabbrev Set  set
cnoreabbrev Cd   cd
cnoreabbrev CD   cd
cnoreabbrev Src source $MYVIMRC
command! Fu :set fu!|redraw!
" Make closing buffers easier
nnoremap    <c-w>q :bd<cr>

" Improved line wrap movement
vnoremap j gj
nnoremap j gj
vnoremap k gk
nnoremap k gk

" Various leader shortcuts
nnoremap q <nop>
vnoremap q <nop>
let g:mapleader='q'
let g:maplocalleader='q'
nnoremap Q q
vnoremap Q q
nnoremap <F5> :syntax sync fromstart<cr>
nnoremap <leader>nn  :set hls!<cr>
nnoremap <leader>e   :e ~/.vim/bundle/vim-misc/nvimrc.vim<cr>
nnoremap <leader>mc  :e ~/.vim/bundle/vim-evokai/colors/evokai.vim<cr>
nnoremap <leader>hh  :runtime! /syntax/hitest.vim<cr>
nnoremap <leader>u   :MundoToggle<cr>
nnoremap <leader>dd  <c-w>h:bd<cr>
nnoremap <leader>ss  :setlocal spell!<cr>
nnoremap <leader>gg  :Gvdiff<cr>
nnoremap <leader>pp  :pwd<cr>
nnoremap <leader>gs  :Gstatus<cr>
nnoremap <leader>gc  :Gcommit -v<cr>
nnoremap <leader>gd  :silent Git difftool --staged<cr>
nnoremap <leader>sr  :syntax sync fromstart<cr>
nnoremap <leader>sf  :set filetype=javascript.jsx<cr>
nnoremap <leader>rd  :redraw!<cr>
nnoremap <leader>ww  :w<cr>
nnoremap <leader>wf  :Fu<cr>
nmap <d-cr> :set fu!<cr>

" Slicker way to move around splits
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l
nnoremap gF <c-w>vg_hhgf

" Improved way of Escaping out of insert mode
inoremap jk <Esc>
inoremap JK <Esc>

" General cursor moves in insert mode
inoremap <c-k> <esc>O
inoremap <c-l> <esc>A
inoremap <c-h> <esc>I
inoremap <c-j> <esc>o
inoremap <c-d> <esc>v^c
inoremap <c-e> <c-x><c-e>
inoremap <c-y> <c-x><c-y>

" Fix accidental insert mode memes
inoremap <c-u> <c-g>u<c-u>
inoremap <c-w> <c-g>u<c-w>

" Command Mode Improvements
if has('gui_running')
  cnoremap <c-k> <up>
  cnoremap <c-j> <down>
endif

" Expand folder of current file in command mode
cnoremap %% <c-r>=expand('%:h').'/'<cr>

" Disable weird middle mouse behavior
nnoremap <MiddleMouse> <Nop>
nnoremap <2-MiddleMouse> <Nop>
nnoremap <3-MiddleMouse> <Nop>
nnoremap <4-MiddleMouse> <Nop>
inoremap <MiddleMouse> <Nop>
inoremap <2-MiddleMouse> <Nop>
inoremap <3-MiddleMouse> <Nop>
inoremap <4-MiddleMouse> <Nop>
vnoremap <MiddleMouse> <Nop>
vnoremap <2-MiddleMouse> <Nop>
vnoremap <3-MiddleMouse> <Nop>
vnoremap <4-MiddleMouse> <Nop>

" Sidescrolling shortcuts
if has('mac')
  " <opt-h>
  nmap <silent> ˙ zh
  " <opt-l>
  nmap <silent> ¬ zl
else
  " <alt-h>
  nmap <silent> <a-h> zh
  " <alt-l>
  nmap <silent> <a-l> zl
endif

" Vaffle configs
nnoremap <leader>vv  :Vaffle<cr>
nnoremap <leader>vf  :Vaffle %<cr>
augroup vaffletab
  autocmd!
  autocmd FileType vaffle nmap <buffer> <Tab> <Plug>(vaffle-toggle-current)
  autocmd FileType vaffle nmap <buffer> s <Plug>(vaffle-open-selected-vsplit)
augroup END

" Swap, Undo and Backup Folder Configuration
set directory=~/.vim/swap
set backupdir=~/.vim/backup
if has('nvim')
  set undodir=~/.config/nvim/undo
else
  set undodir=~/.vim/undo
endif
set nobackup
set noswapfile
set undofile

" Search for selected text
function! GetSelection()
    let old_reg = getreg('v')
    normal! gv"vy
    let raw_search = getreg('v')
    call setreg('v', old_reg)
    return substitute(escape(raw_search, '\/.*$^~[]'), "\n", '\\n', 'g')
endfunction

vnoremap <c-s> <C-c>/<C-r>=GetSelection()<CR><CR>
vnoremap # <C-c>?<C-r>=GetSelection()<CR><CR>

" .conf to yaml
augroup yaml
  autocmd!
  autocmd BufNewFile,BufRead *.conf setl filetype=yaml
augroup END

" CSS Specific Motions
" Change inner/around CSS Key
onoremap ik :<c-u>execute "normal! ^vt:"<cr>
onoremap ak :<c-u>execute "normal! 0vf:"<cr>

" Fun tiems
iabbrev ldis ಠ_ಠ
iabbrev lsad ಥ_ಥ
iabbrev lhap ಥ‿ಥ
iabbrev lmis ಠ‿ಠ
iabbrev ldiz ( ͠° ͟ʖ ͡°)
vnoremap u <nop>
vnoremap gu u
nnoremap <leader>se :source Session.vim<cr>

" Easy profiling
function! s:ProfileStart()
  profile start profile.log
  profile func *
  profile file *
endfunction

function! s:ProfileEnd()
  profile pause
  noautocmd qall!
endfunction

command! ProfileStart call s:ProfileStart()
command! ProfileEnd call s:ProfileEnd()
command! MiniTerm term ++rows=10

function! WipeoutBuffers()
  exec '%bwipeout'
endfunction
command! -nargs=0 Wipeout call WipeoutBuffers()


" ==== PLUGIN SETTINGS ===
" Gist settings
let g:gist_clip_command = 'pbcopy'
let g:gist_open_browser_after_post = 1


" DetectIndent Settings
let g:detectindent_max_lines_to_analyse = 1024
augroup detectindent
  autocmd!
  autocmd BufReadPost * DetectIndent
augroup END

" Fugitive Settings
" delete fugitive buffers on hide
augroup fugitivefix
  autocmd!
  autocmd BufReadPost fugitive:// setlocal bufhidden=delete
augroup END

augroup gitcommit
  autocmd!
  autocmd FileType gitcommit setlocal nolist
augroup END

" vim-escaper Custom Entity Replacements
let g:CustomEntities = [['(c)',  '\&copy;']]

" Grepper
let g:grepper = {}
let g:grepper.highlight = 1
let g:grepper.searchreg = 1
let g:grepper.tools = ['rg', 'ag', 'ack', 'ack-grep', 'grep', 'findstr', 'pt', 'sift', 'git']
nmap gs  <plug>(GrepperOperator)
xmap gs  <plug>(GrepperOperator)

" Goyo settings
let g:goyo_margin_top=5
let g:goyo_margin_bottom=5
let g:goyo_width = 90

" Easymotion mappings
map  <leader>/ <Plug>(easymotion-sn)
omap <leader>/ <Plug>(easymotion-tn)
map  <leader>n <Plug>(easymotion-next)
map  <leader>N <Plug>(easymotion-prev)
map  <leader>kk <Plug>(easymotion-bd-jk)
map  <leader>jj <Plug>(easymotion-bd-jk)
map  <leader><leader><leader> <Plug>(easymotion-repeat)
map  <space> <Plug>(easymotion-s)
let g:EasyMotion_smartcase = 1

" LocalVimRC Settings
let g:localvimrc_sandbox = 0
let g:localvimrc_persistent = 1

" targets.vim
augroup targets_tweaks
  autocmd!
  autocmd User targets#mappings#user call targets#mappings#extend({
    \ 'a': {'argument': [{'o': '[{([]', 'c': '[])}]', 's': ','}]},
    \ })
augroup END


" Scratch settings
let g:scratch_autohide = 0
let g:scratch_insert_autohide = 0
let g:scratch_filetype = 'markdown'
let g:scratch_top = 0


" vim-hexokinase
let g:Hexokinase_highlighters = ['virtual']
let g:Hexokinase_ftEnabled = ['css', 'html', 'javascript', 'typescript', 'typescriptreact', 'typescript.tsx', 'javascript.jsx']

" EditorConfig
let g:EditorConfig_exclude_patterns = ['fugitive://.\*']
let g:EditorConfig_disable_rules = ['trim_trailing_whitespace']

" VIM Open Url
let g:open_url_default_mappings = 0
nmap gx <Plug>(open-url-browser)
xmap gx <Plug>(open-url-browser)

" Vim Matchup Settings
" Auto changes closing tag when editing opening tag
let g:loaded_matchit = 1 " Disable matchit because we are using matchup
let g:matchup_transmute_enabled = 1
let g:matchup_matchparen_offscreen = {'method': 'popup'}
let g:matchup_surround_enabled = 1
let g:matchup_matchparen_deferred = 1

" Vim Plug Settings
let g:plug_threads = 200

" Zig Settings
let g:zig_fmt_autosave = 0

" Terminal Vim Cursor Settings
" let &t_SH = "\e[1 q"
let &t_SI = "\e[5 q"
let &t_EI = "\e[0 q"

" direnv config
let g:direnv_silent_load = 1


""" Major Plugin settings

" Claude Chat
if 1
  runtime! /misc/claude_chat.vim
endif

" Startify
if 1
  runtime! /misc/startify.vim
endif

" ALE settings
if 1
  runtime! /misc/ale-nvim.vim
endif

" none-ls settings - prefer ale at the moment
if 0
  runtime! /misc/none_ls.vim
endif

" GitGutter settings
if 1
  runtime! /misc/gitgutter.vim
endif

" FZF settings
if 1
  runtime! /misc/fzf.vim
endif

" Neural.vim settings
if 0
  runtime! /misc/neural.vim
endif

