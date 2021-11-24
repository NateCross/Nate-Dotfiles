-- ///////////////////
-- ////   SETUP   ////
-- ///////////////////
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

-- //////////////////
-- ///   CONFIG   ///
-- //////////////////

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

-----------------------
--- PLUGIN MAPPINGS ---
-----------------------

-- Nvim-tree
-- https://github.com/kyazdani42/nvim-tree.lua
nnoremap("<leader>v", ":NvimTreeToggle<CR>") 


