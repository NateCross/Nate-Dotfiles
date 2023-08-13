-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  -- vim.api.nvim_create_autocmd({ "VimEnter", "BufEnter", "BufRead" }, {
  callback = function()
    -- vim.cmd("echo 'Entering Buffer'")
    -- vim.cmd([[TaboutToggle]])
    -- vim.cmd([[TaboutToggle]])
    -- vim.api.nvim_set_hl(0, "NotifyBackground", {
    --   bg = "#111119",
    -- })
  end,
})

-- vim.api.nvim_create_autocmd

-- vim.api.nvim_create_autocmd("ColorScheme", {
--   callback = function()
--     vim.api.nvim_set_hl(0, "NotifyBackground", {
--       bg = "#111119",
--     })
--   end,
-- })
