call plug#begin()
Plug 'pseewald/vim-anyfold'
Plug 'tpope/vim-commentary'
Plug 'Konfekt/FastFold'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'w0rp/ale'
Plug 'cloudhead/neovim-fuzzy'
Plug 'wellsjo/vim-save-cursor-position'
Plug 'zanglg/nova.vim'
Plug 'thinca/vim-visualstar'
Plug 'airblade/vim-gitgutter'
Plug 'lervag/vimtex'
" Plug 'kana/vim-textobj-fold'
" Plug 'vimlab/mdown.vim', { 'do': 'npm install' }
Plug 'Shougo/deoplete.nvim'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'eapache/rainbow_parentheses.vim'
Plug 'chrisbra/csv.vim'
Plug 'michaeljsmith/vim-indent-object'

" Javascript/NodeJS
Plug 'pangloss/vim-javascript'
Plug 'carlitux/deoplete-ternjs'
" Plug 'jacoborus/tender'
Plug 'craigemery/vim-autotag'
" Plug 'sidorares/node-vim-debugger'
" Plug 'neovim/node-host', { 'do': 'npm install' }

" Typescript
" Plug 'leafgarland/typescript-vim'

" Golang
Plug 'fatih/vim-go'
" Plug 'zchee/deoplete-go'
Plug 'jodosha/vim-godebug'
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
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
" colorscheme jellybeans
set background=dark

highlight Cursorline ctermfg=white ctermbg=red
highlight CursorColumn ctermfg=white ctermbg=red
highlight Search guibg='Purple' guifg='NONE'

" highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\ "|\t/
"clipboard
set clipboard=unnamed

" Appearance
set cmdheight=2
set number " line numbers
set wrap
set textwidth=0 wrapmargin=0
set linebreak
set nolist
set ruler
set showcmd
set colorcolumn=100

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
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>b :bnext<CR>
nnoremap <Leader>p :bprevious<CR>
nnoremap <Leader>g :tabnext<CR>

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

set expandtab
set shiftwidth=4
set tabstop=3
au FileType javascript setl shiftwidth=3

set ignorecase
set smartcase
let g:terminal_scrollback_buffer_size = 10000

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
		  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
		  \,sm:block-blinkwait175-blinkoff150-blinkon175

set mouse=a

" ale
let g:ale_fixers = {
         \   'javascript': ['eslint']
         \}
let g:ale_linters = {
         \   'typescript': ['eslint, tsserver'],
         \   'javascript': ['eslint'],
         \   'go': ['vet', 'gometalinter', 'ineffassign']
         \}
let g:ale_go_gometalinter_options = '
            \ --aggregate
            \ --fast
            \ --sort=line
            \ --tests
            \ --vendor
            \ '
" '
" let g:ale_lint_on_text_changed = 0
let g:ale_fix_on_save = 1
" let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

" Airline
autocmd VimEnter * AirlineToggleWhitespace
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

let g:airline#extensions#tagbar#enabled = 1
let g:airline_theme='dark'

" Use deoplete.
let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources#go#gocode_binary = '/Users/stevenwhitehead/gocode'
let g:python3_host_prog = '/usr/local/bin/python3'

" go stuff
let g:go_fmt_command = "goimports" " auto format imports
" let g:go_auto_type_info = 1 " type info in status line
let g:go_list_type = "quickfix"
" go linter stuff
let g:go_metalinter_enabled = ['vet', 'golint', 'deadcode', 'errcheck', 'goconst',
                              \ 'gosimple', 'ineffassign', 'interfacer',
                              \ 'staticcheck', 'structcheck', 'unconvert', 'varcheck', 'vetshadow'
                              \  ]
" let g:go_auto_sameids = 1
" go highlight extras
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
" let g:go_fold_enable = ['block', 'import', 'varconst', 'package_comment']
let g:go_fmt_experimental = 1
" set foldmethod=syntax
" set foldmethod=manual
" set foldmethod=indent
" set foldlevelstart=99
" set foldmethod=marker
" set foldmarker={,}
" set foldlevel=1
" set viewoptions=cursor,folds,slash,unix
" let g:go_fmt_fail_silently = 1
au FileType go nmap <F9> :GoCoverageToggle -short<cr>

" anyfold
" let anyfold_activate=1
" set foldlevel=9999
" set foldlevelstart=999999

" rainbow
" let g:rainbow_active = 1
let g:rbpt_colorpairs = [
    \ ['brown',       'SeaGreen3'],
    \ ['gray',        'firebrick3'],
    \ ['cyan',        'DarkOrchid3'],
    \ ]
au VimEnter * RainbowParenthesesToggle
au Syntax * RainbowParenthesesLoadRound
au Syntax * RainbowParenthesesLoadSquare
au Syntax * RainbowParenthesesLoadBraces

"" stuff i stole from joachim
" --------------------------
" Strip Trailing White Space
" --------------------------
" Deleting trailing whitespace
" From http://vimbits.com/bits/377
" Preserves/Saves the state, executes a command, and returns to the saved
function! Preserve(command)
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  execute a:command
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction
"strip all trailing white space
function! StripTrailingWhiteSpace()
  call Preserve("%s/\\s\\+$//e")
endfunction

set splitbelow " New splits open below and right
set splitright
set fillchars=vert:\│  " No character in split separator
set showmode
"
" Strip trailing white space
nmap <silent> <leader>w :call StripTrailingWhiteSpace() <CR>

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


