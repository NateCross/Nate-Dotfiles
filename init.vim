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
	
	Plug 'equalsraf/neovim-gui-shim'
    
    "Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'kyazdani42/nvim-web-devicons'
    "Plug 'ryanoasis/vim-devicons'
    " Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " Plug 'neoclide/coc.nvim', {'branch': 'feat/use-ts-hi-group', 'do': 'yarn install --frozen-lockfile'}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
	
	" Nvim LSP setup
    Plug 'neovim/nvim-lspconfig'
    Plug 'williamboman/nvim-lsp-installer'
	Plug 'kosayoda/nvim-lightbulb'

    Plug 'dominikduda/vim_current_word'
	
	" Nvim cmp
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	"Plug 'hrsh7th/cmp-cmdline'
	Plug 'hrsh7th/nvim-cmp'
	Plug 'quangnguyen30192/cmp-nvim-ultisnips'
	Plug 'onsails/lspkind-nvim'
	
	" Tabnine main install is currently broken, use this instead
	Plug 'adrianiy/cmp-tabnine', { 'do': './install.sh' }
	"Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }

    Plug 'rcarriga/nvim-notify'

	" Not needed???
    Plug 'RishabhRD/popfix'
    Plug 'RishabhRD/nvim-lsputils'

    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
	
	" Snippets
	Plug 'hrsh7th/vim-vsnip'
	Plug 'hrsh7th/vim-vsnip-integ'
	Plug 'hrsh7th/cmp-vsnip'
	Plug 'rafamadriz/friendly-snippets'
	
	" Signature
	Plug 'ray-x/lsp_signature.nvim'
	
	" Lint
	Plug 'mfussenegger/nvim-lint'

    " For indenting
    Plug 'lukas-reineke/indent-blankline.nvim'

    " For tags
    Plug 'liuchengxu/vista.vim'

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
    Plug 'glepnir/dashboard-nvim'
    let g:dashboard_default_executive ='telescope'
    let g:dashboard_custom_shortcut={
                \ 'last_session'       : '; s l',
                \ 'find_history'       : '; f h',
                \ 'find_file'          : '; f f',
                \ 'new_file'           : '; c n',
                \ 'change_colorscheme' : '; t c',
                \ 'find_word'          : '; f a',
                \ 'book_marks'         : '; f b',
                \ }
    let g:dashboard_custom_header = [
        \' 	               _                                           ',
        \'               _(_)_                          wWWWw   _      ',
        \'   @@@@       (_)@(_)   vVVVv     _     @@@@  (___) _(_)_    ',
        \'  @@()@@ wWWWw  (_)\    (___)   _(_)_  @@()@@   Y  (_)@(_)   ',
        \'   @@@@  (___)     `|/    Y    (_)@(_)  @@@@   \|/   (_)\    ',
        \'    /      Y       \|    \|/    /(_)    \|      |/      |    ',
        \' \ |     \ |/       | / \ | /  \|/       |/    \|      \|/   ',
        \' \\|//   \\|///  \\\|//\\\|/// \|///  \\\|//  \\|//  \\\|//  ',
        \]
	let g:dashboard_custom_footer = [
		\'              Nate Cross               ',
		\'                                       ',
		\'Press spacebar twice to open quick menu',
		\'     Press K to open context menu      ',
		\]
    " TODO: Work on remaking the menu and maybe with custom binds!
	"let g:dashboard_custom_section={
    "  \ 'buffer_list': {
    "      \ 'description': [' Search Github Files                   ; b b'],
    "      \ 'command': ('GithubFiles') }
    "  \ }
    nmap <Leader>ss :<C-u>SessionSave<CR>
    nmap <Leader>sl :<C-u>SessionLoad<CR>
    nmap <Leader>cn :<C-u>DashboardNewFile<CR>
    "nnoremap <silent> <Leader>fh :History<CR>
    "nnoremap <silent> <Leader>ff :Files<CR>
    "nnoremap <silent> <Leader>tc :Colors<CR>
    "nnoremap <silent> <Leader>fa :Rg<CR>
    "nnoremap <silent> <Leader>fb :Marks<CR>
    "nnoremap <silent> <Leader>bb :GithubFiles<CR>
	
	nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
	nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
	nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
	nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
	nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
	nnoremap <silent> <Leader>cn :DashboardNewFile<CR>

    "Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
    "Plug 'vim-airline/vim-airline'
    "Plug 'vim-airline/vim-airline-themes'
    Plug 'jiangmiao/auto-pairs'
    
    " Git management
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    " Git blame
    "Plug 'f-person/git-blame.nvim'
	Plug 'lewis6991/gitsigns.nvim'
    
    " Auto restore previous sessions
    "Plug 'rmagatti/auto-session'

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

	" Better marks management
    " Plug 'chentau/marks.nvim'
	
	" Vim Script
	" Plug 'folke/twilight.nvim'
  
    " Nvim tree config
    nnoremap <leader>v :NvimTreeToggle<CR>:NvimTreeToggle<CR>:NvimTreeToggle<CR>
    nnoremap <leader>R :NvimTreeRefresh<CR>
    nnoremap <leader>n :NvimTreeFindFile<CR>

  let g:nvim_tree_gitignore = 1 "0 by default
  let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
  let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
  let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
  let g:nvim_tree_highlight_opened_files = 3 "0 by default, will enable folder and file icon highlight for opened files/directories.
  let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
  let g:nvim_tree_add_trailing = 1 "0 by default, append a trailing slash to folder names
  let g:nvim_tree_group_empty = 1 " 0 by default, compact folders that only contain a single folder into one node in the file tree
  let g:nvim_tree_disable_window_picker = 0 "0 by default, will disable the window picker.
  let g:nvim_tree_icon_padding = ' ' "one space by default, used for rendering the space between the icon and the filename. Use with caution, it could break rendering if you set an empty string depending on your font.
  let g:nvim_tree_symlink_arrow = ' >> ' " defaults to ' ➛ '. used as a separator between symlinks' source and target.
  let g:nvim_tree_respect_buf_cwd = 1 "0 by default, will change cwd of nvim-tree to that of new buffer's when opening nvim-tree.
  let g:nvim_tree_create_in_closed_folder = 1 "1 by default, When creating files, sets the path of a file when cursor is on a closed folder to the parent folder when 0, and inside the folder when 1.
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

    " Bracket colors
    Plug 'p00f/nvim-ts-rainbow'

    " Better fzf functionality
    Plug 'vijaymarupudi/nvim-fzf'
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

