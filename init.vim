" Nate's vim config
" Install me first: https://github.com/junegunn/vim-plug

" For some reason this only works if I put it up here
let mapleader = ";"

"Helper function to check conditions; for VSCode
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin('~/AppData/Local/nvim/plugged') 

if !exists('g:vscode')

	" Speed up loading Lua files
  Plug 'lewis6991/impatient.nvim'
    "Plug 'nathom/filetype.nvim'
    
    "Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'kyazdani42/nvim-web-devicons'
    "Plug 'ryanoasis/vim-devicons'
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'neoclide/coc.nvim', {'branch': 'feat/use-ts-hi-group', 'do': 'yarn install --frozen-lockfile'}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    "Plug 'goolord/alpha-nvim'

    "Preferred color scheme; should be customized
    Plug 'mangeshrex/uwu.vim'
    "Plug 'ldelossa/vimdark'
    "Plug 'rktjmp/lush.nvim'
    "Plug 'ellisonleao/gruvbox.nvim'
	"Plug 'tjdevries/colorbuddy.vim'
	"Plug 'RishabhRD/nvim-rdark'
	"Plug 'blackbirdtheme/vim'
	"Plug 'rose-pine/neovim'
	"Plug 'elvessousa/sobrio'
	
    "Plug 'mhinz/vim-startify'
	
    "Dashboard plugin config
    "Plug 'glepnir/dashboard-nvim'
    "let g:dashboard_default_executive ='fzf'
    "let g:dashboard_custom_shortcut={
                "\ 'last_session'       : '; s l',
                "\ 'find_history'       : '; f h',
                "\ 'find_file'          : '; f f',
                "\ 'new_file'           : '; c n',
                "\ 'change_colorscheme' : '; t c',
                "\ 'find_word'          : '; f a',
                "\ 'book_marks'         : '; f b',
                "\ }
	"let g:dashboard_custom_header = [
		"\' 	               _                                           ',
		"\'               _(_)_                          wWWWw   _      ',
		"\'   @@@@       (_)@(_)   vVVVv     _     @@@@  (___) _(_)_    ',
		"\'  @@()@@ wWWWw  (_)\    (___)   _(_)_  @@()@@   Y  (_)@(_)   ',
		"\'   @@@@  (___)     `|/    Y    (_)@(_)  @@@@   \|/   (_)\    ',
		"\'    /      Y       \|    \|/    /(_)    \|      |/      |    ',
		"\' \ |     \ |/       | / \ | /  \|/       |/    \|      \|/   ',
		"\' \\|//   \\|///  \\\|//\\\|/// \|///  \\\|//  \\|//  \\\|//  ',
		"\]
    "nmap <Leader>ss :<C-u>SessionSave<CR>
    "nmap <Leader>sl :<C-u>SessionLoad<CR>
    "nmap <Leader>cn :<C-u>DashboardNewFile<CR>
    "nnoremap <silent> <Leader>fh :History<CR>
    "nnoremap <silent> <Leader>ff :Files<CR>
    "nnoremap <silent> <Leader>tc :Colors<CR>
    "nnoremap <silent> <Leader>fa :Rg<CR>
    "nnoremap <silent> <Leader>fb :Marks<CR>

    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    "Plug 'vim-airline/vim-airline'
    "Plug 'vim-airline/vim-airline-themes'
    Plug 'jiangmiao/auto-pairs'
    
    " Git management
    Plug 'tpope/vim-fugitive'
    
    " Git blame
    "Plug 'f-person/git-blame.nvim'
	Plug 'lewis6991/gitsigns.nvim'
    
    " Auto restore previous sessions
    Plug 'rmagatti/auto-session'

    " Alt file manager, using vifm
    " Plug vifm/vifm.vim'

    " Colorize hex colors
    Plug 'norcalli/nvim-colorizer.lua'

    " Peek at register with double quotes 
    Plug 'gennaro-tedesco/nvim-peekup'
    
    " Highlight same words and lines as cursor
    " Plug 'yamatsum/nvim-cursorline'

    " Better wildmenu
    Plug 'gelguy/wilder.nvim'
    " ', { 'do': ':UpdateRemotePlugins' }

    "Plug 'roxma/nvim-yarp'
    "Plug 'roxma/vim-hug-neovim-rpc'

    " Vim autosaver
    Plug 'Pocco81/AutoSave.nvim'

    " Todo highlighter
    Plug 'nvim-lua/plenary.nvim'
    Plug 'folke/todo-comments.nvim'

    " Autoread fixer
    Plug 'TheZoq2/neovim-auto-autoread'
    
    " Shows markdown through glow
    Plug 'ellisonleao/glow.nvim'

    " Allows you to follow links in markdown
    Plug 'jakewvincent/mkdnflow.nvim'

    " Smooth scrolling
    "Plug 'karb94/neoscroll.nvim'

    " Treesitter for syntax highlight
    " We recommend updating the parsers on update
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  

    " Treesitter, autoclose html tags
    Plug 'windwp/nvim-ts-autotag'
	
    " Pop up for key guides
    Plug 'folke/which-key.nvim'

    " Better tabs
    " Plug 'romgrk/barbar.nvim'
     
    " For better escape trigger
    " Plug 'max397574/better-escape.nvim'
    
	" Hit space twice to trigger menu
	" TODO: Customize menu below
    Plug 'skywind3000/vim-quickui'
	
	" Show which function you're in if you scroll down
	Plug 'romgrk/nvim-treesitter-context'
	
    " Finally allow for proper compiling and running of c/cpp
	Plug 'skywind3000/asyncrun.vim'
	Plug 'skywind3000/asynctasks.vim'

    " Better statusline than airline
    "Plug 'nvim-lualine/lualine.nvim'
    Plug 'famiu/feline.nvim'

    "Plug 'dstein64/vim-startuptime'
	
	" Vim Script
	" Plug 'folke/twilight.nvim'
  
    " Nvim tree config
    nnoremap <leader>v :NvimTreeToggle<CR>
    nnoremap <leader>r :NvimTreeRefresh<CR>
    nnoremap <leader>n :NvimTreeFindFile<CR>

  let g:nvim_tree_gitignore = 1 "0 by default
  let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
  let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
  let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
  let g:nvim_tree_highlight_opened_files = 3 "0 by default, will enable folder and file icon highlight for opened files/directories.
  let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
  let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
  let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
  let g:nvim_tree_disable_window_picker = 1 "0 by default, will disable the window picker.
  let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
  let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
  let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
  let g:nvim_tree_create_in_closed_folder = 0 "1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
  let g:nvim_tree_refresh_wait = 500 "1000 by default, control how often the tree can be refreshed, 1000 means the tree can be refresh once per 1000ms.
  let g:nvim_tree_window_picker_exclude = {
      \   'filetype': [
      \     'notify',
      \     'packer',
      \     'qf'
      \   ],
      \   'buftype': [
      \     'terminal'
      \   ]
      \ }
  " Dictionary of buffer option names mapped to a list of option values that
  " indicates to the window picker that the buffer's window should not be
  " selectable.
  let g:nvim_tree_special_files = { 'README.md': 1, 'Makefile': 1, 'MAKEFILE': 1 } " List of filenames that gets highlighted with NvimTreeSpecialFile
  let g:nvim_tree_show_icons = {
      \ 'git': 1,
      \ 'folders': 1,
      \ 'files': 1,
      \ 'folder_arrows': 1,
      \ }
  "If 0, do not show the icons for one of 'git' 'folder' and 'files'
  "1 by default, notice that if 'files' is 1, it will only display
  "if nvim-web-devicons is installed and on your runtimepath.
  "if folder is 1, you can also tell folder_arrows 1 to show small arrows next to the folder icons.
  "but this will not work when you set indent_markers (because of UI conflict)

  " default will show icon by default if no icon is provided
  " default shows no icon by default
  let g:nvim_tree_icons = {
      \ 'default': '',
      \ 'symlink': '',
      \ 'git': {
      \   'unstaged': "✗",
      \   'staged': "✓",
      \   'unmerged': "",
      \   'renamed': "➜",
      \   'untracked': "★",
      \   'deleted': "",
      \   'ignored': "◌"
      \   },
      \ 'folder': {
      \   'arrow_open': "",
      \   'arrow_closed': "",
      \   'default': "",
      \   'open': "",
      \   'empty': "",
      \   'empty_open': "",
      \   'symlink': "",
      \   'symlink_open': "",
      \   }
      \ }

	set termguicolors
