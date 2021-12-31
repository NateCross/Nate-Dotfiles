local windline = require('windline')
windline.setup({
  statuslines = {
    -- require('wlsample.basic')
    -- require('wlsample.bubble2')
    require('wlsample.airline')
    --- you need to define your status lines here

  }
})

-- local default = {
--     filetypes={'default'},
--     active={
--       --- components...
--     },
--     inactive={
--       --- components...
--     }
-- }
--
-- local explorer = {
--     filetypes = {'fern', 'NvimTree','netrw'},
--     active = {
--         {'  ', {'white', 'black'} },
--     },
--     --- show active components when the window is inactive
--     always_active = true,
--     --- It will display a last window statusline even that window should inactive
--     show_last_status = true,
--
--     -- setting for floatline
--     -- display statusline to that filetype.If that filetype on floating window
--     floatline_show_float = false,
--     -- display both on floatline and default statusline
--     floatline_show_both = false
-- }
