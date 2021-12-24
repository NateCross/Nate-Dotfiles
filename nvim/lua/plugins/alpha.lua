-- Alpha
-- https://github.com/goolord/alpha-nvim

local alpha = require'alpha'
local dashboard = require'alpha.themes.dashboard'
    dashboard.section.header.val = {
     [[	                _                                           ]],
     [[               _(_)_                          wWWWw   _      ]],
     [[   @@@@       (_)@(_)   vVVVv     _     @@@@  (___) _(_)_    ]],
     [[  @@()@@ wWWWw  (_)\    (___)   _(_)_  @@()@@   Y  (_)@(_)   ]],
     [[   @@@@  (___)     `|/    Y    (_)@(_)  @@@@   \|/   (_)\    ]],
     [[    /      Y       \|    \|/    /(_)    \|      |/      |    ]],
     [[ \ |     \ |/       | / \ | /  \|/       |/    \|      \|/   ]],
     [[ \\|//   \\|///  \\\|//\\\|/// \|///  \\\|//  \\|//  \\\|//  ]],
    }

dashboard.section.footer.val = "☆.。.:*・°☆.。.:*・°"

-- Menu
dashboard.section.buttons.val = {
    dashboard.button( "e", "  > New file" , ":ene <BAR> startinsert <CR>"),
    dashboard.button( "f", "  > Find file", ":cd ~/ | :Telescope find_files<CR>"),
    -- Change the following setting to wherever Github files are
    dashboard.button( "g", "  > Find in Github directory", ":cd ~/Documents/Github | Telescope find_files<CR>"),
    dashboard.button( "r", "  > Recent"   , ":Telescope oldfiles<CR>"),
    dashboard.button( "s", "  > Settings" , ":e $MYVIMRC<CR>"),
    dashboard.button( "q", "  > Quit NVIM", ":qa<CR>"),
},

alpha.setup(dashboard.opts)