" Lua config
if !exists('g:vscode')

lua require('impatient')


lua << EOF


local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>aa', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "pyright", "rust_analyzer", "tsserver", "clangd" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    flags = {
      debounce_text_changes = 150,
    }
  }
end

if vim.fn.has('nvim-0.5.1') == 1 then
    vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
    vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
    vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
    vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
    vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
    vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
    vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
    vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
else
    local bufnr = vim.api.nvim_buf_get_number(0)

    vim.lsp.handlers['textDocument/codeAction'] = function(_, _, actions)
        require('lsputil.codeAction').code_action_handler(nil, actions, nil, nil, nil)
    end

    vim.lsp.handlers['textDocument/references'] = function(_, _, result)
        require('lsputil.locations').references_handler(nil, result, { bufnr = bufnr }, nil)
    end

    vim.lsp.handlers['textDocument/definition'] = function(_, method, result)
        require('lsputil.locations').definition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    vim.lsp.handlers['textDocument/declaration'] = function(_, method, result)
        require('lsputil.locations').declaration_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    vim.lsp.handlers['textDocument/typeDefinition'] = function(_, method, result)
        require('lsputil.locations').typeDefinition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    vim.lsp.handlers['textDocument/implementation'] = function(_, method, result)
        require('lsputil.locations').implementation_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    vim.lsp.handlers['textDocument/documentSymbol'] = function(_, _, result, _, bufn)
        require('lsputil.symbols').document_handler(nil, result, { bufnr = bufn }, nil)
    end

    vim.lsp.handlers['textDocument/symbol'] = function(_, _, result, _, bufn)
        require('lsputil.symbols').workspace_handler(nil, result, { bufnr = bufn }, nil)
    end
