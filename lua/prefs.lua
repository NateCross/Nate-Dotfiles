-- ///////////////////
-- /// Preferences ///
-- ///////////////////
-- Taken from https://github.com/yashguptaz/nvy/blob/main/lua/options.lua

---------------
--- Aliases ---
---------------
-- Taken from https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/settings.lua

-- local map = vim.api.nvim_set_keymap  -- set global keymap
local cmd  = vim.cmd     				-- execute Vim commands
local exec = vim.api.nvim_exec 	        -- execute Vimscript
local fn   = vim.fn       				-- call Vim functions
local g    = vim.g         				-- global variables
local opt  = vim.opt         		    -- global/buffer/windows-scoped options

---------------
--- General ---
---------------
opt.mouse = 'a'               -- enable mouse support
opt.clipboard = 'unnamedplus' -- copy/paste to system clipboard
opt.swapfile = false          -- don't use swapfile
opt.autoread = true 		  -- make files auto update when changed
opt.incsearch = true

--------------
--- Visual ---
--------------
vim.wo.number         = true	-- Display line number
vim.wo.relativenumber = true	-- Display relative line number too
vim.o.title           = true    -- Display File Info on Title
vim.o.showmode        = false	-- Don't Show MODES
vim.o.cmdheight       = 1	    -- Better Error Messages
vim.wo.signcolumn     = 'yes'	-- Adds sign column for plugins

opt.showmatch   = true          -- highlight matching parenthesis
opt.foldmethod  = 'indent'      -- enable folding
opt.colorcolumn = '80'          -- line lenght marker at 80 columns
opt.splitright  = true          -- vertical split to the right
opt.splitbelow  = true          -- orizontal split to the bottom
opt.ignorecase  = true          -- ignore case letters when search
opt.smartcase   = true          -- ignore lowercase for the whole pattern
opt.linebreak   = true          -- wrap on word boundary
vim.cmd[[set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
              \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
              \,sm:block-blinkwait175-blinkoff150-blinkon175]]

-------------------
--- Colorscheme ---
-------------------
opt.termguicolors   = true	-- More colors; for colorscheme
cmd [[colorscheme uwu]]

-------------------
--- Performance ---
-------------------
opt.hidden     = true         -- enable background buffers
opt.history    = 100          -- remember n lines in history
opt.lazyredraw = true         -- faster scrolling
opt.synmaxcol  = 240          -- max column for syntax highlight

-----------------------
--- Tabs and Indent ---
-----------------------
opt.expandtab   = true        -- use spaces instead of tabs
opt.shiftwidth  = 4           -- shift 4 spaces when tab
opt.tabstop     = 4           -- 1 tab == 4 spaces
opt.smartindent = true        -- autoindent new lines

--------------------
--- Vim-specific ---
--------------------
opt.breakindent = true
opt.undofile    = true 	      -- Saves an undofile to store history
opt.updatetime  = 100 	      -- Decrease update time for plugins
opt.inccommand  = 'nosplit'   -- Incrememental live completion
opt.undodir     = vim.fn.stdpath("cache") .. "/undo"
opt.completeopt = "menu,menuone,noselect" -- For nvim=cmp

-- /////////////////////
-- /// Misc. Options ///
-- /////////////////////

-- don't auto commenting new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)

-- Auto run :PackerCompile when plugins.lua is updated
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--   augroup end
-- ]])

-- OLD HACK
-- Auto set working directory to wherever file is
cmd[[autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif]]
