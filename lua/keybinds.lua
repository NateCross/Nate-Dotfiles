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

-- Insert/visual mode exit commands

-- "hj" is my preferred escape bind,
-- because you can piano your index and middle fingers
-- so it's faster and more convenient
inoremap("hj", "<Esc>")

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
nnoremap("<leader>ff", "<cmd>lua require('telescope.builtin').find_files()<cr>")
nnoremap("<leader>fd", "<cmd>lua require('telescope.builtin').live_grep()<cr>")



