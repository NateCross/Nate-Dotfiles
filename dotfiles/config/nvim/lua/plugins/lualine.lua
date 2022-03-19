-- Slanted gaps recolored
local colors = {
  red = '#ca1243',
  grey = '#a0a1a7',
  black = '#383a42',
  -- white = '#f3f3f3',
  white = '#ffccb',
  light_green = '#83a598',
  orange = '#fe8019',
  green = '#8ec07c',
  rose = '#dc143c',
  dark_rose = '#811331',
  salmon = '#FA8072',
  ruby_red = '#E0115F',
  oxblood ='#4A0404',
  poppy = '#E35335',
  neon_red = '#FF3131',
  pastel_red = '#FAA0A0',
  font = '#F76F72',
  chestnut = '#986868',
}

-- WARN: Taken from lualine github; doesn't really work
--- @param trunc_width number trunctates component when screen width is less then trunc_width
--- @param trunc_len number truncates component to trunc_len number of chars
--- @param hide_width number hides component when window width is smaller then hide_width
--- @param no_ellipsis boolean whether to disable adding '...' at end after truncation
--- return function that can format the component accordingly
local function trunc(trunc_width, trunc_len, hide_width, no_ellipsis)
  return function(str)
    local win_width = vim.fn.winwidth(0)
    if hide_width and win_width < hide_width then return ''
    elseif trunc_width and trunc_len and win_width < trunc_width and #str > trunc_len then
       return str:sub(1, trunc_len) .. (no_ellipsis and '' or '...')
    end
    return str
  end
end

local conditions = {
  buffer_not_empty = function()
    return vim.fn.empty(vim.fn.expand '%:t') ~= 1
  end,
  hide_in_width = function()
    return vim.fn.winwidth(0) > 80
  end,
  check_git_workspace = function()
    local filepath = vim.fn.expand '%:p:h'
    local gitdir = vim.fn.finddir('.git', filepath .. ';')
    return gitdir and #gitdir > 0 and #gitdir < #filepath
  end,
}

local theme = {
  normal = {
    a = { fg = colors.font, bg = colors.dark_rose },
    b = { fg = colors.chestnut, bg = colors.dark_rose },
    c = { fg = colors.font, bg = colors.rose },
    z = { fg = colors.font, bg = colors.dark_rose },
  },
  -- NOTE: These seem bugged
  -- insert = { a = { fg = colors.black, bg = colors.salmon } },
  -- visual = { a = { fg = colors.grey, bg = colors.neon_red } },
  -- replace = { a = { fg = colors.grey, bg = colors.poppy } },
}

local current_treesitter_context = function()
  if not packer_plugins["nvim-treesitter"] or packer_plugins["nvim-treesitter"].loaded == false then
    return " "
  end
  local f = require'nvim-treesitter'.statusline({
    indicator_size = 300,
    type_patterns = {"class", "function", "method", "interface", "type_spec", "table", "if_statement", "for_statement", "for_in_statement"}
  })
  local fun_name = string.format("%s", f) -- convert to string, it may be a empty ts node
  if fun_name == "vim.NIL" then
    return " "
  end
  return " " .. fun_name
end

local empty = require('lualine.component'):extend()
function empty:draw(default_highlight)
  self.status = ''
  self.applied_separator = ''
  self:apply_highlights(default_highlight)
  self:apply_section_separators()
  return self.status
end

-- Put proper separators and gaps between components in sections
local function process_sections(sections)
  for name, section in pairs(sections) do
    local left = name:sub(9, 10) < 'x'
    for pos = 1, name ~= 'lualine_z' and #section or #section - 1 do
      table.insert(section, pos * 2, { empty, color = { fg = colors.oxblood, bg = colors.oxblood } })
    end
    for id, comp in ipairs(section) do
      if type(comp) ~= 'table' then
        comp = { comp }
        section[id] = comp
      end
      comp.separator = left and { right = '' } or { left = '' }
    end
  end
  return sections
end

local function search_result()
  if vim.v.hlsearch == 0 then
    return ''
  end
  local last_search = vim.fn.getreg '/'
  if not last_search or last_search == '' then
    return ''
  end
  local searchcount = vim.fn.searchcount { maxcount = 9999 }
  return last_search .. '(' .. searchcount.current .. '/' .. searchcount.total .. ')'
end

local function modified()
  if vim.bo.modified then
    return '+'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return '-'
  end
  return ''
end

