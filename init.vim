"Nate's vim config

" For some reason this only works if I put it up here
let mapleader = ";"

"Helper function to check conditions; for VSCode
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

call plug#begin('C:/Users/Pc/AppData/Local/nvim/plugged') 

if !exists('g:vscode')
	Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'}
	Plug 'ryanoasis/vim-devicons'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
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
	set wildmode=longest,list
	set cc=80
	set mouse=a
	set clipboard=unnamedplus
	set cursorline
    set backup
    set backupdir=D:\\VimTemp
    set relativenumber

    "Press i to enter insert mode, and ii to exit insert mode.
    inoremap ii <Esc>
    inoremap jk <Esc>
    inoremap kj <Esc>
    vnoremap jk <Esc>
    vnoremap kj <Esc>
    
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
let $github = "C:\\Users\\Pc\\Documents\\GitHub"
"Type :e $init for easy config access
let $init = "C:\\Users\\Pc\\AppData\\Local\\nvim\\init.vim"

