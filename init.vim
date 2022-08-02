set number
set expandtab 
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smarttab
set mouse=a
set foldcolumn=4
set nowrap
set background=dark

syntax on

call plug#begin('~/.config/nvim/plugged')

Plug 'olimorris/onedarkpro.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'posva/vim-vue'
Plug 's1n7ax/nvim-terminal'
Plug 'p00f/nvim-ts-rainbow'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'vim-scripts/vim-auto-save'
Plug 'preservim/tagbar'
Plug 'xiyaowong/nvim-transparent'
Plug 'Civitasv/cmake-tools.nvim'
Plug 'robert-oleynik/cmake-nvim'

call plug#end()

colorscheme onedarkpro

nmap <C-s> :w!<cr>
nnoremap <F7> :TagbarToggle<CR>
nnoremap <F5> :NERDTreeToggle<CR>
nnoremap <F6> :TerminalVSplit zsh<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

let g:auto_save = 1
let g:auto_save_in_insert_mode = 0
:lua require('nvim-terminal').setup()
lua << END
require("transparent").setup({
  enable = true, -- boolean: enable transparent
  extra_groups = { -- table/string: additional groups that should be cleared
    -- In particular, when you set it to 'all', that means all available groups

    -- example of akinsho/nvim-bufferline.lua
    "BufferLineTabClose",
    "BufferlineBufferSelected",
    "BufferLineFill",
    "BufferLineBackground",
    "BufferLineSeparator",
    "BufferLineIndicatorSelected",
  },
  exclude = {}, -- table: groups you don't want to clear
})
require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'onedark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {'filename'},
    lualine_b = {'filesize'},
    lualine_c = {'branch','diff','diagnostics'},
    lualine_x = {'encoding'},
    lualine_y = {'fileformat'},
    lualine_z = {'filetype'}
  },
  tabline = {},
  extensions = {'nerdtree'}
}
END
