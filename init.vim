call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'majutsushi/tagbar'
Plug 'pangloss/vim-javascript'
Plug 'Shougo/deoplete.nvim'
Plug 'carlitux/deoplete-ternjs'
Plug 'jacoborus/tender'
Plug 'craigemery/vim-autotag'
Plug 'codelibra/log4jhighlighter'
Plug 'sidorares/node-vim-debugger'
Plug 'terryma/vim-multiple-cursors'
Plug 'w0rp/ale'
Plug 'cloudhead/neovim-fuzzy'
Plug 'wellsjo/vim-save-cursor-position'
Plug 'zanglg/nova.vim'
Plug 'thinca/vim-visualstar'
Plug 'airblade/vim-gitgutter'
call plug#end()

" Colorschemes
" set termguicolors
" colorscheme MountainDew
" colorscheme molokai

" tender
" set termguicolors
" colorscheme tender
" set background=dark

" Dark
" colorscheme 0x7A69_dark
" set background=dark

" set termguicolors
" colorscheme solarized

set termguicolors
colorscheme nova
set background=dark

highlight Cursorline ctermfg=white ctermbg=red
highlight CursorColumn ctermfg=white ctermbg=red

" highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

"clipboard
set clipboard=unnamed

" Appearance
set number " line numbers
set wrap
set textwidth=0 wrapmargin=0
set linebreak
set nolist
set ruler
set showcmd
set colorcolumn=120

" As you go substitution
set inccommand=split

" Rebinds
let mapleader = "\<Space>"
nnoremap <leader>e :Explore<CR>
nnoremap <leader>v :vsplit<CR>
nnoremap <leader>s :split<CR>
nnoremap <leader>t :TagbarToggle<CR>
nnoremap <leader>n :NERDTreeToggle<CR>
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>
" Window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" nvim terminal mode stuff
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
" json pretty print
command! -range -nargs=0 -bar JsonTool <line1>,<line2>!python -m json.tool
nnoremap <leader>j :JsonTool<CR>

set tabstop=3 shiftwidth=3 expandtab
set ignorecase
set smartcase
let g:terminal_scrollback_buffer_size = 10000

let $NVIM_TUI_ENABLE_CURSOR_SHAPE=1

" ale
let g:ale_linters = {
         \   'javascript': ['eslint'],
         \   'yaml': ['yamllint'],
         \}
let g:ale_sign_column_always = 1
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

" Airline
autocmd VimEnter * AirlineToggleWhitespace
let g:airline#extensions#tagbar#enabled = 1
let g:airline_section_y = '%{ALEGetStatusLine()}'

" Use deoplete.
let g:deoplete#enable_at_startup = 1