endif

Plug 'preservim/nerdcommenter'
Plug 'junegunn/vim-easy-align'

" Plug 'asvetliakov/vim-easymotion'
" inside plug#begin:
" use normal easymotion when in vim mode
Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
" use vscode easymotion when in vscode mode
Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })

" Quickly surround text for brackets, parentheses, etc
Plug 'blackcauldron7/surround.nvim'



call plug#end()

" Lua setup
if !exists('g:vscode')

lua require('impatient')

lua << EOF
	require('which-key').setup {
	-- your configuration comes here
	-- or leave it empty to use the default settings
	-- refer to the configuration section below
  }
EOF

lua << EOF
	require("todo-comments").setup {
		-- your configuration comes here
		-- or leave it empty to use the default settings
		-- refer to the configuration section below
	}
EOF

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
	enable = true,              -- false will disable the whole extension
	disable = {},  -- list of language that will be disabled
	-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
	-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
	-- Using this option may slow down your editor, and you may see some duplicate highlights.
	-- Instead of true it can also be a list of languages
	additional_vim_regex_highlighting = false,
  },
}
EOF

lua << EOF
local autosave = require("autosave")

autosave.setup(
	{
		enabled = true,
		execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
		events = {"InsertLeave", "TextChanged"},
		conditions = {
			exists = true,
			filename_is_not = {},
			filetype_is_not = {},
			modifiable = true
		},
		write_all_buffers = false,
		on_off_commands = true,
		clean_command_line_interval = 0,
		debounce_delay = 135
	}
)
EOF

