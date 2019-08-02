call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/ScrollColors' " test colorchemes with :SCROLL
Plug 'w0rp/ale'
" Plug 'cloudhead/neovim-fuzzy'
Plug 'wellsjo/vim-save-cursor-position'
Plug 'zanglg/nova.vim'
Plug 'thinca/vim-visualstar'
Plug 'airblade/vim-gitgutter'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': './install.sh'}
Plug 'Shougo/echodoc.vim',
" Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'eapache/rainbow_parentheses.vim'
Plug 'Shougo/denite.nvim'

" Javascript/NodeJS
Plug 'pangloss/vim-javascript'
" Plug 'carlitux/deoplete-ternjs'

" Golang
Plug 'fatih/vim-go'
" Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'jodosha/vim-godebug'
Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
call plug#end()

colorscheme lucario

highlight Pmenu ctermbg=black
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
nnoremap <Leader>b :bnext<CR>
nnoremap <Leader>p :bprevious<CR>
nnoremap <Leader>g :tabnext<CR>
nnoremap <Leader>r :GoReferrers<CR>

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
" command! -range -nargs=0 -bar JsonTool <line1>,<line2>!python -m json.tool
" nnoremap <leader>j :JsonTool<CR>

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

" set foldmethod=indent
" set foldmethod=syntax

set shortmess=a

" ale
let g:ale_fixers = {
         \   'javascript': ['eslint']
         \}

         " \   'go': ['govet', 'gometalinter']
let g:ale_linters = {
         \   'typescript': ['eslint, tsserver'],
         \   'javascript': ['eslint'],
         \   'go': ['gometalinter']
         \}

let g:ale_go_gometalinter_options = "
            \ --disable-all --deadline=5s
            \ --vendor
            \ --linter='gofmt:gofmt -s -e:^(?P<path>.*?\.go)$' --enable=gofmt
            \ --linter='gocyclo:gocyclo -over 10:^(?P<cyclo>\d+)\s+\S+\s(?P<function>\S+)\s+(?P<path>.*?\.go):(?P<line>\d+):(\d+)$' --enable=gocyclo
            \ --linter='goconst:goconst -min-occurrences 3 -min-length 4:PATH:LINE:COL:MESSAGE' --enable=goconst
            \ --linter='golint:golint -set_exit_status:PATH:LINE:COL:MESSAGE' --enable=golint
            \ --linter='ineffassign:ineffassign -n:PATH:LINE:COL:MESSAGE' --enable=ineffassign
            \ --linter='varcheck:varcheck:^(?:[^:]+: )?(?P<path>.*?\.go):(?P<line>\d+):(?P<col>\d+):\s*(?P<message>.*)$' --enable=varcheck
            \ --linter='errcheck:errcheck -ignoretests:PATH:LINE:COL:MESSAGE' --enable=errcheck
            \ --linter='lll:lll --maxlength 100 -g:PATH:LINE:MESSAGE' --enable=lll
            \ "

let g:ale_fix_on_save = 1
let g:ale_lint_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '⬥ ok']

" Airline
autocmd VimEnter * AirlineToggleWhitespace
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_c = '%t'
let g:airline#extensions#tagbar#enabled = 1
let g:airline_theme='dark'
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Use deoplete.
" let g:deoplete#enable_at_startup = 1
" let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const'] " this starts the crashess
" let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
" let g:deoplete#sources#go#builtin_objects = 1

set completeopt+=noselect

let g:python3_host_prog = '/usr/local/bin/python3'

" go stuff
let g:go_fmt_command = "goimports" " auto format imports
" let g:go_auto_type_info = 1 " type info in status line
set updatetime=100
let g:go_list_type = "quickfix"
let g:go_statusline_show = 1
" let g:go_auto_sameids = 1
" go highlight extras
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_fmt_experimental = 1
" let g:go_fmt_fail_silently = 1

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

let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_hi_surround_always = 1

" Denite
" nmap ; :Denite buffer -split=floating -winrow=1<CR>
