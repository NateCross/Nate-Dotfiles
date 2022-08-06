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

opt.showmatch    = true          -- highlight matching parenthesis
opt.foldmethod   = 'expr'        -- enable folding
opt.foldexpr     = 'nvim_treesitter#foldexpr()'
opt.colorcolumn  = '80'          -- line lenght marker at 80 columns
opt.splitright   = true          -- vertical split to the right
opt.splitbelow   = true          -- orizontal split to the bottom
opt.ignorecase   = true          -- ignore case letters when search
opt.smartcase    = true          -- ignore lowercase for the whole pattern
opt.linebreak    = true          -- wrap on word boundary
opt.wrap         = true          -- allows text to wrap around
opt.title        = true          -- Sets title to titlestring
opt.cursorline   = true
opt.conceallevel = 3

-------------------
--- Colorscheme ---
-------------------
opt.termguicolors   = true	-- More colors; for colorscheme
-- Tokyodark exclusive settings
-- g.tokyodark_enable_italic_comment = true
-- g.tokyodark_color_gamma = "0.8"

-- local overrides = {
--
-- }
--
-- local colors = {
--   sumiInk1 = "#0E0E0E",
-- }
-- require'kanagawa'.setup({ overrides = overrides, colors = colors })

cmd [[colorscheme uwu]]


-------------------
--- Performance ---
-------------------
opt.hidden     = true         -- enable background buffers
opt.history    = 100          -- remember n lines in history
opt.lazyredraw = true         -- faster scrolling
opt.synmaxcol  = 240          -- max column for syntax highlight

-- Disable filetype.vim and use only filetype.lua
-- g.do_filetype_lua    = 1
-- g.did_load_filetypes = 0

-- Disable unneeded providers
g.loaded_python3_provider = 0
g.loaded_python_provider  = 0
g.loaded_ruby_provider    = 0
g.loaded_perl_provider    = 0
g.loaded_node_provider    = 0

-- Disable built-in plugins
g.loaded_netrw            = 1
g.loaded_netrwPlugin      = 1
g.loaded_matchparen       = 1
g.loaded_matchit          = 1
g.loaded_2html_plugin     = 1
g.loaded_getscriptPlugin  = 1
g.loaded_gzip             = 1
g.loaded_logipat          = 1
g.loaded_rrhelper         = 1
g.loaded_spellfile_plugin = 1
g.loaded_tarPlugin        = 1
g.loaded_vimballPlugin    = 1
g.loaded_zipPlugin        = 1


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
opt.undodir     = vim.fn.stdpath("data") .. "/undo"
opt.completeopt = "menu,menuone,noselect" -- For nvim=cmp

---------------------
--- Misc. Options ---
---------------------

-- Disable LSP virtual text due to having lsp_lines
-- vim.diagnostic.config({
--   virtual_text = false,
-- })

-- FILETYPE TWEAK --
cmd [[autocmd FileType markdown setlocal spell shiftwidth=2 softtabstop=2 expandtab]]
cmd [[autocmd FileType lua setlocal shiftwidth=2 softtabstop=2 expandtab]]
cmd [[autocmd FileType html setlocal shiftwidth=2 softtabstop=2 expandtab]]
cmd [[autocmd FileType js setlocal shiftwidth=2 softtabstop=2 expandtab]]
cmd [[autocmd FileType css setlocal shiftwidth=2 softtabstop=2 expandtab]]
cmd [[autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 expandtab]]
cmd [[autocmd FileType javascriptreact setlocal shiftwidth=2 softtabstop=2 expandtab]]
cmd [[autocmd FileType typescript setlocal shiftwidth=2 softtabstop=2 expandtab]]
cmd [[autocmd FileType typescriptreact setlocal shiftwidth=2 softtabstop=2 expandtab]]

-- Make .h files be recognized as c, not cpp
cmd [[let g:c_syntax_for_h = 1]]

-- don't auto comment new lines
cmd [[au BufEnter * set fo-=c fo-=r fo-=o]]

-- Highlight on yank
exec([[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
  augroup end
]], false)

-- Automatically switches off Focus
-- Turn it back on with ";ft"
-- cmd [[au VimEnter * FocusToggle]]

-- Automatically open all folds on entering a buffer
-- cmd [[au BufEnter * normal zR]]
-- The autocmd below fixes the "which-key" plugin
cmd [[au BufWinEnter * silent! :%foldopen!]]

-- Auto run :PackerCompile when plugins.lua is updated
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--   augroup end
-- ]])

-- Async Tasks options
vim.g.asyncrun_open = 6
vim.g.asynctasks_term_pos = 'floaterm'
-- vim.g.asynctasks_term_pos = 'external'

-- Floaterm
vim.g.floaterm_position = "bottomright"

-- Null-ls
-- Fix for https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428
-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities.offsetEncoding = { "utf-16" }
-- require("lspconfig").clangd.setup({ capabilities = capabilities })
