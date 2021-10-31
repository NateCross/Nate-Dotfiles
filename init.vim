" Nate's vim config
" Install me first: https://github.com/junegunn/vim-plug

" For some reason this only works if I put it up here
let mapleader = ";"

"Helper function to check conditions; for VSCode
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin('~/AppData/Local/nvim/plugged') 

if !exists('g:vscode')
	Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
	Plug 'ryanoasis/vim-devicons'
    "Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'neoclide/coc.nvim', {'branch': 'feat/use-ts-hi-group', 'do': 'yarn install --frozen-lockfile'}
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

	"Preferred color scheme; should be customized
	Plug 'mangeshrex/uwu.vim'
    Plug 'ldelossa/vimdark'
	
    "Plug 'mhinz/vim-startify'
	
    "Dashboard plugin config
    Plug 'glepnir/dashboard-nvim'
    let g:dashboard_default_executive ='fzf'
    nmap <Leader>ss :<C-u>SessionSave<CR>
    nmap <Leader>sl :<C-u>SessionLoad<CR>
    nmap <Leader>cn :<C-u>DashboardNewFile<CR>
    nnoremap <silent> <Leader>fh :History<CR>
    nnoremap <silent> <Leader>ff :Files<CR>
    nnoremap <silent> <Leader>tc :Colors<CR>
    nnoremap <silent> <Leader>fa :Rg<CR>
    nnoremap <silent> <Leader>fb :Marks<CR>

	Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'
	Plug 'vim-airline/vim-airline'
	Plug 'jiangmiao/auto-pairs'
    
    " Git management
    Plug 'tpope/vim-fugitive'
    
    " Git blame
    Plug 'f-person/git-blame.nvim'

    " Auto restore previous sessions
    Plug 'rmagatti/auto-session'

    " Alt file manager, using vifm
    Plug 'vifm/vifm.vim'

    " Colorize hex colors
    Plug 'norcalli/nvim-colorizer.lua'

    " Quickly surround text for brackets, parentheses, etc
    Plug 'blackcauldron7/surround.nvim'

    " Peek at register with double quotes 
    Plug 'gennaro-tedesco/nvim-peekup'
    
    " Highlight same words and lines as cursor
    Plug 'yamatsum/nvim-cursorline'

    " Better wildmenu
    Plug 'gelguy/wilder.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'roxma/nvim-yarp'
    Plug 'roxma/vim-hug-neovim-rpc'

     " Vim autosaver
    Plug 'Pocco81/AutoSave.nvim'

    " Todo highlighter
    Plug 'nvim-lua/plenary.nvim'
    Plug 'folke/todo-comments.nvim'

    " Autoread fixer
    Plug 'TheZoq2/neovim-auto-autoread'
    
    " Shows markdown through glow
    Plug 'ellisonleao/glow.nvim'

    " Allows you to follow links in markdown
    Plug 'jakewvincent/mkdnflow.nvim'

    " Smooth scrolling
    Plug 'karb94/neoscroll.nvim'

    " Treesitter for syntax highlight
    " We recommend updating the parsers on update
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  

    " Treesitter, autoclose html tags
    Plug 'windwp/nvim-ts-autotag'
endif

Plug 'preservim/nerdcommenter'
Plug 'junegunn/vim-easy-align'

" Plug 'asvetliakov/vim-easymotion'
" inside plug#begin:
" use normal easymotion when in vim mode
Plug 'easymotion/vim-easymotion', Cond(!exists('g:vscode'))
" use vscode easymotion when in vscode mode
Plug 'asvetliakov/vim-easymotion', Cond(exists('g:vscode'), { 'as': 'vsc-easymotion' })

" Pop up for key guides
Plug 'folke/which-key.nvim'

call plug#end()

" Lua setup

lua << EOF
  require('which-key').setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF

lua << EOF
    require("todo-comments").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
    }
EOF

lua << EOF
	require('neoscroll').setup({
		-- All these keys will be mapped to their corresponding default scrolling animation
		mappings = {'<C-u>', '<C-d>', '<C-b>', '<C-f>',
					'<C-y>', '<C-e>', 'zt', 'zz', 'zb'},
		hide_cursor = true,          -- Hide cursor while scrolling
		stop_eof = true,             -- Stop at <EOF> when scrolling downwards
		use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
		respect_scrolloff = false,   -- Stop scrolling when the cursor reaches the scrolloff margin of the file
		cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
		easing_function = nil,        -- Default easing function
		pre_hook = nil,              -- Function to run before the scrolling animation starts
		post_hook = nil,              -- Function to run after the scrolling animation ends
	})
EOF

lua << EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c", "cpp"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  ignore_install = {}, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = {},  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

lua << EOF
local autosave = require("autosave")

