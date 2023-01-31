-- every spec file under config.plugins will be loaded automatically by lazy.nvim
--
-- In your plugin files, you can:
-- * add extra plugins
-- * disable/enabled LazyVim plugins
-- * override the configuration of LazyVim plugins
return {

  -- Colorscheme
  -- https://github.com/EdenEast/nightfox.nvim
  {
    "EdenEast/nightfox.nvim",
    config = function()
      require("nightfox").setup({
        options = {
          transparent = true,
        },
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
      -- opts.section.header.val = {
      --   [[                 _                                           ]],
      --   [[               _(_)_                          wWWWw   _      ]],
      --   [[   @@@@       (_)@(_)   vVVVv     _     @@@@  (___) _(_)_    ]],
      --   [[  @@()@@ wWWWw  (_)\    (___)   _(_)_  @@()@@   Y  (_)@(_)   ]],
      --   [[   @@@@  (___)     `|/    Y    (_)@(_)  @@@@   \|/   (_)\    ]],
      --   [[    /      Y       \|    \|/    /(_)    \|      |/      |    ]],
      --   [[ \ |     \ |/       | / \ | /  \|/       |/    \|      \|/   ]],
      --   [[ \\|//   \\|///  \\\|//\\\|/// \|///  \\\|//  \\|//  \\\|//  ]],
      -- }
    end,
  },

  -- Configure LazyVim. Load last
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "carbonfox",
    },
  },
}
