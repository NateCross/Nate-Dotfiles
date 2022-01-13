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
opt.foldmethod  = 'manual'      -- enable folding
opt.colorcolumn = '80'          -- line lenght marker at 80 columns
opt.splitright  = true          -- vertical split to the right
opt.splitbelow  = true          -- orizontal split to the bottom
opt.ignorecase  = true          -- ignore case letters when search
opt.smartcase   = true          -- ignore lowercase for the whole pattern
opt.linebreak   = true          -- wrap on word boundary
opt.wrap        = true          -- allows text to wrap around
opt.title       = true          -- Sets title to titlestring
opt.cursorline  = true

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

-- Tweak markdown and lua to use two spaces when tabbing
cmd [[autocmd FileType markdown setlocal shiftwidth=2 softtabstop=2 expandtab]]
cmd [[autocmd FileType lua setlocal shiftwidth=2 softtabstop=2 expandtab]]

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
cmd [[au VimEnter * FocusToggle]]

-- Automatically open all folds on entering a buffer
-- cmd [[au BufEnter * normal zR]]

-- Auto run :PackerCompile when plugins.lua is updated
-- vim.cmd([[
--   augroup packer_user_config
--     autocmd!
--     autocmd BufWritePost plugins.lua source <afile> | PackerCompile
--   augroup end
-- ]])

-- OLD HACK
-- Auto set working directory to wherever file is
-- NOTE: This command doesn't work in Neovim 0.7 beta, Kubuntu 20.04
-- cmd[[autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif]]
-- The above doesn't work; try this instead
-- nnoremap <leader>cd :lcd %:h<CR>

-- Async Tasks options
vim.g.asyncrun_open = 6
vim.g.asynctasks_term_pos = 'floaterm'
-- vim.g.asynctasks_term_pos = 'external'

-- Neovide GUI
-- https://github.com/neovide/neovide/wiki/Configuration

-- Symbols outline
-- These are mostly default, so
-- change as needed
-- https://github.com/simrat39/symbols-outline.nvim
vim.g.symbols_outline = {
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = true,
    position = 'right',
    relative_width = true,
    width = 25,
    auto_close = false,
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    preview_bg_highlight = 'Pmenu',
    keymaps = { -- These keymaps can be a string or a table for multiple keys
        close = {"<Esc>", "q"},
        goto_location = "<Cr>",
        focus_location = "o",
        hover_symbol = "<C-space>",
        toggle_preview = "K",
        rename_symbol = "r",
        code_actions = "a",
    },
    lsp_blacklist = {},
    symbol_blacklist = {},
    symbols = {
        File = {icon = "", hl = "TSURI"},
        Module = {icon = "", hl = "TSNamespace"},
        Namespace = {icon = "", hl = "TSNamespace"},
        Package = {icon = "", hl = "TSNamespace"},
        Class = {icon = "𝓒", hl = "TSType"},
        Method = {icon = "ƒ", hl = "TSMethod"},
        Property = {icon = "", hl = "TSMethod"},
        Field = {icon = "", hl = "TSField"},
        Constructor = {icon = "", hl = "TSConstructor"},
        Enum = {icon = "ℰ", hl = "TSType"},
        Interface = {icon = "ﰮ", hl = "TSType"},
        Function = {icon = "", hl = "TSFunction"},
        Variable = {icon = "", hl = "TSConstant"},
        Constant = {icon = "", hl = "TSConstant"},
        String = {icon = "𝓐", hl = "TSString"},
        Number = {icon = "#", hl = "TSNumber"},
        Boolean = {icon = "⊨", hl = "TSBoolean"},
        Array = {icon = "", hl = "TSConstant"},
        Object = {icon = "⦿", hl = "TSType"},
        Key = {icon = "🔐", hl = "TSType"},
        Null = {icon = "NULL", hl = "TSType"},
        EnumMember = {icon = "", hl = "TSField"},
        Struct = {icon = "𝓢", hl = "TSType"},
        Event = {icon = "🗲", hl = "TSType"},
        Operator = {icon = "+", hl = "TSOperator"},
        TypeParameter = {icon = "𝙏", hl = "TSParameter"}
    }
}

-- Floaterm
vim.g.floaterm_position = "bottomright"

-- Null-ls
-- Fix for https://github.com/jose-elias-alvarez/null-ls.nvim/issues/428
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.offsetEncoding = { "utf-16" }
require("lspconfig").clangd.setup({ capabilities = capabilities })
