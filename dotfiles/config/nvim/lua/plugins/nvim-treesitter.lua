-- Notes
-- Needs ts rainbow highlight for the brackets

require'nvim-treesitter.configs'.setup {
  ensure_installed = {}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  indent = {
    enable = true,
    disable = { "python", "py", "c", "cpp" },
  },
  highlight = {
	enable = true,              -- false will disable the whole extension
	disable = {},  -- list of language that will be disabled
	-- Setting this to true will run `:h syntax` and tree-sitter at the same time.
	-- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
	-- Using this option may slow down your editor, and you may see some duplicate highlights.
	-- Instead of true it can also be a list of languages
	additional_vim_regex_highlighting = false,
  },
  
  -- Requires 
  -- https://github.com/p00f/nvim-ts-rainbow
  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  }
}