autosave.setup(
    {
        enabled = true,
        execution_message = "AutoSave: saved at " .. vim.fn.strftime("%H:%M:%S"),
        events = {"InsertLeave", "TextChanged"},
        conditions = {
            exists = true,
            filename_is_not = {},
            filetype_is_not = {},
            modifiable = true
        },
        write_all_buffers = false,
        on_off_commands = true,
        clean_command_line_interval = 0,
        debounce_delay = 135
    }
)
EOF

lua require('nvim-ts-autotag').setup()

if !exists('g:vscode')
    lua require"surround".setup{}
endif

"Vim Config stuff
if !exists('g:vscode')
	colorscheme vimdark
    set noswapfile
    set ignorecase
    set number
    set showmatch
    set mouse=v
    set hlsearch
    set tabstop=4
    set softtabstop=4
    set expandtab
    set shiftwidth=4
    set autoindent
    "set wildmenu
    set wildmode=longest,list
    set cc=80
    set mouse=a
    set clipboard=unnamedplus
    set nocursorline
    set backup
    set backupdir=D:\\VimTemp
    set relativenumber
	set autoread

    "Press i to enter insert mode, and ii to exit insert mode.
    inoremap ii <Esc>
    inoremap jk <Esc>
    inoremap kj <Esc>
    vnoremap ii <Esc>
    "vnoremap kj <Esc>
    
    "Open chadtree   
    nnoremap <leader>v <cmd>CHADopen<cr>

    "Move lines up and down by alt+j/k
    inoremap <A-j> <Esc>:m .+1<CR>==gi
    inoremap <A-k> <Esc>:m .-2<CR>==gi
    vnoremap <A-j> :m '>+1<CR>gv=gv
    vnoremap <A-k> :m '<-2<CR>gv=gv

    "COC Config
    inoremap <silent><expr> <c-space> coc#refresh()

    " gd - go to definition of word under cursor
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)

    " gi - go to implementation
    nmap <silent> gi <Plug>(coc-implementation)

    " gr - find references
    nmap <silent> gr <Plug>(coc-references)

    " gh - get hint on whatever's under the cursor
    "nnoremap <silent> K :call <SID>show_documentation()<CR>
    "nnoremap <silent> gh :call <SID>show_documentation()<CR>
    
    " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
    " delays and poor user experience.
    set updatetime=300    

    " Use <c-space> to trigger completion.
    if has('nvim')
         inoremap <silent><expr> <c-space> coc#refresh()
    else
         inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Remap <C-f> and <C-b> for scroll float windows/popups.
    if has('nvim-0.4.0') || has('patch-8.2.0750')
      nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
      inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
      inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
      vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    endif

    " Do default action for next item.
    nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item.
    nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>

    " Use ctrl+j and ctrl+k to navigate completion 
    inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<Tab>"
    inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<S-Tab>"
    
    " ;cr to rename the current word in the cursor
    nmap <leader>cr  <Plug>(coc-rename)
    nmap <leader>cf  <Plug>(coc-format-selected)
    vmap <leader>cf  <Plug>(coc-format-selected)

    " Open CHADtree on startup
    " autocmd vimenter * CHADopen
    
    " C/CPP Dev Stuff
    " TODO: USE THE COMMANDS HERE:
    " https://www.youtube.com/watch?v=I4Rz0qoWYBIkl
    let g:c_syntax_for_h = 1

    " wilder setup, see wilder github page
    call wilder#setup({
      \ 'modes': [':', '/', '?'],
      \ 'next_key': '<Tab>',
      \ 'previous_key': '<S-Tab>',
      \ 'accept_key': '<Up>',
      \ 'reject_key': '<Down>',
      \ })
    
    " 'highlighter' : applies highlighting to the candidates
    call wilder#set_option('renderer', wilder#popupmenu_renderer({
      \ 'highlighter': wilder#basic_highlighter(),
      \ 'left': [
      \   ' ', wilder#popupmenu_devicons(),
      \ ],
      \ 'right': [
      \   ' ', wilder#popupmenu_scrollbar(),
      \ ],
      \ }))
	
	"let g:auto_session_root_dir = "C:\Users\Pc\AppData\Local\nvim\sessions"
    
    " Auto set working directory to wherever file is
    autocmd BufEnter * silent! lcd %:p:h
else
	set clipboard=unnamedplus
endif

"Both vscode and nvim

"Keybinds

"Ctrl+/ to clear last search highlight
nnoremap <silent> <Esc><Esc> :let @/=""<CR>

" Enter to insert line below; \Enter to insert above
map <Enter> o<ESC>
map \<Enter> O<ESC>

" F1 to reset vimrc
map <f1> :so $MYVIMRC<CR>
" F2 to save file
map <f2> :w<CR>

" alt+H/L to go beginning/end of line
nmap <A-h> ^
nmap <A-l> $

"Aliases
"
"Allows to :cd $github for easy access
let $github = "~\\Documents\\GitHub"
"Type :e $init for easy config access
let $init = "~\\AppData\\Local\\nvim\\init.vim"
