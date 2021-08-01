" https://vimawesome.com/
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
" 
"
"
" HOWTO
" go to definition | <gd> or <gD>
"
"
"
set nocompatible              " be iMproved, required
let g:gmi#ignored_filetypes = ['help', 'qf', 'nerdtree', 'fzf']
let g:GIT_SSL_NO_VERIFY=v:true
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  --insecure https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
let g:GIT_SSL_NO_VERIFY=v:false
call plug#begin('~/.vim/bundle')
Plug 'ThanhKhoaIT/git-message.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'tpope/vim-sensible'
Plug 'vim-syntastic/syntastic'
Plug 'nvie/vim-flake8'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Plug 'klen/python-mode'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-fugitive'
Plug 'sainnhe/sonokai'
Plug 'vim-airline/vim-airline'
Plug 'mattn/webapi-vim'
Plug 'dense-analysis/ale'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-eunuch'
" Plug 'paulkass/jira-vim', { 'do': 'pip3 install -r requirements.txt' }
" Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 -m ./install.py' }
" Plug 'n0v1c3/vira', { 'do': './install.sh' }
" some work needs to be done here
Plug 'rhysd/git-messenger.vim'
"Plug 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
"    You need
"    vim compiled with Python 2.6:
call plug#end()
set splitbelow
set splitright
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
let g:SimpylFold_docstring_preview=1
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=119 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
"Flagging Unnecessary Whitespace
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set encoding=utf-8
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
let python_highlight_all=1
:syntax enable
:colorscheme sonokai
"call togglebg#map("<F5>")
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree
set nu
set clipboard=unnamed