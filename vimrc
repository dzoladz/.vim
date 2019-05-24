" Maintainer:		Derek C. Zoladz
" Version:			1.0
" -------------------------------


""" enable syntax highlighting and automatic indentation """
if has('autocmd')
  filetype plugin indent on
endif
if has('syntax') && !exists('g:syntax_on')
  syntax enable
endif


""" utf-8 character encoding """
if &encoding ==# 'latin1' && has('gui_running')
  set encoding=utf-8
endif

""" For Python Support """
let python_highlight_all = 1	" syntax highlighting
set textwidth=80		" 80 character lines


""" SET DEFAULTS """
set expandtab		" expand tabs into spaces
"set shiftwidth=2				" when using the >> or << commands, shift lines by 4 space
set autoindent		" indent when moving to the next line while writing code
set fileformat=unix				" convert file to unix file convention
set hlsearch		" highlight searches
set nu							" show line numbers
set showmatch		" show the matching part of the pair for [] {} and ()
set list		" display whitespace
set incsearch		" incremental search
set smarttab
set wildmenu		" command completion

" all yanking goes to clipboard (linux install vim-gtk)
if system('uname -s') == "Darwin\n"
  set clipboard=unnamed "OSX
else
  set clipboard=unnamedplus "Linux
endif

" fix (mouse) on selection copy/paste behaviour
runtime! defaults.vim
let g:skip_defaults_vim = 1
" set mouse=
set paste						" Paste from a windows or from vim (shift + p preserve indent)
set ignorecase					" case insensitive search
set laststatus=2				" enable status bar
" set cursorline					" show a visual line under the cursor's current line

"""  display tabs space """
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

set backspace=indent,eol,start " fix backspace doesn't work during insert (https://goo.gl/fizWK6)l

" enable Pathogen runtime
"set nocp
call pathogen#infect()


""" Solarized """
let g:solarized_termcolors=256
set background=dark
colorscheme solarized

""" Start NERDTree on launch """
autocmd vimenter * NERDTree
