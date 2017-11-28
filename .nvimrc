" enable syntax highlighting
syntax enable

" Call Vim Plug
call plug#begin()
if filereadable(expand("~/.config/nvim/bundles.vim"))
  source ~/.config/nvim/bundles.vim
endif
call plug#end()

autocmd BufReadPre,BufNewFile * let b:did_ftplugin = 1
filetype plugin on
set autoindent
set autoread                                                 " reload files when changed on disk, i.e. via `git checkout`
set backspace=2                                              " Fix broken backspace in some setups
set backupcopy=yes                                           " see :help crontab
set clipboard=unnamed                                        " yank and paste with the system clipboard
set cursorline
set directory-=.                                             " don't store swapfiles in the current directory
set expandtab                                                " expand tabs to spaces
set ignorecase                                               " case-insensitive search
set hlsearch
set incsearch                                                " search as you type
set laststatus=2                                             " always show statusline
set list                                                     " show trailing whitespace
set listchars=tab:▸\ ,trail:▫
set number                                                   " show line numbers
set ruler                                                    " show where you are
set scrolloff=3                                              " show context above/below cursorline
set shiftwidth=2                                             " normal mode indentation commands use 2 spaces
set showcmd
set smartcase                                                " case-sensitive search if any caps
set softtabstop=2                                            " insert mode tab and backspace use 2 spaces
set tabstop=8                                                " actual tabs occupy 8 characters
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a navigable menu for tab completion
set wildmode=longest,list,full
set nospell
set noshowmatch         " Don't match parentheses/brackets
set nocursorcolumn      " Don't paint cursor column
set scrolljump=8        " Scroll 8 lines at a time at bottom/top
set autoread
let html_no_rendering=1 " Don't render italic, bold, links in HTML

" keyboard shortcuts
let mapleader = ','
nnoremap ; :
nnoremap <leader>a :Ag<space>
nnoremap <leader>bb :CtrlPBuffer<CR>
nnoremap <leader>d :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>T :CtrlPClearCache<CR>:CtrlP<CR>
nnoremap <leader>] :TagbarToggle<CR>
nmap <F3> :let @/ = ""<CR>
inoremap jj <ESC>:w<CR>
if has('nvim')
    " Temporary fix for neovim/neovim#2048
    " Shoutout to @vilhalmer for the idea for this fix
    " https://github.com/vilhalmer/System/commit/a40ff262918a83e88fb643bad31dde3c45211bba
    "
    " Fix for window movement
    nmap <bs> <C-w>h
    " Fix for tab movement
    nmap <C-w><bs> :tabprevious<CR>
endif
nn <C-h> <C-w>h
nn <C-j> <C-w>j
nn <C-k> <C-w>k
nn <C-l> <C-w>l

" Quickly edit/reload the vimrc file
nmap <silent> <leader>V :e $MYVIMRC<CR>
nmap <silent> <leader>B :e ~/.config/nvim/bundles.vim<CR>
nmap <silent> <leader>Z :e ~/.zshrc<CR>
noremap <leader>zz :!source ~/.zshrc<CR>:filetype detect<CR>:exe ":echo 'zshrc reloaded'"<CR>
noremap <leader>vv :source ~/.config/nvim/init.vim<CR>:filetype detect<CR>:exe ":echo 'nvimrc reloaded'"<CR>

" Searching
set path+=**

" Persistent undo
set undofile
call mkdir($HOME."/.config/nvim/undo", "p")
set undodir=$HOME/.config/nvim/undo

set undolevels=1000
set undoreload=10000

" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %


" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell
" extra rails.vim help
autocmd User Rails silent! Rnavcommand decorator      app/decorators            -glob=**/* -suffix=_decorator.rb
autocmd User Rails silent! Rnavcommand observer       app/observers             -glob=**/* -suffix=_observer.rb
autocmd User Rails silent! Rnavcommand feature        features                  -glob=**/* -suffix=.feature
autocmd User Rails silent! Rnavcommand job            app/jobs                  -glob=**/* -suffix=_job.rb
autocmd User Rails silent! Rnavcommand mediator       app/mediators             -glob=**/* -suffix=_mediator.rb
autocmd User Rails silent! Rnavcommand stepdefinition features/step_definitions -glob=**/* -suffix=_steps.rb
" automatically rebalance windows on vim resize
autocmd VimResized * :wincmd =

set background=dark
colorscheme solarized
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }

 " Make it obvious where 110 characters is
set textwidth=200
set colorcolumn=+1
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%110v.\+/ " Disambiguate ,a & ,t from the Align plugin, making them fast again.

if has("autocmd")
  " remove trailing whitespace
  autocmd BufWritePre * :%s/\s\+$//e
endif

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" deoplete tab-complete
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
" ,<Tab> for regular tab
inoremap <Leader><Tab> <Space><Space>
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

nnoremap <leader>% :MtaJumpToOtherTag<cr>
set mouse+=a

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif
nnoremap <Space> za
set foldlevelstart=20


" Vimux
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>

""""""""""""""""""""""""""""""""""""""""""""
" Language Settings
""""""""""""""""""""""""""""""""""""""""""""""
let g:used_javascript_libs = 'underscore,angular,jasmine'
autocmd FileType elixir setlocal commentstring=#\ %s
autocmd FileType javascript setlocal commentstring=//\ %s
autocmd FileType javascript setlocal foldmethod=syntax
au Filetype html setlocal sw=2 ts=2 sts=2
au Filetype less setlocal sw=2 ts=2 sts=2
au Filetype clojure setlocal sw=4 ts=4 sts=4
let g:jsx_ext_required = 0

let g:neomake_sml_smlnj_maker = {
    \ 'exe': 'sml',
    \ 'args': ['-Ccontrol.poly-eq-warn=false'],
    \ 'errorformat':
        \ '%E%f:%l%\%.%c %trror: %m,' .
        \ '%E%f:%l%\%.%c-%\d%\+%\%.%\d%\+ %trror: %m,' .
        \ '%W%f:%l%\%.%c %tarning: %m,' .
        \ '%W%f:%l%\%.%c-%\d%\+%\%.%\d%\+ %tarning: %m,' .
        \ '%C%\s%\+%m,' .
        \ '%-G%.%#'
\ }

" plugin settings
"""" vimg-go
let g:go_highlight_structs = 1
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1
set updatetime=2000
"""
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
let g:neomake_javascript_eslint_exe = nrun#Which('eslint')
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_rust_enabled_makers = ['rustc', 'cargo']
let g:neomake_sml_enabled_makers = ['smlnj']
let g:neomake_ansible_enabled_makers = ['ansiblelint']
let g:rustfmt_autosave = 1
autocmd! BufWritePost * Neomake