end

EOF

lua << EOF
require("indent_blankline").setup {
    char = "│",
    buftype_exclude = {"terminal", "dashboard"}
}
EOF

lua << EOF
local lsp_installer = require("nvim-lsp-installer")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
    local opts = {  }
    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

    -- This setup() function is exactly the same as lspconfig's setup function.
    -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
    server:setup(opts)
end)
EOF

lua << EOF
if vim.fn.has('nvim-0.5.1') == 1 then
    vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
    vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
    vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
    vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
    vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
    vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
    vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
    vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
else
    local bufnr = vim.api.nvim_buf_get_number(0)

    vim.lsp.handlers['textDocument/codeAction'] = function(_, _, actions)
        require('lsputil.codeAction').code_action_handler(nil, actions, nil, nil, nil)
    end

    vim.lsp.handlers['textDocument/references'] = function(_, _, result)
        require('lsputil.locations').references_handler(nil, result, { bufnr = bufnr }, nil)
    end

    vim.lsp.handlers['textDocument/definition'] = function(_, method, result)
        require('lsputil.locations').definition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    vim.lsp.handlers['textDocument/declaration'] = function(_, method, result)
        require('lsputil.locations').declaration_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    vim.lsp.handlers['textDocument/typeDefinition'] = function(_, method, result)
        require('lsputil.locations').typeDefinition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    vim.lsp.handlers['textDocument/implementation'] = function(_, method, result)
        require('lsputil.locations').implementation_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

    vim.lsp.handlers['textDocument/documentSymbol'] = function(_, _, result, _, bufn)
        require('lsputil.symbols').document_handler(nil, result, { bufnr = bufn }, nil)
    end

    vim.lsp.handlers['textDocument/symbol'] = function(_, _, result, _, bufn)
        require('lsputil.symbols').workspace_handler(nil, result, { bufnr = bufn }, nil)
    end
end
EOF

lua << EOF
require('telescope').setup{
  defaults = {
    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key",
      }
    }
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
	 fzf = {
	  fuzzy = true,                    -- false will only do exact matching
	  override_generic_sorter = true,  -- override the generic sorter
	  override_file_sorter = true,     -- override the file sorter
	  case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
									   -- the default case_mode is "smart_case"
    }
  }
}
EOF

lua require('telescope').load_extension('fzf')

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
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
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
  open_on_setup       = true,
  ignore_ft_on_setup  = {},
  auto_close          = true,
  open_on_tab         = false,
  hijack_cursor       = true,
  update_cwd          = true,
  update_to_buf_dir   = {
    enable = true,
    auto_open = false,
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
    auto_resize = true,
    mappings = {
      custom_only = false,
      list = {}
    }
  }
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

lua << EOF
require("notify").setup({
  -- Animation style (see below for details)
  stages = "fade_in_slide_out",

  -- Function called when a new window is opened, use for changing win settings/config
  on_open = nil,

  -- Render function for notifications. See notify-render()
  render = "default",

  -- Default timeout for notifications
  timeout = 5000,

  -- For stages that change opacity this is treated as the highlight behind the window
  -- Set this to either a highlight group or an RGB hex value e.g. "#000000"
  background_colour = "#000000",

  -- Minimum width for notification windows
  minimum_width = 50,

  -- Icons for the different levels
  icons = {
    ERROR = "",
    WARN = "",
    INFO = "",
    DEBUG = "",
    TRACE = "✎",
  },
})
EOF