lua << EOF
require'treesitter-context'.setup{
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    throttle = true, -- Throttles plugin updates (may improve performance)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        -- For all filetypes
        -- Note that setting an entry here replaces all other patterns for this entry.
        -- By setting the 'default' entry below, you can control which nodes you want to
        -- appear in the context window.
        default = {
            'class',
            'function',
            'method',
            -- 'for', -- These won't appear in the context
            -- 'while',
            -- 'if',
            -- 'switch',
            -- 'case',
        },
        -- Example for a specific filetype.
        -- If a pattern is missing, *open a PR* so everyone can benefit.
        --   rust = {
        --       'impl_item',
        --   },
    },
}
EOF

lua << EOF
require'nvim-tree'.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = false,
    update_cwd  = false,
    ignore_list = {}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {}
  },
  view = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = {}
    }
  }
}
EOF

lua << EOF
require('auto-session').setup {
        auto_session_enable_last_session=true,
}
EOF

lua << EOF
require('gitsigns').setup {
  signs = {
    add          = {hl = 'GitSignsAdd'   , text = '│', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
    change       = {hl = 'GitSignsChange', text = '│', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    delete       = {hl = 'GitSignsDelete', text = '_', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
    changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
  },
  signcolumn = true,  -- Toggle with `:Gitsigns toggle_signs`
  numhl      = true, -- Toggle with `:Gitsigns toggle_numhl`
  linehl     = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff  = false, -- Toggle with `:Gitsigns toggle_word_diff`
  keymaps = {
    -- Default keymap options
    noremap = true,

    ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns.actions\".next_hunk()<CR>'"},
    ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns.actions\".prev_hunk()<CR>'"},

    ['n <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    ['v <leader>hs'] = '<cmd>lua require"gitsigns".stage_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ['n <leader>hu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    ['n <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    ['v <leader>hr'] = '<cmd>lua require"gitsigns".reset_hunk({vim.fn.line("."), vim.fn.line("v")})<CR>',
    ['n <leader>hR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    ['n <leader>hp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    ['n <leader>hb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
    ['n <leader>hS'] = '<cmd>lua require"gitsigns".stage_buffer()<CR>',
    ['n <leader>hU'] = '<cmd>lua require"gitsigns".reset_buffer_index()<CR>',

    -- Text objects
    ['o ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>',
    ['x ih'] = ':<C-U>lua require"gitsigns.actions".select_hunk()<CR>'
  },
  watch_gitdir = {
    interval = 1000,
    follow_files = true
  },
  attach_to_untracked = true,
  current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
  current_line_blame_opts = {
    virt_text = true,
    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
    delay = 250,
  },
  current_line_blame_formatter_opts = {
    relative_time = false
  },
  sign_priority = 6,
  update_debounce = 100,
  status_formatter = nil, -- Use default
  max_file_length = 40000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = 'single',
    style = 'minimal',
    relative = 'cursor',
    row = 0,
    col = 1
  },
  yadm = {
    enable = false
  },
}
EOF

lua << EOF
require('feline').setup({
    preset = 'feline'
})
EOF

lua require('nvim-ts-autotag').setup()

lua require"surround".setup{}
	
endif

"Vim Config stuff
if !exists('g:vscode')
    filetype plugin indent on
    colorscheme uwu
    "let g:airline_theme='google_dark'
    set noswapfile
    set ignorecase
    set number
    set showmatch
    set mouse=v
    set hlsearch
    " set tabstop=4
    " set softtabstop=4
    " set expandtab
    " set autoindent
    " set wildmenu
    set wildmode=longest,list
    set cc=80
    set mouse=a
    " set clipboard=unnamedplus
    set cursorline
    set backup
    set backupdir=D:\\VimTemp
    set relativenumber
    set autoread
    set signcolumn=yes
    "set guicursor=a:blinkon100
    set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
              \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
              \,sm:block-blinkwait175-blinkoff150-blinkon175

    "Press i to enter insert mode, and ii to exit insert mode.
    inoremap ii <Esc>
    inoremap jk <Esc>
    inoremap kj <Esc>
    vnoremap ii <Esc>
    
    "Open chadtree   
    "nnoremap <leader>v <cmd>CHADopen<cr>

    "Move lines up and down by alt+j/k
    inoremap <A-j> <Esc>:m .+1<CR>==gi
    inoremap <A-k> <Esc>:m .-2<CR>==gi
    vnoremap <A-j> :m '>+1<CR>gv=gv
    vnoremap <A-k> :m '<-2<CR>gv=gv

    "COC Config
    inoremap <silent><expr> <c-space> coc#refresh()
    
    " Highlight the symbol and its references when holding the cursor.
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " gd - go to definition of word under cursor
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)

    " gi - go to implementation
    nmap <silent> gi <Plug>(coc-implementation)

    " gr - find references
    nmap <silent> gr <Plug>(coc-references)

    " gh - get hint on whatever's under the cursor
    nnoremap <silent> K :call <SID>show_documentation()<CR>
    nnoremap <silent> gh :call <SID>show_documentation()<CR>
    
    " Applying codeAction to the selected region.
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)
    
    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
      else
        execute '!' . &keywordprg . " " . expand('<cword>')
      endif
    endfunction
    
    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300    

    " Use <c-space> to trigger completion.
    if has('nvim')
         inoremap <silent><expr> <c-space> coc#refresh()
    else
         inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Remap <C-f> and <C-b> for scroll float windows/popups.
    if has('nvim-0.4.0') || has('patch-8.2.0750')
      nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
      inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
      inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
      vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    endif

    " Do default action for next item.
    nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>

    " Use ctrl+j and ctrl+k to navigate completion 
    inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    
    " ;cr to rename the current word in the cursor
    nmap <leader>cr  <Plug>(coc-rename)
    nmap <leader>cf  <Plug>(coc-format-selected)
    vmap <leader>cf  <Plug>(coc-format-selected)

    " Open CHADtree on startup
    " autocmd vimenter * CHADopen
    
    " C/CPP Dev Stuff
    let g:c_syntax_for_h = 1

    " clang++ -MJ a.o.json -Wall -std=c++11 -o a.o -c a.cpp
    " Create function for the above command

    " wilder setup, see wilder github page
    call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<Tab>',
      \ 'previous_key': '<S-Tab>',
      \ 'accept_key': '<Up>',
      \ 'reject_key': '<Down>',
      \ })
    
    " 'highlighter' : applies highlighting to the candidates
    call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'left': [
      \   ' ', wilder#popupmenu_devicons(),
      \ ],
      \ 'right': [
      \   ' ', wilder#popupmenu_scrollbar(),
      \ ],
      \ }))
	
	"let g:auto_session_root_dir = "C:\Users\Pc\AppData\Local\nvim\sessions"
    
    " Auto set working directory to wherever file is
    autocmd BufEnter * silent! lcd %:p:h

	" clear all the menus
	call quickui#menu#reset()

	" install a 'File' menu, use [text, command] to represent an item.
	call quickui#menu#install('&File', [
				\ [ "&New File\tCtrl+n", 'echo 0' ],
				\ [ "&Open File\t(F3)", 'echo 1' ],
				\ [ "&Close", 'echo 2' ],
        \ [ "Open File &Browser", 'NvimTreeToggle'],
				\ [ "--", '' ],
				\ [ "&Save\tCtrl+s", 'echo 3'],
				\ [ "Save &As", 'echo 4' ],
				\ [ "Save All", 'echo 5' ],
				\ [ "--", '' ],
				\ [ "E&xit\tAlt+x", 'echo 6' ],
				\ ])

	" items containing tips, tips will display in the cmdline
	call quickui#menu#install('&Edit', [
				\ [ '&Copy', 'echo 1', 'help 1' ],
				\ [ '&Paste', 'echo 2', 'help 2' ],
				\ [ '&Find', 'echo 3', 'help 3' ],
				\ ])

	" script inside %{...} will be evaluated and expanded in the string
	call quickui#menu#install("&Option", [
				\ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
				\ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
				\ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
				\ ])

	" register HELP menu with weight 10000
	call quickui#menu#install('H&elp', [
				\ ["&Cheatsheet", 'help index', ''],
				\ ['T&ips', 'help tips', ''],
				\ ['--',''],
				\ ["&Tutorial", 'help tutor', ''],
				\ ['&Quick Reference', 'help quickref', ''],
				\ ['&Summary', 'help summary', ''],
				\ ], 10000)

	" enable to display tips in the cmdline
	let g:quickui_show_tip = 1
	
	" hit space twice to open menu
	noremap <space><space> :call quickui#menu#open()<cr>

    " set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P
	
    " Needed to config for async tasks
    let g:asyncrun_open = 6
    let g:asynctasks_term_pos = 'external'

    noremap <silent><f6> :AsyncTask file-build<cr>
    noremap <silent><f7> :AsyncTask file-run<cr>
    noremap <silent><leader>q :cclose<cr>

endif

" Both vscode and nvim

set tabstop=4
set softtabstop=4
set expandtab
set autoindent    
set smartindent
set ignorecase
set smartcase
set showcmd
set incsearch
set shiftwidth=4
set clipboard=unnamedplus

"Keybinds

" j/k will move virtual lines (lines that wrap)
 noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
 noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Select recently pasted stuff
nnoremap gp `[v`]

"Ctrl+/ to clear last search highlight
nnoremap <silent> <Esc><Esc> :let @/=""<CR>

" Enter to insert line below; \Enter to insert above
map <Enter> o<ESC>
map \<Enter> O<ESC>

" F1 to reset vimrc
map <f1> :so $MYVIMRC<CR>
" F2 to save file
map <f2> :w<CR>

" alt+H/L to go beginning/end of line
nmap <A-h> ^
nmap <A-l> $

"Aliases
"
"Allows to :cd $github for easy access
let $github = "~\\Documents\\GitHub"
"Type :e $init for easy config access
let $init = "~\\AppData\\Local\\nvim\\init.vim"
