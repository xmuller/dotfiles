" Install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" Autocompetion
"Plug 'ncm2/ncm2'
"Plug 'roxma/nvim-yarp'
"Plug 'ncm2/ncm2-bufword'
"Plug 'ncm2/ncm2-path'

" WIKI
Plug 'vimwiki/vimwiki'

" STATUS BAR
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline' " For tabs on top
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'

" SEARCH
Plug 'junegunn/fzf', { 'do': './install --all --xdg' }
Plug 'junegunn/fzf.vim'

" COLOR SCHEME
Plug 'joshdick/onedark.vim'

" EDIT UTILS
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

call plug#end()

" Bindings Keys
set number
let mapleader = " "
inoremap jk <ESC>
noremap ! .

highlight LineNr ctermfg=250 ctermbg=238
nnoremap <leader>fm :Neoformat<CR>

" macro avec Q
nnoremap Q @q
vnoremap Q :norm @q<cr>

noremap <C-e>2 :hsp<CR>
noremap <C-e>3 :vsp<CR>

nnoremap <leader>f 1z=
nnoremap <leader>s :set spell!
" répéter insertion en visuel
vnoremap ; :norm.<CR>

set nocompatible
filetype plugin indent on
syntax on
set encoding=utf-8
set clipboard=unnamedplus
set spell spelllang=en_us,fr

" change panes avec ctrl
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k

" SEARCH
nnoremap <C-p> :Files<ENTER>
if has('nvim')
  aug fzf_setup
    au!
    au TermOpen term://*FZF tnoremap <silent> <buffer><nowait> <esc> <c-c>
  aug END
end

" WIKI
let g:vimwiki_list = [{'path': '~/Documents/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]

" STATUS BAR
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'tabline': {
      \   'left': [['buffers']],
      \   'right': [[ 'exit' ]],
      \ },
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified'] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ 'component_expand': {
      \   'buffers': 'lightline#bufferline#buffers',
      \ },
      \ 'component_type': {
      \   'buffers': 'tabsel'
      \ },
      \ }
let g:lightline#bufferline#shorten_path = 1
let g:lightline#bufferline#enable_devicons = 1
