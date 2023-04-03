-- every spec file under config.plugins will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {

  -- Colorscheme
  {
    "Shadorain/shadotheme",
    lazy = true,
    init = function()
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.api.nvim_set_hl(0, "NormalFloat", { bg = "#111119", fg = "None" })
        end,
      })
    end,
  },

  {
    "xiyaowong/nvim-transparent",
    config = function()
      require("transparent").setup({
        -- enable = true, -- boolean: enable transparent
        extra_groups = { -- table/string: additional groups that should be cleared
          -- In particular, when you set it to 'all', that means all available groups

          -- example of akinsho/nvim-bufferline.lua
          -- "BufferLineTabClose",
          -- "BufferlineBufferSelected",
          -- "BufferLineFill",
          -- "BufferLineBackground",
          -- "BufferLineSeparator",
          -- "BufferLineIndicatorSelected",
        },
        exclude_groups = { "NotifyBackground" }, -- table: groups you don't want to clear
      })
    end,
  },

  -- Highlight argument definitions
  {
    "m-demare/hlargs.nvim",
    config = function()
      require("hlargs").setup()
    end,
  },

  -- Toggleterm
  {
    "akinsho/toggleterm.nvim",
    opts = {
      direction = "float",
      float_opts = {
        border = "curved",
      },
    },
    keys = function()
      local Terminal = require("toggleterm.terminal").Terminal
      local lazygit = Terminal:new({
        cmd = "lazygit",
        direction = "float",
        hidden = true,
      })

      local function _lazygit_toggle()
        lazygit:toggle()
      end

      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
      end

      -- if you only want these mappings for toggle term use term://*toggleterm#* instead
      vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

      return {
        { "<leader>ft", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
        { "<leader>gg", _lazygit_toggle, desc = "Lazygit" },
      }
    end,
  },

  -- Tasks
  {
    "jedrzejboczar/toggletasks.nvim",
    keys = function()
      return {
        { "<leader>rr", "<cmd>Telescope toggletasks spawn<cr>", desc = "Toggletasks: Spawn tasks" },
        { "<leader>re", "<cmd>Telescope toggletasks edit<cr>", desc = "Toggletasks: Edit config" },
        { "<leader>rs", "<cmd>Telescope toggletasks select<cr>", desc = "Toggletasks: Select tasks" },
      }
    end,
    config = function()
      require("toggletasks").setup({
        scan = {
          rtp = true,
        },
        toggleterm = {
          direction = "float",
        },
      })
    end,
  },

  -- Winbar GPS
  {
    "utilyre/barbecue.nvim",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    config = true,
  },

  -- Flutter
  {
    "akinsho/flutter-tools.nvim",
  },

  {
    "abecodes/tabout.nvim",
    dependencies = {
      "nvim-treesitter",
      "nvim-cmp",
    },
    config = function()
      require("tabout").setup({
        tabkey = "<Tab>", -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = "<S-Tab>", -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true, -- shift content if tab out is not possible
        act_as_shift_tab = false, -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = "<C-t>", -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = "<C-d>", -- reverse shift default action,
        enable_backwards = true, -- well ...
        completion = true, -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = "`", close = "`" },
          { open = "(", close = ")" },
          { open = "[", close = "]" },
          { open = "{", close = "}" },
          { open = "<", close = ">" },
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {}, -- tabout will ignore these filetypes
      })
    end,
  },

  -- Autopairs
  -- {
  --   "windwp/nvim-autopairs",
  --   config = function()
  --     -- If you want insert `(` after select function or method item
  --     local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  --     local cmp = require("cmp")
  --     cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  --   end,
  --   opts = true,
  -- },

  ---------------
  --- LAZYVIM ---
  ---------------

  -- Customize nvim-cmp keymaps
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ["<C-j>"] = cmp.mapping.select_next_item(),
        ["<C-k>"] = cmp.mapping.select_prev_item(),
      })
    end,
  },

  -- Customize mini animate
  {
    "echasnovski/mini.animate",
    opts = {
      open = { enable = false },
      close = { enable = false },
    },
  },

  -- Customize Bufferline
  {
    "akinsho/bufferline.nvim",
    opts = function(_, opts)
      opts.options.always_show_bufferline = true
    end,
  },

  -- Customize startup
  {
    "goolord/alpha-nvim",
    opts = function(_, opts)
      local logo = [[
                         _                                           
                       _(_)_                          wWWWw   _      
           @@@@       (_)@(_)   vVVVv     _     @@@@  (___) _(_)_    
          @@()@@ wWWWw  (_)\    (___)   _(_)_  @@()@@   Y  (_)@(_)   
           @@@@  (___)     `|/    Y    (_)@(_)  @@@@   \|/   (_)\    
            /      Y       \|    \|/    /(_)    \|      |/      |    
         \ |     \ |/       | / \ | /  \|/       |/    \|      \|/   
         \\|//   \\|///  \\\|//\\\|/// \|///  \\\|//  \\|//  \\\|//  
      ]]

      opts.section.header.val = vim.split(logo, "\n")
    end,
  },

  -- Customize Lazy
  {
    "folke/lazy.nvim",
    opts = {
      ui = {
        border = "curved",
      },
    },
  },

  -- Customize notify
  {
    "rcarriga/nvim-notify",
    opts = {
      background_color = "Normal",
    },
  },

  -- Customize Lualine
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_)
      local icons = require("lazyvim.config").icons

      local function fg(name)
        return function()
          ---@type {foreground?:number}?
          local hl = vim.api.nvim_get_hl_by_name(name, true)
          return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
        end
      end

      return {
        options = {
          theme = "auto",
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
          },
          lualine_x = {
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = fg("Statement")
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = fg("Constant") ,
          },
            { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
            },
          },
          lualine_y = {
            { "progress", separator = "", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            -- function()
            --   return " " .. os.date("%R")
            -- end,
          },
        },
      }
    end,
  },

  -- Configure LazyVim. Load last
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "shado",
      -- colorscheme = "carbonfox",
    },
  },
}
