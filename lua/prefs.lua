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

-------------------
--- Colorscheme ---
-------------------
opt.termguicolors   = true	-- More colors; for colorscheme
cmd [[colorscheme uwu-nate]]

-------------------
--- Performance ---
-------------------
opt.hidden = true         -- enable background buffers
opt.history = 100         -- remember n lines in history
opt.lazyredraw = true     -- faster scrolling
opt.synmaxcol = 240       -- max column for syntax highlight

-- /////////////////////
-- /// Misc. Options ///
-- /////////////////////

-- Highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)

-- Auto run :PackerCompile when plugins.lua is updated
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])
