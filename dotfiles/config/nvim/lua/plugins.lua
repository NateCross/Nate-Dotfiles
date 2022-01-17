-- vim:fileencoding=utf-8:foldmethod=marker
-- The above line sets vim to have foldmarkers

------------
--- TODO ---
------------
-- {{{ Todo

-- }}}

-------------
--- SETUP ---
-------------
-- This config uses packer.nvim to load plugins
-- https://github.com/wbthomason/packer.nvim

-- Taken from https://github.com/wbthomason/packer.nvim#bootstrapping

-- FAQ for myself:
-- * Which configs to put in here or in its own config file?
--   If it's short or non-important, here. Otherwise, own file.
--   Use this format:

--  config = function()
--    require("plugins/file-name-here")
--  end

--------------------
--- PACKER SETUP ---
--------------------
-- {{{ Packer Setup
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
-- }}}

---------------
--- PLUGINS ---
---------------
-- {{{ Plugins

-- {{{ Packer can manage itself
use 'wbthomason/packer.nvim'
-- }}}

-- {{{ Nvim-tree: File tree viewer
-- https://github.com/kyazdani42/nvim-tree.lua
use {
  'kyazdani42/nvim-tree.lua',
  requires = 'kyazdani42/nvim-web-devicons',
  -- config = function() require'nvim-tree'.setup {} end
  config = function()
      require("plugins/nvim-tree")
  end
}
-- }}}

-- Native LSP {{{
-- https://github.com/neovim/nvim-lspconfig
use {
  'neovim/nvim-lspconfig',
  config = function()
      require("plugins/lsp-config")
  end,
}

-- https://github.com/williamboman/nvim-lsp-installer
use {
  'williamboman/nvim-lsp-installer',
  config = function()
    require("plugins/lsp-installer")
  end,
}
-- }}}

-- Telescope fuzzy finder {{{
-- Seems to work better than fzf for me
-- Plus, more plugin integration
-- https://github.com/nvim-telescope/telescope.nvim
use {
  'nvim-telescope/telescope.nvim',
  requires = { {'nvim-lua/plenary.nvim'} },
  config = function()
    require("plugins/telescope")
  end,
}
-- }}}

-- Tim Pope's fugitive, for git integration {{{
use { 'tpope/vim-fugitive' }
-- Makes the :GBrowse command work
use { 'tpope/vim-rhubarb' }
-- }}}

-- Git signs: Git diff and stuff in nvim {{{
-- https://github.com/lewis6991/gitsigns.nvim
use {
  'lewis6991/gitsigns.nvim',
  requires = {
    'nvim-lua/plenary.nvim'
  },
  config = function()
    require("plugins/gitsigns")
  end,
  -- tag = 'release' -- To use the latest release
}
-- }}}

-- nvim-cmp: Autocompleter for LSP {{{
-- https://github.com/hrsh7th/nvim-cmp
use {
  'hrsh7th/nvim-cmp',
  requires = {
    'neovim/nvim-lspconfig',
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-path',
    'hrsh7th/cmp-nvim-lsp'
    -- Not using cmdline because of wilder
    -- Plug 'hrsh7th/cmp-cmdline'
  },
  config = function()
    require("plugins/nvim-cmp")
  end,
}
-- }}}

-- Fancy icons for LSP using nvim-cmp {{{
-- https://github.com/onsails/lspkind-nvim
use 'onsails/lspkind-nvim'
-- }}}

-- Tabnine source for autocompletion {{{
-- https://github.com/tzachar/cmp-tabnine
use {
  'tzachar/cmp-tabnine',
  run = './install.sh',
  requires = 'hrsh7th/nvim-cmp'
}
-- }}}

-- Vsnip {{{
-- Needed for nvim-cmp
-- https://github.com/hrsh7th/vim-vsnip
use {
  'hrsh7th/vim-vsnip',
  requires = {
    'hrsh7th/vim-vsnip-integ',
    'hrsh7th/cmp-vsnip',
  }
}
-- }}}

-- Friendly snippets {{{
-- Needed for vsnip
-- https://github.com/rafamadriz/friendly-snippets
use "rafamadriz/friendly-snippets"
-- }}}

