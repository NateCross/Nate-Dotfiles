-- Quick UI
-- https://github.com/skywind3000/vim-quickui
-- Still uses vim script

vim.cmd [[

" TODO: Copy this into its own theme
  let g:quickui_color_scheme = 'papercol_dark'
	let g:quickui_border_style = 3
  
  " clear all the menus
	call quickui#menu#reset()

	" install a 'File' menu, use [text, command] to represent an item.
	call quickui#menu#install('&File', [
    \ [ "&New File\t:new", 'new' ],
    \ [ "&Open\t:e", 'call feedkeys(":e ")' ],
    \ [ "&Close\t:\q", 'q' ],
    \ [ "&Go to directory\t:cd", 'call feedkeys(":cd ")'],
    \ [ "--", '' ],
    \ [ "Open &Fuzzy Finder\t:Telescope find_files", 'Telescope find_files'],
    \ [ "Open File &Browser\t;v", 'NvimTreeToggle'],
    \ [ "--", '' ],
    \ [ "&Save\t:w", 'w'],
    \ [ "Save &As", 'call feedkeys(":w ")' ],
    \ ])

	" items containing tips, tips will display in the cmdline
  call quickui#menu#install('&Edit', [
    \ [ "&Rename\tcr", 'lua vim.lsp.buf.rename()', '' ],
    \ ])
	
	call quickui#menu#install("&Tabs", [
    \ [ "&Next Tab\tgt", 'tabnext' ],
    \ [ "&Previous Tab\tgT", 'tabprevious' ],
    \ [ "New &Tab\t:tabnew", 'tabnew' ],
    \ [ "Open file in new &tab\t:tabe", 'call feedkeys(":tabe ")' ],
    \ ])

	" script inside %{...} will be evaluated and expanded in the string
	call quickui#menu#install("&Option", [
    \ ['Set &Spell %{&spell? "Off":"On"}', 'set spell!'],
    \ ['Set &Cursor Line %{&cursorline? "Off":"On"}', 'set cursorline!'],
    \ ['Set &Paste %{&paste? "Off":"On"}', 'set paste!'],
    \ ])
				
	call quickui#menu#install("&Build", [
    \ ["File &Compile\tF6", 'AsyncTask file-build'],
    \ ["Project &Build\tF7", 'AsyncTask project-build'],
    \ ["File &Execute\tF8", 'AsyncTask file-run'],
    \ ["--", ''],
    \ ["T&ask List", 'call MenuHelp_TaskList()'],
    \ ['E&dit Task', 'AsyncTask -e'],
    \ ['Edit &Global Task', 'AsyncTask -E'],
    \ ['&Stop Building', 'AsyncStop'],
    \ ["--", ''],
    \ ["Close &Quickfix\t:cclose", 'cclose'], 
    \ ])

	" register HELP menu with weight 10000
	call quickui#menu#install('Hel&p', [
    \ ["H&elp Index\t:help", 'call quickui#tools#display_help("index")', ''],
    \ ["Help &Search", 'call feedkeys(":help ")', 'Search for a specific command to find help for.'],
    \ ['T&ips', 'help tips', ''],
    \ ['--',''],
    \ ["&Tutorial", 'help tutor', ''],
    \ ['&Quick Reference', 'help quickref', ''],
    \ ['&Summary', 'help summary', ''],
    \ ])
				
	let g:context_menu_k = [
    \ ["&Peek Definition\tgh", 'call CocActionAsync("doHover")'],
    \ ["S&earch in Project\t\\cx", 'grep <cword> *'],
          \ ["Open &Cheatsheet\t;?", 'Cheatsheet'],
    \ [ "--", ],
    \ [ "Find &Definition\t\gd", 'call feedkeys("\gd")', 'CoC Find Definition'],
    \ [ "Find &Symbol\t\\cs", 'call MenuHelp_Fscope("s")', 'GNU Gloal search s'],
    \ [ "Find C&alling\t\\cc", 'call MenuHelp_Fscope("c")', 'GNU Global search c'],
    \ [ "Find &From Ctags\t\\cz", 'call MenuHelp_Fscope("z")', 'GNU Global search c'],
    \ [ "--", ],
    \ [ "Goto D&efinition\t(YCM)", 'YcmCompleter GoToDefinitionElseDeclaration'],
    \ [ "Goto &References\t(YCM)", 'YcmCompleter GoToReferences'],
    \ [ "Get D&oc\t(YCM)", 'YcmCompleter GetDoc'],
    \ [ "Get &Type\t(YCM)", 'YcmCompleter GetTypeImprecise'],
    \ [ "--", ],
    \ ['Dash &Help', 'call asclib#utils#dash_ft(&ft, expand("<cword>"))'],
    \ ['Cpp&man', 'exec "Cppman " . expand("<cword>")', '', 'c,cpp'],
    \ ['P&ython Doc', 'call quickui#tools#python_help("")', 'python'],
    \ ]

	" enable to display tips in the cmdline
	let g:quickui_show_tip = 1

]]