require('lualine').setup {
  options = {
    theme = theme,
    component_separators = '',
    section_separators = { left = '', right = '' },
    globalstatus = true,
  },
  sections = process_sections {
    lualine_a = { 'mode' },
    lualine_b = {
      -- 'branch',
      {'b:gitsigns_head', icon = ''}, -- NOTE: Requires gitsigns
      -- {'diff', fmt=trunc(90, 4, nil, true)},
      {
        'diff',
        symbols = { added = ' ', modified = '柳', removed = ' ' },
        diff_color = {
          added = { fg = colors.pastel_red },
          modified = { fg = colors.salmon },
          removed = { fg = colors.poppy },
        },
        cond = conditions.hide_in_width,
      },

      -- {
      --   'diagnostics',
      --   source = { 'nvim' },
      --   sections = { 'error' },
      --   diagnostics_color = { error = { bg = colors.red, fg = colors.white } },
      -- },
      {
        'diagnostics',
        source = { 'nvim' },
        sections = { 'warn', 'error' },
        diagnostics_color = {
          warn = { bg = colors.neon_red, fg = colors.white },
          error = { bg = colors.neon_red, fg = colors.orange },
        },
      },
      -- NOTE: filename not needed anymore because bufline
      -- { 'filename', file_status = false, path = 0, shorting_target = 10 },
      -- { 'filename', fmt=trunc(80, 4, nil, true), file_status = false, path = 0, shorting_target = 10 },
      { modified, color = { bg = colors.red } },
      {
        '%w',
        cond = function()
          return vim.wo.previewwindow
        end,
      },
      {
        '%r',
        cond = function()
          return vim.bo.readonly
        end,
      },
      {
        '%q',
        cond = function()
          return vim.bo.buftype == 'quickfix'
        end,
      },
    },
    lualine_c = {},
    lualine_x = {},
    lualine_y = { search_result, 'filetype' },
    -- lualine_z = { '%l:%c', '%p%%/%L' },
    lualine_z = { '%l:%c' },
  },
  inactive_sections = {
    lualine_c = { '%f %y %m' },
    -- lualine_c = { 'location' },
    lualine_x = {},
  },
  tabline = process_sections {
    lualine_a = {
      {
        'buffers',
        show_filename_only = true, -- shows shortened relative path when false
        show_modified_status = true, -- shows indicator then buffer is modified
        mode = 2, -- 0 shows buffer name
                  -- 1 buffer index (bufnr)
                  -- 2 shows buffer name + buffer index (bufnr)
        max_length = vim.o.columns * 2 / 3, -- maximum width of buffers component
                                            -- can also be a function that returns value of max_length dynamicaly
        -- filetype_names = {
        --   TelescopePrompt = 'Telescope',
        --   dashboard = 'Dashboard',
        --   packer = 'Packer',
        --   fzf = 'FZF',
        --   alpha = 'Alpha'
        -- }, -- shows specific buffer name for that filetype ( { `filetype` = `buffer_name`, ... } )
        buffers_color = {
          -- Same values like general color option can be used here.
          active = { bg = colors.dark_rose }, -- color for active buffer
          inactive = { bg = colors.red }, -- color for inactive buffer
        },
      }
    },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y =
    {
      {
        'tabs',
        tabs_color = {
          active = { bg = colors.dark_rose }, -- color for active buffer
          inactive = { bg = colors.red }, -- color for inactive buffer
        }
      }
    },
    lualine_z = {'fileformat'},
  }
}

-- ORIGINAL LUALINE BELOW

-- require'lualine'.setup {
--   options = {
--     icons_enabled = true,
--     theme = 'auto',
--     component_separators = { left = '', right = ''},
--     section_separators = { left = '', right = ''},
--     disabled_filetypes = {},
--     always_divide_middle = true,
--   },
--   sections = {
--     lualine_a = {'mode'},
--     -- lualine_b = {'branch', 'diff',
--     --              {'diagnostics', sources={'nvim_lsp', 'coc'}}},
--     lualine_b = { {'b:gitsigns_head', icon = ''}, },
--     lualine_c = {'filename'},
--     lualine_x = {'encoding', 'fileformat', 'filetype'},
--     lualine_y = {'progress'},
--     lualine_z = {'location'}
--   },
--   inactive_sections = {
--     lualine_a = {},
--     lualine_b = {},
--     lualine_c = {'filename'},
--     lualine_x = {'location'},
--     lualine_y = {},
--     lualine_z = {}
--   },
--   tabline = {},
--   extensions = {'nvim-tree', 'fugitive', 'quickfix'}
-- }