-- Treesitter for syntax highlighting {{{
-- https://github.com/nvim-treesitter/nvim-treesitter
-- Must install the needed languages, too!
use {
  'nvim-treesitter/nvim-treesitter',
  run = ':TSUpdate',
  config = function()
    require("plugins/nvim-treesitter")
  end,
}
-- }}}

-- Lualine, an actually working statusline
-- https://github.com/nvim-lualine/lualine.nvim
use {
  'nvim-lualine/lualine.nvim',
  requires = {'kyazdani42/nvim-web-devicons', opt = true},
  config = function()
    require("plugins/lualine")
  end,
}

-- Colored bracket highlighter for Treesitter
-- https://github.com/p00f/nvim-ts-rainbow
use 'p00f/nvim-ts-rainbow'

-- Treesitter Context: Show which function you're currently in at top
use {
  'romgrk/nvim-treesitter-context',
  config = function()
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
  end
}

-- Wilder: a better, customizable wildmenu
-- https://github.com/gelguy/wilder.nvim
use {
  'gelguy/wilder.nvim',
  run = ':UpdateRemotePlugins',
  config = function()
    require("plugins/wilder")
  end,
}


-- Nvim-autopairs: Automatically adds parentheses and stuff
-- https://github.com/windwp/nvim-autopairs
use {
  'windwp/nvim-autopairs',
  config = function()
    require('nvim-autopairs').setup({
      disable_filetype = { "TelescopePrompt" , "vim" },
    })
    -- These lines are required to make it work with nvim-cmp
    local cmp_autopairs = require("nvim-autopairs.completion.cmp")
    local cmp = require("cmp")
    cmp.event:on(
      "confirm_done",
      cmp_autopairs.on_confirm_done({map_char = {tex = ""}})
    )
  end
}

-- Bufferline: A good, well-maintained bufferline plugin
-- https://github.com/akinsho/bufferline.nvim
-- TODO: FINISH CONFIG
-- use {
  -- 'akinsho/bufferline.nvim',
  -- requires = 'kyazdani42/nvim-web-devicons',
  -- config = function()
    -- require("plugins/bufferline")
  -- end
-- }

-- Vista: Shows tags for easy movement
-- https://github.com/liuchengxu/vista.vim
-- Not actually a lua plugin, but I'll manage it the same way
use {
  'liuchengxu/vista.vim',
  config = function()
    require("plugins/vista")
  end
}

-- Treesitter Textobjects
-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
-- Must configure the binds to get it working!
use {
  'nvim-treesitter/nvim-treesitter-textobjects',
  config = function()
    require("plugins/treesitter-textobjects")
  end
}

-- Async Tasks: For running and building programs
-- https://github.com/skywind3000/asynctasks.vim
-- Make sure to bind run, compile, and build
use {
  'skywind3000/asynctasks.vim',
  requires = 'skywind3000/asyncrun.vim',
  config = function()
    -- vim.g.asyncrun_open = 6
    -- vim.g['asyncrun_open'] = 6
    -- vim.g['asynctasks_term_pos'] = 'external'
    vim.cmd[[
      let g:asyncrun_open = 6
      let g:asynctasks_term_pos = 'external'
    ]]
  end
}

-- Alpha: Dashboard on startup
-- https://github.com/goolord/alpha-nvim
use {
  'goolord/alpha-nvim',
  config = function()
    require("plugins/alpha")
  end
}

-- Quick-UI: Double tap space for a menu and reference
-- https://github.com/skywind3000/vim-quickui
use {
  'skywind3000/vim-quickui',
  config = function()
    require("plugins/quickui")
  end
}

-- Which-Key: A keybinding reference when you press stuff
-- https://github.com/folke/which-key.nvim
use {
  'folke/which-key.nvim',
  config = function()
    require("which-key").setup {}
    -- require("plugins/which-key")
  end
}

