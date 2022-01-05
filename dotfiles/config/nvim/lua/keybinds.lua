-------------
--- SETUP ---
-------------
-- Taken from https://github.com/yashguptaz/nvy/blob/main/lua/keymaps.lua

local Utils = require("keybind_utils")

local exprnnoremap = Utils.exprnnoremap
local nnoremap = Utils.nnoremap
local vnoremap = Utils.vnoremap
local xnoremap = Utils.xnoremap
local inoremap = Utils.inoremap
local tnoremap = Utils.tnoremap
local nmap = Utils.tnoremap

-- SAMPLES
-- nnoremap("<C-p>", [[<cmd>lua require('telescope.builtin').find_files()<CR>]])
-- xnoremap("<A-j>", ":move '>+1<CR>gv-gv")
-- vim.api.nvim_set_keymap("n", "<C-/>", "<Plug>kommentary_line_default", {})

--------------
--- CONFIG ---
--------------

-- Leader as ; so it's easier to reach
vim.g.mapleader = ';'
vim.g.maplocalleader = ';'

-- Reload lua config
-- nnoremap("<f1>", ":luafile $MYVIMRC")
-- Might wanna see the vimpeccable's reload plugin for this

-- Insert/visual mode exit commands
inoremap("ii", "<Esc>")
inoremap("jk", "<Esc>")
inoremap("kj", "<Esc>")
vnoremap("ii", "<Esc>")

-- Move lines up and down by alt+j/k
inoremap("<A-j>", "<Esc>:m .+1<CR>==gi")
inoremap("<A-k>", "<Esc>:m .-2<CR>==gi")
vnoremap("<A-j>", ":m '>+1<CR>gv=gv")
vnoremap("<A-k>", ":m '<-2<CR>gv=gv")

-- ";cd" to change working directory in current buffer to edited file
-- Taken from https://vimways.org/2019/vim-and-the-working-directory/
nnoremap("<leader>cd", ":lcd %:h<CR>")

-- Deal with word wraps
exprnnoremap("k", "v:count == 0 ? 'gk' : 'k'")
exprnnoremap("j", "v:count == 0 ? 'gj' : 'j'")

-- Yank to end of line
nnoremap("Y", "y$")

-- Better Visual Mode Indent
vnoremap("<", "<gv")
vnoremap(">", ">gv")

-- Select recently pasted stuff
nnoremap("gp", "`[v`]")

-- Enter to insert line below; \Enter to insert above
-- Shift + Enter doesn't seem to work so here's the next best thing
nnoremap("<Enter>", "o<ESC>")
nnoremap("\\<Enter>", "O<ESC>")

-- Make Y copy till end of line
nnoremap("Y", "y$")

-- <leader>Enter to split text to next line
nnoremap("<leader><CR>", "i<CR><ESC>")

-- Hit Esc twice to clear search
nnoremap("<Esc><Esc>", ":let @/=\"\"<CR>")

nnoremap("gb", ":bnext<CR>")
nnoremap("gB", ":bprev<CR>")

-- I like using space so have some
-- SPACE COMMANDS

-- Space + hjkl for window movement
nnoremap("<space>h", "<C-w>h")
nnoremap("<space>j", "<C-w>j")
nnoremap("<space>k", "<C-w>k")
nnoremap("<space>l", "<C-w>l")

-- Space + J/K for buffer movement
-- NOTE: No, this is dumb, use gb/gB
-- nnoremap("<space>J", ":bprev<CR>")
-- nnoremap("<space>K", ":bnext<CR>")

-- Space + F to quick find and replace
nnoremap("<space>F", ":%sm/")
xnoremap("<space>F", ":sm/")

-- Space + p to quick select a block of code
nnoremap("<space>p", "vip")

-- 'cd' towards the directory in which the current file is edited
-- but only change the path for the current window
nnoremap("<leader>cd", ":lcd %:h<CR>") 

-- Caps lock to go next line
inoremap("<f13>", "<CR>")

-----------------------
--- PLUGIN MAPPINGS ---
-----------------------

-- Nvim-tree
-- https://github.com/kyazdani42/nvim-tree.lua
nnoremap("<leader>v", ":NvimTreeToggle<CR>") 
-- Custom bind to quickly go to symlinked Github dir
nnoremap("<leader>V", ":cd ~/Github<cr>:NvimTreeToggle<CR>")

-- LSP Config
-- see plugins/lsp-config.lua
nnoremap("cr", "<cmd>lua vim.lsp.buf.rename()<CR>")

