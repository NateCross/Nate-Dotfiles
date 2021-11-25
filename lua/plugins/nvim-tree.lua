-----------------
--- Nvim-Tree ---
-----------------
-- Taken from https://github.com/kyazdani42/nvim-tree.lua
-- Also this https://github.com/brainfucksec/neovim-lua/blob/main/nvim/lua/plugins/nvim-tree.lua

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`

local tree_cb = require("nvim-tree.config").nvim_tree_callback

vim.g.nvim_tree_quit_on_open = 1
vim.g.nvim_tree_respect_buf_cwd = 1
vim.g.nvim_tree_gitignore = 0
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_highlight_opened_files = 1
-- vim.g.nvim_tree_special_files = { "README.md" = 1, "Makefile"=1, "MAKEFILE"=1 }
vim.g.nvim_tree_show_icons = {
    git = 1,
    folders = 1,
    files = 1,
    folder_arrows = 1
}
vim.cmd[[highlight NvimTreeFolderIcon guibg=blue]]

require'nvim-tree'.setup {
disable_netrw       = false,
hijack_netrw        = true,
open_on_setup       = false,
ignore_ft_on_setup  = {},
auto_close          = true,
open_on_tab         = false,
hijack_cursor       = true,
update_cwd          = true,
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
    enable      = true,
    update_cwd  = true,
    ignore_list = {}
},
system_open = {
    cmd  = nil,
    args = {}
},
filters = {
    dotfiles = true,
    custom = { '.git', 'node_modules', '.cache', '.bin' },
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