-- Tabout: press tab to escape brackets
-- https://github.com/abecodes/tabout.nvim
-- It has already neatly provided a config, so might as well
use {
  'abecodes/tabout.nvim',
  config = function()
    require('tabout').setup {
    tabkey = '<Tab>', -- key to trigger tabout, set to an empty string to disable
    backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
    act_as_tab = true, -- shift content if tab out is not possible
    act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
    enable_backwards = true, -- well ...
    completion = true, -- if the tabkey is used in a completion pum
    tabouts = {
      {open = "'", close = "'"},
      {open = '"', close = '"'},
      {open = '`', close = '`'},
      {open = '(', close = ')'},
      {open = '[', close = ']'},
      {open = '{', close = '}'}
    },
    ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
    exclude = {} -- tabout will ignore these filetypes
}
  end,
	wants = {'nvim-treesitter'}, -- or require if not used so far
	after = {'nvim-cmp'} -- if a completion plugin is using tabs load it before
}

-- Lightspeed: For quick movement using "s" alongside f and t keys
-- https://github.com/ggandor/lightspeed.nvim
-- Trigger with s/S
use {
  'ggandor/lightspeed.nvim',
  requires = 'tpope/vim-repeat', -- Needed for dot repeat
  config = function()
    require("plugins/lightspeed")
  end
}

-- Easy Align: Use "ga" plus text object to align stuff
-- https://github.com/junegunn/vim-easy-align
-- Probably outdated; keep a look out for a maintained version
-- Also see bindings in keybinds.lua
use 'junegunn/vim-easy-align'

-- Vim-surround: Easily surround text in brackets or whatever
-- https://github.com/tpope/vim-surround
-- action (d, c, etc.) + 's' + whatever delimiter
-- To wrap around text, use 'ys' then whatever text object
use 'tpope/vim-surround'

-- Auto-save: No need to think; it just saves
-- https://github.com/Pocco81/AutoSave.nvim
use {
  'Pocco81/AutoSave.nvim',
  config = function()
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
    })
  end
}

-- LSP Signature: Shows a guide when filling in functions
-- https://github.com/ray-x/lsp_signature.nvim
use {
  'ray-x/lsp_signature.nvim',
  config = function()
    require("plugins/lsp-signature")
  end
}

-- Trouble: Better diagnostic and quickfix menu
-- https://github.com/folke/trouble.nvim
use {
  "folke/trouble.nvim",
  requires = "kyazdani42/nvim-web-devicons",
  config = function()
    require("plugins/trouble")
  end
}

-- Tokyodark: Sweet new theme
-- https://github.com/tiagovla/tokyodark.nvim
use 'tiagovla/tokyodark.nvim'

-- Mini: A collection of mini lua modules
-- https://github.com/echasnovski/mini.nvim
-- TODO: Setup proper config that disables the correct things
-- use 'echasnovski/mini.nvim'

-- Todo-comments: A highlighter for todos
-- https://github.com/folke/todo-comments.nvim
use {
  "folke/todo-comments.nvim",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require("todo-comments").setup {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  end
}

-- Comment: Lua commenting plugin with gcc, LSP and TS support
-- https://github.com/numToStr/Comment.nvim
use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
}

-- Fzf: Fast fuzzy finder for locating files
-- https://github.com/junegunn/fzf.vim
use {
    'junegunn/fzf.vim',
    requires = 'junegunn/fzf',
    run = ':fzf#install()'
}

-- Telescope-fzf support
-- https://github.com/nvim-telescope/telescope-fzf-native.nvim
use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

-- Tabline: A tab and bufferline
-- https://github.com/kdheepak/tabline.nvim
use {
  'kdheepak/tabline.nvim',
  config = function()
    require'tabline'.setup {
      -- Defaults configuration options
      enable = true,
      options = {
      -- If lualine is installed tabline will use separators configured in lualine by default.
      -- These options can be used to override those settings.
        section_separators = {'', ''},
        component_separators = {'', ''},
        max_bufferline_percent = 66, -- set to nil by default, and it uses vim.o.columns * 2/3
        show_tabs_always = false, -- this shows tabs only when there are more than one tab or if the first tab is named
        show_devicons = true, -- this shows devicons in buffer section
        show_bufnr = true, -- this appends [bufnr] to buffer section,
        show_filename_only = false, -- shows base filename only instead of relative path in filename
      }
    }
    vim.cmd[[
      set guioptions-=e " Use showtabline in gui vim
      set sessionoptions+=tabpages,globals " store tabpages and globals in session
    ]]
  end,
  requires = { { 'hoob3rt/lualine.nvim', opt=true }, {'kyazdani42/nvim-web-devicons', opt = true} }
}