lua << EOF
  -- Setup nvim-cmp.
  
  -- vsnip mappings
  local has_words_before = function()
	  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
	end

	local feedkey = function(key, mode)
	  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
	end
  local cmp = require'cmp'
  local lspkind = require('lspkind')
  
  local source_mapping = {
	buffer = "[Buffer]",
	nvim_lsp = "[LSP]",
	nvim_lua = "[Lua]",
	cmp_tabnine = "[TN]",
	path = "[Path]",
	}

  cmp.setup({
	sources = {
		{ name = 'cmp_tabnine' },
	},
	formatting = {
		format = lspkind.cmp_format({
			with_text = true,
			menu = ({
			 buffer = "[Buffer]",
			 nvim_lsp = "[LSP]",
			 luasnip = "[LuaSnip]",
			nvim_lua = "[Lua]",
			cmp_tabnine = "[TN]",
			latex_symbols = "[Latex]",
		   })
		}),
	},
	
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
      end,
    },
    mapping = {
	  -- ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
      -- ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
	  ['<C-j>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),

    ['<C-k>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
	  
    end, { "i", "s" }),
      ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-g>'] = cmp.mapping.complete(),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
	  ['<CR>'] = cmp.mapping.confirm({
		behavior = cmp.ConfirmBehavior.Replace,
		select = true,
	  }),
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
	  { name = 'cmp_tabnine' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Setup lspconfig.
  local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
  -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
  require('lspconfig')["clangd"].setup {
    capabilities = capabilities
  }
  require('lspconfig')["pyright"].setup {
    capabilities = capabilities
  }
EOF



lua << EOF
-- Showing defaults
require'nvim-lightbulb'.update_lightbulb {
    -- LSP client names to ignore
    -- Example: {"sumneko_lua", "null-ls"}
    ignore = {},
    sign = {
        enabled = true,
        -- Priority of the gutter sign
        priority = 10,
    },
    float = {
        enabled = true,
        -- Text to show in the popup float
        text = "💡",
        -- Available keys for window options:
        -- - height     of floating window
        -- - width      of floating window
        -- - wrap_at    character to wrap at for computing height
        -- - max_width  maximal width of floating window
        -- - max_height maximal height of floating window
        -- - pad_left   number of columns to pad contents at left
        -- - pad_right  number of columns to pad contents at right
        -- - pad_top    number of lines to pad contents at top
        -- - pad_bottom number of lines to pad contents at bottom
        -- - offset_x   x-axis offset of the floating window
        -- - offset_y   y-axis offset of the floating window
        -- - anchor     corner of float to place at the cursor (NW, NE, SW, SE)
        -- - winblend   transparency of the window (0-100)
        win_opts = {},
    },
    virtual_text = {
        enabled = false,
        -- Text to show at virtual text
        text = "💡",
        -- highlight mode to use for virtual text (replace, combine, blend), see :help nvim_buf_set_extmark() for reference
        hl_mode = "replace",
    },
    status_text = {
        enabled = true,
        -- Text to provide when code actions are available
        text = "💡",
        -- Text to provide when no actions are available
        text_unavailable = ""
    }
}
EOF

lua << EOF
cfg = {
  debug = false, -- set to true to enable debug logging
  log_path = "debug_log_file_path", -- debug log path
  verbose = false, -- show debug line number

  bind = true, -- This is mandatory, otherwise border config won't get registered.
               -- If you want to hook lspsaga or other signature handler, pls set to false
  doc_lines = 10, -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
                 -- set to 0 if you DO NOT want any API comments be shown
                 -- This setting only take effect in insert mode, it does not affect signature help in normal
                 -- mode, 10 by default

  floating_window = true, -- show hint in a floating window, set to false for virtual text only mode

  floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
  -- will set to true when fully tested, set to false will use whichever side has more space
  -- this setting will be helpful if you do not want the PUM and floating win overlap
  fix_pos = false,  -- set to true, the floating window will not auto-close until finish all parameters
  hint_enable = true, -- virtual hint enable
  hint_prefix = " ",  -- Panda for parameter
  hint_scheme = "String",
  use_lspsaga = false,  -- set to true if you want to use lspsaga popup
  hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
  max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
                   -- to view the hiding contents
  max_width = 120, -- max_width of signature floating_window, line will be wrapped if exceed max_width
  handler_opts = {
    border = "rounded"   -- double, rounded, single, shadow, none
  },

  always_trigger = false, -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58

  auto_close_after = nil, -- autoclose signature float win after x sec, disabled if nil.
  extra_trigger_chars = {}, -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
  zindex = 200, -- by default it will be on top of all floating windows, set to <= 50 send it to bottom

  padding = '', -- character to pad on left and right of signature can be ' ', or '|'  etc

  transparency = nil, -- disabled by default, allow floating win transparent value 1~100
  shadow_blend = 36, -- if you using shadow as border use this set the opacity
  shadow_guibg = 'Black', -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
  timer_interval = 200, -- default timer check interval set to lower value if you want to reduce latency
  toggle_key = nil -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
}

-- recommanded:
require'lsp_signature'.setup(cfg) -- no need to specify bufnr if you don't use toggle_key

-- You can also do this inside lsp on_attach
-- note: on_attach deprecated
require'lsp_signature'.on_attach(cfg, bufnr) -- no need to specify bufnr if you don't use toggle_key
EOF

lua require'colorizer'.setup()

lua << EOF
require('lint').linters_by_ft = {
  c = {'cppcheck',},
  cpp = {'cppcheck',},
  py = {'pylint',}
}
EOF

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
    " For the auto-session plugin
    set sessionoptions+=options,resize,winpos,terminal
    set foldmethod=manual
    set foldnestmax=1
	
	" From nvim cmp
	set completeopt=menu,menuone,noselect

    " TextEdit might fail if hidden is not set.
    set hidden

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

	" LSP Binds
    nnoremap <silent> gs    <cmd>lua vim.lsp.buf.declaration()<CR>
	nnoremap <silent> gd <cmd>lua require'telescope.builtin'.lsp_definitions{}<CR>
	nnoremap <silent> gh     <cmd>lua vim.lsp.buf.hover()<CR>
	nnoremap <silent> gD    <cmd>lua vim.lsp.buf.implementation()<CR>
	nnoremap <silent> <c-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
	nnoremap <silent> 1gD   <cmd>lua vim.lsp.buf.type_definition()<CR>
	nnoremap <silent> gr    <cmd>lua require'telescope.builtin'.lsp_references{}<CR>
	nnoremap <silent> g0    <cmd>lua vim.lsp.buf.document_symbol()<CR>
	nnoremap <silent> gW    <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
	
	" Rename highlighted thing
	nnoremap <silent> cr 	<cmd>lua vim.lsp.buf.rename()<CR>
	
	nnoremap <silent> <space>a <cmd>lua require'telescope.builtin'.lsp_code_actions{}<CR>
	nnoremap <silent> <space>v <cmd>lua require'telescope.builtin'.lsp_range_code_actions{}<CR>
	vnoremap <silent> <space>a <cmd>lua require'telescope.builtin'.lsp_range_code_actions{}<CR>

    " Open CHADtree on startup
    " autocmd vimenter * CHADopen
    
    " C/CPP Dev Stuff
    let g:c_syntax_for_h = 1

    " clang++ -MJ a.o.json -Wall -std=c++11 -o a.o -c a.cpp
    " Create function for the above command
	
	"let g:auto_session_root_dir = "C:\Users\Pc\AppData\Local\nvim\sessions"
    
    " Auto set working directory to wherever file is
    autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif
	
	" Vista config
	
	" How each level is indented and what to prepend.
	" This could make the display more compact or more spacious.
	" e.g., more compact: ["▸ ", ""]
	" Note: this option only works for the kind renderer, not the tree renderer.
	let g:vista_icon_indent = ["╰─▸ ", "├─▸ "]

	" Executive used when opening vista sidebar without specifying it.
	" See all the avaliable executives via `:echo g:vista#executives`.
	let g:vista_default_executive = 'ctags'

	" Set the executive for some filetypes explicitly. Use the explicit executive
	" instead of the default one for these filetypes when using `:Vista` without
	" specifying the executive.
	
	" Declare the command including the executable and options used to generate ctags output
	" for some certain filetypes.The file path will be appened to your custom command.
	" For example:
	let g:vista_ctags_cmd = {
		  \ 'haskell': 'hasktags -x -o - -c',
		  \ }

	" To enable fzf's preview window set g:vista_fzf_preview.
	" The elements of g:vista_fzf_preview will be passed as arguments to fzf#vim#with_preview()
	" For example:
	let g:vista_fzf_preview = ['right:50%']
	" Ensure you have installed some decent font to show these pretty symbols, then you can enable icon for the kind.
	let g:vista#renderer#enable_icon = 1

	" The default icons can't be suitable for all the filetypes, you can extend it as you wish.
	let g:vista#renderer#icons = {
	\   "function": "\uf794",
	\   "variable": "\uf71b",
	\  }

    let g:vista_close_on_jump = 1

    nnoremap <silent><leader>b :Vista!!<cr>

    " Quick UI Config

    " TODO: Copy this into its own theme
    let g:quickui_color_scheme = 'papercol_dark'
	let g:quickui_border_style = 3
	
	" Wilder setup
	call wilder#setup({
      \ 'modes': [':', '?'],
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

    " clear all the menus
	call quickui#menu#reset()

	" install a 'File' menu, use [text, command] to represent an item.
	call quickui#menu#install('&File', [
				\ [ "&New File\t:new", 'new' ],
				\ [ "&Open\t:e", 'call feedkeys(":e ")' ],
				\ [ "&Close\t:\q", 'q' ],
				\ [ "&Go to directory\t:cd", 'call feedkeys(":cd ")'],
				\ [ "--", '' ],
				\ [ "Open &Fuzzy Finder\t:Telescope find_files", 'Telescope find_files'],
				\ [ "Open File &Browser\t;v", 'NvimTreeToggle'],
				\ [ "--", '' ],
				\ [ "&Save\t:w", 'w'],
				\ [ "Save &As", 'call feedkeys(":w ")' ],
				\ ])

	" items containing tips, tips will display in the cmdline
    call quickui#menu#install('&Edit', [
                \ [ "&Rename\tcr", 'lua vim.lsp.buf.rename()', '' ],
                \ ])
	
	call quickui#menu#install("&Tabs", [
				\ [ "&Next Tab\tgt", 'tabnext' ],
				\ [ "&Previous Tab\tgT", 'tabprevious' ],
				\ [ "New &Tab\t:tabnew", 'tabnew' ],
				\ [ "Open file in new &tab\t:tabe", 'call feedkeys(":tabe ")' ],
				\ ])

	" script inside %{...} will be evaluated and expanded in the string
	call quickui#menu#install("&Option", [
				\ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
				\ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
				\ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
				\ ])
				
	call quickui#menu#install("&Build", [
				\ ["File &Compile\tF6", 'AsyncTask file-build'],
				\ ["File &Execute\tF7", 'AsyncTask file-run'],
				\ ["--", ''],
				\ ["T&ask List", 'call MenuHelp_TaskList()'],
				\ ['E&dit Task', 'AsyncTask -e'],
				\ ['Edit &Global Task', 'AsyncTask -E'],
				\ ['&Stop Building', 'AsyncStop'],
				\ ["--", ''],
				\ ["Close &Quickfix\t:cclose", 'cclose'], 
				\ ])

	" register HELP menu with weight 10000
	call quickui#menu#install('Hel&p', [
				\ ["H&elp Index\t:help", 'call quickui#tools#display_help("index")', ''],
				\ ["Help &Search", 'call feedkeys(":help ")', 'Search for a specific command to find help for.'],
				\ ['T&ips', 'help tips', ''],
				\ ['--',''],
				\ ["&Tutorial", 'help tutor', ''],
				\ ['&Quick Reference', 'help quickref', ''],
				\ ['&Summary', 'help summary', ''],
				\ ])
				
	let g:context_menu_k = [
			\ ["&Peek Definition\tgh", 'call CocActionAsync("doHover")'],
			\ ["S&earch in Project\t\\cx", 'grep <cword> *'],
			\ [ "--", ],
			\ [ "Find &Definition\t\gd", 'call feedkeys("\gd")', 'CoC Find Definition'],
			\ [ "Find &Symbol\t\\cs", 'call MenuHelp_Fscope("s")', 'GNU Gloal search s'],
			\ [ "Find &Called by\t\\cd", 'call MenuHelp_Fscope("d")', 'GNU Global search d'],
			\ [ "Find C&alling\t\\cc", 'call MenuHelp_Fscope("c")', 'GNU Global search c'],
			\ [ "Find &From Ctags\t\\cz", 'call MenuHelp_Fscope("z")', 'GNU Global search c'],
			\ [ "--", ],
			\ [ "Goto D&efinition\t(YCM)", 'YcmCompleter GoToDefinitionElseDeclaration'],
			\ [ "Goto &References\t(YCM)", 'YcmCompleter GoToReferences'],
			\ [ "Get D&oc\t(YCM)", 'YcmCompleter GetDoc'],
			\ [ "Get &Type\t(YCM)", 'YcmCompleter GetTypeImprecise'],
			\ [ "--", ],
			\ ['Dash &Help', 'call asclib#utils#dash_ft(&ft, expand("<cword>"))'],
			\ ['Cpp&man', 'exec "Cppman " . expand("<cword>")', '', 'c,cpp'],
			\ ['P&ython Doc', 'call quickui#tools#python_help("")', 'python'],
			\ ]

	" enable to display tips in the cmdline
	let g:quickui_show_tip = 1
	
	" hit space twice to open menu
	noremap <space><space> :call quickui#menu#open()<cr>
	
	" hit K to open context menu
	nnoremap <silent>K :call quickui#tools#clever_context('k', g:context_menu_k, {})<cr>

    " set statusline=%<%f%h%m%r%=%b\ 0x%B\ \ %l,%c%V\ %P
	
    " Needed to config for async tasks
    let g:asyncrun_open = 6
    let g:asynctasks_term_pos = 'external'

    noremap <silent><f6> :AsyncTask file-build<cr>
    noremap <silent><f7> :AsyncTask file-run<cr>
    noremap <silent><leader>q :cclose<cr>

    command! -bang GithubFiles call fzf#vim#files('~/Documents/Github/', <bang>0)
	
	noremap <silent><leader>fg :cd ~/Github<cr>:NvimTreeToggle<cr>
	
	" For linting
	au BufWritePost <buffer> lua require('lint').try_lint()

    let g:indent_blankline_filetype_exclude = ['help', 'dashboard']

    autocmd BufAdd NvimTree*,terminal,your_buffer_name.rb,*.js :let b:vim_current_word_disabled_in_this_buffer = 1
	
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

" Other configuration
if exists('g:nvui')
  " Configure nvui
  NvuiCmdFontFamily CaskaydiaCove
  NvuiCmdFontSize 12.0
  NvuiScrollAnimationDuration 0.2
    set guifont=CaskaydiaCove\ Nerd\ Font\ Mono:h12
endif


