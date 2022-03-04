local previewers = require('telescope.previewers')

local new_maker = function(filepath, bufnr, opts)
  opts = opts or {}

  filepath = vim.fn.expand(filepath)
  vim.loop.fs_stat(filepath, function(_, stat)
    if not stat then return end
    if stat.size > 100000 then
      return
    else
      previewers.buffer_previewer_maker(filepath, bufnr, opts)
    end
  end)
end

require('telescope').setup{
  defaults = {
    file_ignore_patterns = {"C:/Windows/", "node_modules", "obsidian", ".obsidian"},
    buffer_previewer_maker = new_maker,

    -- Default configuration for telescope goes here:
    -- config_key = value,
    mappings = {
      i = {
        -- map actions.which_key to <C-h> (default: <C-/>)
        -- actions.which_key shows the mappings for your picker,
        -- e.g. git_{create, delete, ...}_branch for the git_branches picker
        ["<C-h>"] = "which_key",
        ["`"] = "close",
      },
      n = {
        ["q"] = "close",
      },
    },
    -- file_ignore_patterns = {"Windows"},
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
    lsp_references = {
      theme = "dropdown",
    },
    lsp_code_actions = {
      theme = "cursor",
    },
	-- Find through symlnks
	-- Taken from https://github.com/nvim-telescope/telescope.nvim/issues/394
	find_files = {
      hidden = true,
		-- This command below seems buggy
		-- find_command = { "rg", "--ignore", "--hidden", "--files", "-L" },
        -- find_command = { "rg", "-L" },
	},
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    },
    file_browser = {
      theme = "ivy",
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
    -- Your extension configuration goes here:
    -- extension_name = {
    --   extension_config_key = value,
    -- }
    -- please take a look at the readme of the extension you want to configure
  }
}

require('telescope').load_extension('fzf')
-- require('telescope').load_extension('command_palette')