-- Neoscroll: Make scrolling fancier
-- https://github.com/karb94/neoscroll.nvim
use {
  'karb94/neoscroll.nvim',
  config = function()
    require('neoscroll').setup({
      -- All these keys will be mapped to their corresponding default scrolling animation
      mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
                  '<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
      hide_cursor = true,          -- Hide cursor while scrolling
      stop_eof = true,             -- Stop at <EOF> when scrolling downwards
      use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
      respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
      cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
      easing_function = 'sine',        -- Default easing function
      pre_hook = nil,              -- Function to run before the scrolling animation starts
      post_hook = nil,              -- Function to run after the scrolling animation ends
    })
  end
}

-- Nate UwU Custom
-- Custom colorscheme, needs modification
-- https://github.com/NateCross/uwu.vim
use {
  'NateCross/nate-uwu',
}


-- Shade: Dims inactive regions
-- https://github.com/sunjon/Shade.nvim
use {
  'sunjon/shade.nvim',
  config = function()
    require'shade'.setup({
      overlay_opacity = 50,
      opacity_step = 1,
      keys = {
        brightness_up    = '<C-Up>',
        brightness_down  = '<C-Down>',
        toggle           = '<Leader>s',
      }
    })
  end
}

-- Colorizer: Highlights hex code colors
-- https://github.com/chrisbra/Colorizer
use 'chrisbra/Colorizer'

-- Indent-blankline: Has bars to show indentation
-- https://github.com/lukas-reineke/indent-blankline.nvim
use {
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require('plugins/indent-blankline')
  end
}

-- Treesitter Refactor: Highlights same word in scope, among others
-- https://github.com/nvim-treesitter/nvim-treesitter-refactor
use {
  'nvim-treesitter/nvim-treesitter-refactor',
  config = function()
    require'nvim-treesitter.configs'.setup {
      refactor = {
        highlight_definitions = { enable = true },
      },
    }
  end
}

-- Nvim-DAP-UI: A debugging tool. plus UI
-- https://github.com/rcarriga/nvim-dap-ui
use {
  'rcarriga/nvim-dap-ui',
  requires = 'mfussenegger/nvim-dap',
  config = function()
    require("plugins/nvim-dap-ui")
  end
}

-- DAP Install: So I can actually get the debuggers to work
-- https://github.com/Pocco81/DAPInstall.nvim
use {
  "Pocco81/DAPInstall.nvim",
  requires = 'mfussenegger/nvim-dap',
  config = function()
    require("plugins/nvim-dap-install")
  end
}
-- NOTE: THE ABOVE TWO DAP PLUGINS DO NOT WORK RIGHT ON WINDOWS
-- KEEP AN EYE OUT FOR WINDOWS SUPPORT IN THE FUTURE

-- DAP Virtual Text: Shows variable values as virtual text
-- https://github.com/theHamsta/nvim-dap-virtual-text
use {
  'theHamsta/nvim-dap-virtual-text',
  config = function()
    require("nvim-dap-virtual-text").setup {
    enabled = true,                     -- enable this plugin (the default)
    enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false,   -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,            -- show stop reason when stopped for exceptions
    commented = false,                  -- prefix virtual text with comment string
    -- experimental features:
    virt_text_pos = 'right_align',              -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = false,                 -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                 -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil             -- position the virtual text at a fixed window column (starting from the first text column) ,
                                        -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}
  end
}

-- Focus: Arranges buffers
-- https://github.com/beauwilliams/focus.nvim
use {
  "beauwilliams/focus.nvim",
  config = function()
    require("focus").setup({
      -- excluded_filetypes = {"toggleterm"}
      -- excluded_buftypes = {"NvimTree"}
      -- NOTE: Insert DAP UI here
      -- enable = true,
      compatible_filetrees = {
        "OUTLINE", "DAP Scopes", "sh", "DAP Breakpoints", "DAP Stacks",
        "DAP Watches", "dap-repl", "Quickfix List", "quickfix"}
    })
  end
}
-- WARN: Really janky, messes up a lotta buffers like with DAP

