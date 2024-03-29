"***********************
"**  Derek C. Zoladz  **
"**  Version: 2.3     **
"***********************


""" ENABLE SYNTAX HIGHLIGHTING AND AUTOMATIC INDENTATION """
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif


""" ENABLE Pathogen.vim RUNTIME """
call pathogen#infect()


""" UTF-8 CHARACTER ENCODING """
if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif


""" PYTHON SUPPORT """
if &ft == 'python'
  set textwidth=80 " 80 character lines
endif


""" CLIPBOARD SET (linux install vim-gtk)"""
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif


"""  DISPLAY TABS SPACING """
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif


""" UNDOTREE CONFIG  """
nnoremap <F5> :UndotreeToggle<cr>
set undofile
set undodir=~/.vim/undo " persist undo across vim sessions


""" USE COLORSCHEME  """
colorscheme jellybeans


""" START NERDTREE ON LAUNCH """
autocmd vimenter * NERDTree
let NERDTreeShowHidden=1 " Show Hidden Files


""" DEFINE LIGHTLINE CONFIGURATION """
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }


""" VIM ILLUMINATE CONFIGURATION """
let g:Illuminate_highlightUnderCursor = 1
let g:Illuminate_delay = 300
let g:Illuminate_ftblacklist = ['nerdtree']

""" VIM EZPROXY ""
au BufRead,BufNewFile config.txt set ft=ezproxy_config
au BufRead,BufNewFile user.txt set ft=ezproxy_user
au BufRead,BufNewFile shibuser.txt set ft=ezproxy_shibuser

""" SET DEFAULTS """
set expandtab                   " expand tabs into spaces
set autoindent                  " indent when moving to the next line
set fileformat=unix             " convert file to unix file convention
set hlsearch                    " highlight searches
set nu                          " show line numbers
set showmatch                   " show the matching part of the pair for [] {} and ()
set list                        " display whitespace
set incsearch                   " incremental search
set smarttab
set wildmenu                    " command completion
"set paste                       " Paste from a windows or from vim
set ignorecase                  " case insensitive search
set laststatus=2                " enable status bar
set backspace=indent,eol,start  " fix backspace doesn't work
set noshowmode                  " remove redundant mode status, use lightline