-- Telescope
-- See https://github.com/nvim-telescope/telescope.nvim/issues/394
-- fg does a fancy find files that shows hidden and through symlinks, but is slower
nnoremap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nnoremap("<leader>fs", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>")
nnoremap("<leader>fg", ":Telescope find_files find_command=rg,--ignore,--hidden,--files<CR>")
nnoremap("<leader>fd", "<cmd>lua require('telescope.builtin').live_grep()<cr>")
nnoremap("<leader>fb", "<cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>")
-- nnoremap("<leader><space>", ":Telescope command_palette<CR>")

-- fzf-lua
-- Prefer these functions over Telescope if possible
-- https://github.com/ibhagwan/fzf-lua
nnoremap("<space>ff", ":FzfLua files<CR>")
nnoremap("<space>fd", ":FzfLua grep<CR>")

-- Bufferline
-- https://github.com/akinsho/bufferline.nvim
-- nnoremap("gb", ":BufferLineCycleNext<CR>")
-- nnoremap("gB", ":BufferLineCyclePrev<CR>")

-- Quick UI
-- https://github.com/skywind3000/vim-quickui
nnoremap("<space><space>", ":call quickui#menu#open()<cr>")
nnoremap("K", ":call quickui#tools#clever_context('k', g:context_menu_k, {})<cr>")

-- Async Tasks
-- https://github.com/skywind3000/asynctasks.vim
nnoremap("<f6>", ":AsyncTask file-build<cr>")
nnoremap("<f7>", ":AsyncTask project-build<cr>")
nnoremap("<f8>", ":AsyncTask file-run<cr>")
nnoremap("<leader>q", ":cclose<cr>")

-- Easy Align
-- https://github.com/junegunn/vim-easy-align
vim.api.nvim_set_keymap('n', 'ga', '<Plug>(EasyAlign)', {} )
vim.api.nvim_set_keymap('x', 'ga', '<Plug>(EasyAlign)', {} )

-- Renamer: Use as alternate in case LSP doesn't work
-- https://github.com/filipdutescu/renamer.nvim
vim.api.nvim_set_keymap('i', '<F2>', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'cR', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'cR', '<cmd>lua require("renamer").rename()<cr>', { noremap = true, silent = true })

-- Symbols Outline
nnoremap("<leader>b", ":SymbolsOutline<CR>")

-- LSP
nnoremap("gs", "<cmd>lua vim.lsp.buf.declaration()<CR>")
nnoremap("gd", "<cmd>lua require'telescope.builtin'.lsp_definitions{}<CR>")
nnoremap("gh", "<cmd>lua vim.lsp.buf.hover()<CR>")
nnoremap("gD", "<cmd>lua vim.lsp.buf.implementation()<CR>")
nnoremap("<c-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
nnoremap("<leader>gd", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
nnoremap("gr", "<cmd>lua require'telescope.builtin'.lsp_references{}<CR>")
nnoremap("g0", "<cmd>lua vim.lsp.buf.document_symbol()<CR>")
nnoremap("gW", "<cmd>lua vim.lsp.buf.workspace_symbol()<CR>")
nnoremap("<leader>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>")
nnoremap("<leader>a", "<cmd>lua require'telescope.builtin'.lsp_code_actions{}<CR>")
vnoremap("<leader>a", "<cmd>lua require'telescope.builtin'.lsp_range_code_actions{}<CR>")

-- Neovide
-- There's something funky when I use ctrl+f and ctrl+b
nnoremap("<c-f>", "<c-f>M")
nnoremap("<c-b>", "<c-b>M")

-- Trouble
-- https://github.com/folke/trouble.nvim
nnoremap("<leader>xx", "<cmd>TroubleToggle<cr>")
nnoremap("<leader>xw", "<cmd>TroubleToggle lsp_workspace_diagnostics<cr>")
nnoremap("<leader>xd", "<cmd>TroubleToggle lsp_document_diagnostics<cr>")
nnoremap("<leader>xq", "<cmd>TroubleToggle quickfix<cr>")
nnoremap("<leader>xl", "<cmd>TroubleToggle loclist<cr>")
nnoremap("gR", "<cmd>TroubleToggle lsp_references<cr>")

-- Focus Toggle
nnoremap("<leader>ft", ":FocusToggle<CR>")

-- Nvim-dap
nnoremap("<leader>dd", ":lua require'dap'.toggle_breakpoint()<CR>")
nnoremap("<leader>dc", ":lcd %:h<CR> :lua require'dap'.continue()<CR>")
nnoremap("<leader>dr", ":lua require'dap'.run_last()<CR>")
nnoremap("<leader>dq", ":lua require'dap'.step_over()<CR>")
nnoremap("<leader>dw", ":lua require'dap'.step_into()<CR>")
nnoremap("<leader>de", ":lua require'dap'.step_out()<CR>")
nnoremap("<leader>da", ":lua require'dapui'.toggle()<CR>")

-- Floaterm
nnoremap("<F1>", ":FloatermNew<CR>")
tnoremap("<F1>", "<C-\\><C-n>:FloatermNew<CR>")
nnoremap("<F2>", ":FloatermPrev<CR>")
tnoremap("<F2>", "<C-\\><C-n>:FloatermPrev<CR>")
nnoremap("<F3>", ":FloatermNext<CR>")
tnoremap("<F3>", "<C-\\><C-n>:FloatermNext<CR>")
nnoremap("<F4>", ":FloatermToggle<CR>")
tnoremap("<F4>", "<C-\\><C-n>:FloatermToggle<CR>")
