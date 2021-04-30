call plug#begin()
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'flazz/vim-colorschemes'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'wellsjo/vim-save-cursor-position'
Plug 'thinca/vim-visualstar'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Shougo/echodoc.vim',
Plug 'chrisbra/Colorizer'
Plug 'eapache/rainbow_parentheses.vim'
Plug 'hashivim/vim-terraform'
" Plug 'Shougo/denite.nvim'
Plug 'lervag/vimtex'
" " Javascript/NodeJS
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" " Golang
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" " Plug 'jodosha/vim-godebug'
" Plug 'mdempsky/gocode', { 'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh' }
call plug#end()


" Color stuff
colorscheme lucario
highlight Pmenu ctermbg=black
highlight Cursorline ctermfg=white ctermbg=black
highlight CursorColumn ctermfg=white ctermbg=black
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
nnoremap <Leader>i :set foldmethod=indent<CR>
nmap <silent> gi :GoInfo<CR>

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

set expandtab
set shiftwidth=4
set tabstop=3

set ignorecase
set smartcase
let g:terminal_scrollback_buffer_size = 10000

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
		  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
		  \,sm:block-blinkwait175-blinkoff150-blinkon175

set mouse=a

set shortmess=a

" Airline
autocmd VimEnter * AirlineToggleWhitespace
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline_section_c = '%t'
let g:airline#extensions#tagbar#enabled = 1
let g:airline_theme='dark'
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'


" coc.vim

" if hidden is not set, TextEdit might fail.
set hidden
" Better display for messages
set cmdheight=3
" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300
" don't give |ins-completion-menu| messages.
set shortmess+=c
" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
" inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" function! s:check_back_space() abort
"   let col = col('.') - 1
"   return !col || getline('.')[col - 1]  =~# '\s'
" endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[c` and `]c` to navigate diagnostics
" nmap <silent> [c <Plug>(coc-diagnostic-prev)
" nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
" nmap <silent> gy <Plug>(coc-type-definition)
" nmap <silent> gi <Plug>(coc-implementation)
" nmap <silent> gr <Plug>(coc-references)

" Use U to show documentation in preview window
" nnoremap <silent> U :call <SID>show_documentation()<CR>

" Remap for rename current word
" nmap <leader>rn <Plug>(coc-rename)
"

" Remap for format selected region
" vmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)
" Show all diagnostics
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Find symbol of current document
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>

" command! -nargs=? Fold :call     CocAction('fold', <f-args>)
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" end coc.vim

set completeopt+=noselect

" let g:python3_host_prog = '/usr/local/bin/python'

" go stuff
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
" let g:go_gopls_enabled
" let g:go_fmt_command = "gofmt" " auto format imports
" let g:go_fmt_experimental = 1
" let g:go_auto_type_info = 1 " type info in status line
" set updatetime=1
" let g:go_list_type = "quickfix"
" let g:go_statusline_show = 1
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

" highlight ExtraWhitespace ctermbg=red guibg=red
" match ExtraWhitespace /\s\+$/
" autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
" autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" autocmd BufWinLeave * call clearmatches()

let g:matchup_matchparen_deferred = 1
let g:matchup_matchparen_hi_surround_always = 1

" -----------------------------------------------------------------------------
"  VIMTEX OPTIONS
"  ----------------------------------------------------------------------------
if has('unix')
    if has('mac')
        let g:vimtex_view_method = "skim"
        let g:vimtex_view_general_viewer
                \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
        let g:vimtex_view_general_options = '-r @line @pdf @tex'

        " This adds a callback hook that updates Skim after compilation
        let g:vimtex_compiler_callback_hooks = ['UpdateSkim']
        function! UpdateSkim(status)
            if !a:status | return | endif

            let l:out = b:vimtex.out()
            let l:tex = expand('%:p')
            let l:cmd = [g:vimtex_view_general_viewer, '-r']
            if !empty(system('pgrep Skim'))
            call extend(l:cmd, ['-g'])
            endif
            if has('nvim')
            call jobstart(l:cmd + [line('.'), l:out, l:tex])
            elseif has('job')
            call job_start(l:cmd + [line('.'), l:out, l:tex])
            else
            call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
            endif
        endfunction
    else
        let g:latex_view_general_viewer = "zathura"
        let g:vimtex_view_method = "zathura"
    endif
elseif has('win32')

endif

let g:tex_flavor = "latex"
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_mode = 2
if has('nvim')
    let g:vimtex_compiler_progname = 'nvr'
endif

" One of the neosnippet plugins will conceal symbols in LaTeX which is
" confusing
let g:tex_conceal = ""

" Can hide specifc warning messages from the quickfix window
" Quickfix with Neovim is broken or something
" https://github.com/lervag/vimtex/issues/773
let g:vimtex_quickfix_latexlog = {
            \ 'default' : 1,
            \ 'fix_paths' : 0,
            \ 'general' : 1,
            \ 'references' : 1,
            \ 'overfull' : 1,
            \ 'underfull' : 1,
            \ 'font' : 1,
            \ 'packages' : {
            \   'default' : 1,
            \   'natbib' : 1,
            \   'biblatex' : 1,
            \   'babel' : 1,
            \   'hyperref' : 1,
            \   'scrreprt' : 1,
            \   'fixltx2e' : 1,
            \   'titlesec' : 1,
            \ },
            \}

""" end vimtex

let g:colorizer_auto_filetype='go,css,html,js'

set foldlevelstart=10
set foldnestmax=10
set foldlevel=2
set foldmethod=indent

" Prevent vimgo from auto folding on save
" augroup remember_folds
"   autocmd!
"   autocmd BufWinLeave * mkview
"   autocmd BufWinEnter * silent! loadview
" augroup END
"
let $GINKGO_EDITOR_INTEGRATION = "true"
