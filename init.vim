" INIT.VIM
"{{{ Base
set relativenumber number
set hidden
set path+=$PWD/**
set undofile
set foldmethod=marker
set foldlevel=100
set nrformats+=alpha
set ignorecase smartcase
set wrapscan
set noexpandtab
let mapleader="\<Space>"
let g:netrw_keepdir = 0
set splitbelow
filetype plugin indent on
nnoremap <leader>d :Explore<CR>
set hlsearch
nnoremap <esc><esc> :nohlsearch<CR><esc>
set grepprg=rg\ --vimgrep\ --smart-case\ --follow
cnoreabbrev clip !xclip -selection clipboard
nnoremap <Leader>gt :read ~/source/creds/gitTok.catable<CR>
"{{{ init.vim
nnoremap <silent> <Leader>ev :edit /home/rp152k/.config/nvim/init.vim<CR>
nnoremap <silent> <Leader>el :edit /home/rp152k/.config/nvim/lua/init.lua<CR>
nnoremap <silent> <Leader>esv :source /home/rp152k/.config/nvim/init.vim<CR>
nnoremap <silent> <Leader>esl :source /home/rp152k/.config/nvim/lua/init.lua<CR>
vnoremap <silent> <Leader>es :'<,'>source<CR>
"}}}
"{{{ Tabs
nnoremap <leader>te :tabe<CR>
nnoremap <leader>tc :tabc<CR>
nnoremap <leader>tn :tabn<CR>
nnoremap <leader>tp :tabp<CR>
nnoremap <leader>t :<C-U>tabnext <C-R>=input("Enter tab number: ")<CR><CR>
"}}}
"{{{ Terminal 
tnoremap <C-W> <C-\><C-n><C-W>
"}}}
"}}}
"{{{ Plugs
call plug#begin('~/.local/share/nvim/plugged')
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope.nvim', { 'branch': '0.1.x' }
Plug 'frazrepo/vim-rainbow'
Plug 'junegunn/vim-peekaboo'
Plug 'simnalamburt/vim-mundo'
Plug 'tpope/vim-surround'
Plug 'itchyny/lightline.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'L3MON4D3/LuaSnip'
Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}
Plug 'EdenEast/nightfox.nvim'
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }
Plug 'tpope/vim-eunuch'
Plug 'NeogitOrg/neogit'
Plug 'hylang/vim-hy'
Plug 'jpalardy/vim-slime'
call plug#end()
"}}}
"{{{ Plug-Config
"{{{ vim-hy
let g:hy_enable_conceal = 1
"}}}
"{{{ Telescope
nnoremap <leader>ffc <cmd>Telescope find_files<CR>
nnoremap <leader>ffs <cmd>Telescope find_files cwd=~/source/<CR>
nnoremap <leader>fp <cmd>Telescope file
nnoremap <leader>fg <cmd>Telescope live_grep<CR>
nnoremap <leader>fb <cmd>Telescope buffers<CR>
nnoremap <leader>fh <cmd>Telescope help_tags<CR>
"}}}
"{{{ Neogit
nnoremap <leader>gg :Neogit<CR>
"}}}
"{{{ Vim-Slime
let g:slime_target="neovim"
"}}}
"{{{ LSP-zero
nnoremap <leader>lf :LspZeroFormat<CR>
nnoremap <leader>li :LspInfo<CR>
nnoremap <leader>lr :LspRestart<CR>
nnoremap <leader>l1 :LspStart<CR>
nnoremap <leader>l0 :LspStop<CR>
"}}}
"{{{ codeium
imap <script><silent><nowait><expr> <C-g> codeium#Accept()
"}}}
"{{{ Mason
nnoremap <leader>pm :Mason<CR>
"}}}
"{{{ Rainbow
let g:rainbow_active = 1 
"}}}
"{{{ Mundo
nnoremap <leader>m :MundoToggle<CR>
" }}} 
"Statusline{{{
set laststatus=2
set noshowmode
let g:lightline = {
            \ 'colorscheme': 'powerlineish',
            \ }
"}}}
"{{{ colorscheme
colorscheme carbonfox
nnoremap <leader>c0 :colorscheme carbonfox<CR>
nnoremap <leader>c1 :colorscheme zellner<CR>
nnoremap <leader>cs :colorscheme 
"}}}
"}}}
"{{{ Au Bufs
"{{{ Python
augroup PythonBufs
    autocmd!
    autocmd FileType python,hy setlocal foldmethod=indent foldlevel=1
augroup END
"}}}
"{{{ Markdown
augroup MarkdownBufs
    autocmd!
    autocmd FileType markdown setlocal spell wrap foldmethod=indent
augroup END
"}}}
"}}}
"{{{ Lua require
lua require("init")
"}}}
