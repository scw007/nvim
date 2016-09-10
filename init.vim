call plug#begin()
Plug 'neomake/neomake'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'pangloss/vim-javascript'
Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs'
Plug 'scrooloose/nerdtree'
call plug#end()

" Colorschemes
" set termguicolors
colorscheme 0x7A69_dark
" colorscheme one 
" colorscheme MountainDew 
" colorscheme molokai

" Appearance
set background=dark
set number " line numbers
set wrap
set textwidth=0 wrapmargin=0
set linebreak
set nolist
set ruler
set showcmd

" Functionality
let mapleader = "\<Space>" 
nnoremap <leader>e :Explore<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

set tabstop=3 shiftwidth=3 expandtab

" Neomake
let g:neomake_javascript_enabled_makers = ['jshint']
autocmd! BufWritePost * Neomake

" Airline
autocmd VimEnter * AirlineToggleWhitespace
let g:airline#extensions#tagbar#enabled = 1
let g:airline_section_y = ''

" Use deoplete.
let g:deoplete#enable_at_startup = 1