-- Floaterm: Spawns a floating terminal
-- https://github.com/voldikss/vim-floaterm
use {
  'voldikss/vim-floaterm',
  config = function()
    -- vim.g['floaterm_wintype'] = 'float'
    -- vim.g['floaterm_position'] = 'botright'
  end
}

-- fzf-lua: Improved fzf in vim functionality
-- Prefer fzf over Telescope if possible
use {
  'ibhagwan/fzf-lua',
  -- optional for icon support
  requires = { 'kyazdani42/nvim-web-devicons' },
  config = function()
    require("plugins/fzf-lua")
  end
}

-- Luapad: Automatically evaluate lua statements in one command
-- https://github.com/rafcamlet/nvim-luapad
use {
  'rafcamlet/nvim-luapad',
  config = function()
  end
}

-- Sniprun: Runs code snippets with :SnipRun
-- https://github.com/michaelb/sniprun
use {
  'michaelb/sniprun',
  run = 'bash ./install.sh',
  config = function()
    require("plugins/snip-run")
  end
}

-- Null-LS: Lints and code actions
-- (https://github.com/jose-elias-alvarez/null-ls.nvim)
use {
  'jose-elias-alvarez/null-ls.nvim',
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require("null-ls").setup({
      sources = {
        -- NOTE: clang format is not needed because it is native with clangd
        -- require("null-ls").builtins.formatting.clang_format,
        -- require("null-ls").builtins.diagnostics.cppcheck,

      },
    })
  end
}

-- Aerial: Better code outline using LSP/Treesitter {{{
-- https://github.com/stevearc/aerial.nvim
-- use {
--   'stevearc/aerial.nvim',
--   config = function()
--     require("plugins/aerial")
--   end
-- }
-- }}}

-- Sidebar: Shows a status bar of sorts on the side with plenty of info {{{
-- https://github.com/sidebar-nvim/sidebar.nvim
use {
  'sidebar-nvim/sidebar.nvim',
  config = function()
    require("plugins/sidebar")
  end
}
-- }}}

-- }}}
------------------------
--- PLUGINS END HERE ---
------------------------

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

