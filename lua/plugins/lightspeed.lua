-- Lightspeed
-- https://github.com/ggandor/lightspeed.nvim

require'lightspeed'.setup {
  exit_after_idle_msecs = { labeled = 1500, unlabeled = 1000 },

  -- s/x
  grey_out_search_area = true,
  highlight_unique_chars = true,
  match_only_the_start_of_same_char_seqs = true,
  jump_on_partial_input_safety_timeout = 400,
  substitute_chars = { ['\r'] = '¬' },
  -- Leaving the appropriate list empty effectively disables
  -- "smart" mode, and forces auto-jump to be on or off.
  -- safe_labels = { ... },
  safe_labels = {
    "s", "f", "n",
    "u", "t",
    "/", "S", "F", "L", "N", "H", "G", "M", "U", "T", "?", "Z"
  },
  -- labels = { ... },
  labels = {
    "s", "f", "n",
    "j", "k", "l", "o", "i", "w", "e", "h", "g",
    "u", "t",
    "m", "v", "c", ";", "a", ".", "z",
    "/", "S", "F", "L", "N", "H", "G", "M", "U", "T", "?", "Z"
  },
  cycle_group_fwd_key = '<space>',
  cycle_group_bwd_key = '<tab>',
  
  -- The option below is, apparently, deprecated
  -- x_mode_prefix_key = '<c-x>',

  -- f/t
  limit_ft_matches = 4,
  instant_repeat_fwd_key = nil,
  instant_repeat_bwd_key = nil,
}