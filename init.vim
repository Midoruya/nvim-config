set number
set expandtab 
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set mouse=a
set foldcolumn=4

syntax on

call plug#begin('~/AppData/Local/nvim/pluged')

Plug 'navarasu/onedark.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'posva/vim-vue'

call plug#end()
colorscheme onedark

nmap <C-s> :w!<cr>

nnoremap <F5> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