------------------------
--- PLUGIN BOOKMARKS ---
------------------------
-- {{{ Plugin Bookmarks

-- This section is for notable plugins to use in the future

-- Windline: an animated status line
-- https://github.com/windwp/windline.nvim
-- use {
--   'windwp/windline.nvim',
--   config = function()
--     require("plugins/windline")
--   end,
-- }
-- NOTE: It doesn't work, like, at all

-- Nvim-GPS: Fancy treesitter statusline widget
-- https://github.com/SmiteshP/nvim-gps
-- use {
--  'SmiteshP/nvim-gps'
--  config = function()
--    require("plugins/nvim-gps")
--  end
-- }
-- NOTE: NOT USED BECAUSE I HAVEN'T REWORKED STATUSLINE

-- Nvim-ts-autotag: Automatically closes html tags
-- https://github.com/windwp/nvim-ts-autotag
-- use {
--  'windwp/nvim-ts-autotag',
--  config = function()
--    require("plugins/nvim-ts-autotag")
--  end
-- }
-- NOTE: NOT USED BECAUSE I'M NOT DOING HTML... YET

-- Cokeline: Snazzy, super customizable bufferline
-- Yes, very funny
-- https://github.com/noib3/cokeline.nvim
-- use {
--   'noib3/cokeline.nvim',
--   requires = 'kyazdani42/nvim-web-devicons', -- If you want devicons
--   config = function()
--     require("plugins/cokeline")
--   end
-- }
-- NOTE: NOT USED BECAUSE... PEOPLE DON'T REALLY USE IT

-- Renamer: Better renamer than what's already in the LSP
-- https://github.com/filipdutescu/renamer.nvim
-- use {
  -- 'filipdutescu/renamer.nvim',
  -- branch = 'master',
  -- requires = { {'nvim-lua/plenary.nvim'} },
  -- config = function()
    -- require("plugins/renamer")
  -- end
-- }
-- NOTE: DOESN'T WORK, PROBABLY REDUNDANT


-- Zen Mode: Highlights certain portions of code
-- Must toggle with ':Twilight' first
-- https://github.com/folke/twilight.nvim
-- I put the config here because it's pretty much done
-- use {
--   "folke/twilight.nvim",
--   config = function()
--     require("twilight").setup {
--       dimming = {
--         alpha = 0.25, -- amount of dimming
--         -- we try to get the foreground from the highlight groups or fallback color
--         color = { "Normal", "#ffffff" },
--         inactive = false, -- when true, other windows will be fully dimmed (unless they contain the same buffer)
--       },
--       context = 10, -- amount of lines we will try to show around the current line
--       treesitter = true, -- use treesitter when available for the filetype
--       -- treesitter is used to automatically expand the visible text,
--       -- but you can further control the types of nodes that should always be fully expanded
--       expand = { -- for treesitter, we we always try to expand to the top-most ancestor with these types
--         "function",
--         "method",
--         "table",
--         "if_statement",
--       },
--       exclude = {}, -- exclude these filetypes
--     }
--   end
-- }
-- NOTE: Not really updated; use limelight and goyo instead


-- Kanagawa: New highly customizable theme based on Tokyodark
-- https://github.com/rebelot/kanagawa.nvim
-- use {
--   "rebelot/kanagawa.nvim",
--   config = function()
--     require('kanagawa').setup({
--       undercurl = true,           -- enable undercurls
--       commentStyle = "italic",
--       functionStyle = "NONE",
--       keywordStyle = "italic",
--       statementStyle = "bold",
--       typeStyle = "NONE",
--       variablebuiltinStyle = "italic",
--       specialReturn = true,       -- special highlight for the return keyword
--       specialException = true,    -- special highlight for exception handling keywords
--       transparent = false,        -- do not set background color
--       colors = {},
--       overrides = {},
--     })
--   end
-- }
-- WARN: Cool, but I prefer my own theme

-- Telescope Command Palette
-- Use this to replace Quick UI
-- https://github.com/LinArcX/telescope-command-palette.nvim
-- use { "LinArcX/telescope-command-palette.nvim" }
-- WARN: Menu items don't work

-- Goyo: Distraction free writing
-- https://github.com/junegunn/goyo.vim
--use {
--  'junegunn/goyo.vim',
--}

-- Limelight: Highlights only active text
-- https://github.com/junegunn/limelight.vim
--use {
--  'junegunn/limelight.vim',
--}
-- WARN: Never really found a good use for these

-- Telescope File Browser
-- https://github.com/nvim-telescope/telescope-file-browser.nvim
-- Requires setup in plugins/telescope.lua
-- use { "nvim-telescope/telescope-file-browser.nvim" }

-- Transparent
-- Easymode transparent cause I'm too lazy
-- to make it for my actual colorscheme
-- https://github.com/xiyaowong/nvim-transparent
-- use {
--   "xiyaowong/nvim-transparent",
--   config = function()
--     require("transparent").setup({
--       enable = false, -- boolean: enable transparent
--       extra_groups = { -- table/string: additional groups that should be clear
--         -- In particular, when you set it to 'all', that means all avaliable groups
--
--         -- example of akinsho/nvim-bufferline.lua
--         "BufferLineTabClose",
--         "BufferlineBufferSelected",
--         "BufferLineFill",
--         "BufferLineBackground",
--         "BufferLineSeparator",
--         "BufferLineIndicatorSelected",
--       },
--       exclude = {}, -- table: groups you don't want to clear
--     })
--   end
-- }
-- WARN: Does not work the way I want it to;
--       must actually set the bg in colorscheme + kitty
--       to make it transparent

-- -- Firenvim: Runs Neovim in browser
-- -- https://github.com/glacambre/firenvim
-- use {
--   'glacambre/firenvim',
--   run = function() vim.fn['firenvim#install'](0) end
-- }
-- WARN: Too lazy to config

-- Symbols outline: Vista alternative
-- NOTE: Config is in prefs.lua
-- WARN: Janky, can break files
-- https://github.com/simrat39/symbols-outline.nvim
-- use { 'simrat39/symbols-outline.nvim' }

-- }}}
