-- https://github.com/sidebar-nvim/sidebar.nvim/blob/main/doc/general.md#options
local sidebar = require("sidebar-nvim")
local opts = {
  bindings = {
    ["q"] = function()
      require("sidebar-nvim").close()
    end
  },
  initial_width = 30,
  open = true,
  side = "right",
  sections = { "todos", "symbols", "git", "diagnostics", "files" },
  todos = {
    initially_closed = true, -- whether the groups should be initially closed on start. You can manually open/close groups later.
    -- Open/close with the 't' key
  },
  disable_closing_prompt = false,
}

sidebar.setup(opts)

-- function _sidebar_toggle()
--   if not require('nvim-tree.view').win_open() then
--     if require('sidebar-nvim.view').win_open() then
--       require('bufferline.state').set_offset(0)
--     else
--       require('bufferline.state').set_offset(31, 'FileTree')
--     end
--     require('sidebar-nvim').toggle()
--   end
-- end
--
-- function _tree_toggle() if require('nvim-tree.view').win_open() then require('bufferline.state').set_offset(0) else require('bufferline.state').set_offset(31, 'FileTree') if require('sidebar-nvim.view').win_open() then require('sidebar-nvim').close() end require('nvim-tree.lib').refresh_tree() end require('nvim-tree').toggle() end
