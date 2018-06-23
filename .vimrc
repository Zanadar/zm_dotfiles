" enable syntax highlighting
syntax enable

" Call Vim Plug
call plug#begin('~/.vim/plugged')
if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
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
let html_no_rendering=1 " Don't render italic, bold, links in HTML
set encoding=utf-8

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
inoremap jj <ESC>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Quickly edit/reload the vimrc file
nmap <silent> <leader>V :e $MYVIMRC<CR>
nmap <silent> <leader>B :e ~/.vimrc.bundles<CR>
nmap <silent> <leader>Z :e ~/.zshrc<CR>
noremap <leader>zz :!source ~/.zshrc<CR>:filetype detect<CR>:exe ":echo 'zshrc reloaded'"<CR>
noremap <leader>vv :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" in case you forgot to sudo
cnoremap w!! %!sudo tee > /dev/null %

" plugin settings
let g:ctrlp_match_window = 'order:ttb,max:20'
let g:NERDSpaceDelims=1
autocmd! BufWritePost * Neomake
let g:deoplete#enable_at_startup = 1

" Use The Silver Searcher https://github.com/ggreer/the_silver_searcher
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

"Comment strings
autocmd FileType ruby setlocal commentstring=#\ %s
autocmd FileType elixir setlocal commentstring=#\ %s


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

 " Make it obvious where 110 characters is
set textwidth=110
set colorcolumn=+1
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%110v.\+/ " Disambiguate ,a & ,t from the Align plugin, making them fast again.

if has("autocmd")
  " remove trailing whitespace
  autocmd BufWritePre * :%s/\s\+$//e
endif

if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
" deoplete tab-complete
inoremap <silent><expr> <Tab> pumvisible() ? "\<C-n>" : deoplete#mappings#manual_complete()
" ,<Tab> for regular tab
inoremap <Leader><Tab> <Space><Space>
" tern

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
set path=$PWD/**

""""""""""""""""""""""""""""""""""""""""""""
" Language Settings
""""""""""""""""""""""""""""""""""""""""""""""

au Filetype html setlocal sw=2 ts=2 sts=2
au Filetype less setlocal sw=2 ts=2 sts=2
