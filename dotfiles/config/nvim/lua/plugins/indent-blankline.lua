vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")
-- vim.g.indent_blankline_context_char_list = {'║'}
vim.g.indent_blankline_use_treesitter = true
vim.g.indent_blankline_filetype_exclude = {'help', 'alpha', 'NvimTree'}
vim.g.indent_blankline_context_patterns = {'class', 'function', 'method', 'loop', '^if', '^while', '^else', '^else if', '^for', '^switch'}
-- vim.cmd [[
--   let g:indent_blankline_filetype_exclude = ['help', 'alpha', 'NvimTree']
-- ]]

require("indent_blankline").setup {
  -- space_char_blankline = " ",
  show_current_context = true,
  show_current_context_start = true,
}
