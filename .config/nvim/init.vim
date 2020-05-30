" Install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin('~/.config/nvim/plugged')

" SEARCH
Plug 'junegunn/fzf', { 'do': './install --all --xdg' }
Plug 'junegunn/fzf.vim'

" STYLE
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'ryanoasis/vim-devicons'

" COLOR SCHEME
Plug 'morhetz/gruvbox'
  " Plug 'joshdick/onedark.vim'

" UTILS
Plug 'vimwiki/vimwiki'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

call plug#end()

colorscheme gruvbox
set background=dark

""" basics

  let mapleader=" "
  inoremap jk <ESC>
  set nocompatible
  filetype plugin indent on
  syntax on
  highlight Comment cterm=italic
  set path+=**
  set clipboard+=unnamedplus
  set encoding=utf8
  set number relativenumber
  set nohlsearch
  set wildmenu
  set wildmode=longest,list,full
  set tabstop=2 shiftwidth=2 expandtab smarttab

  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l

  "Replace all is aliased to S.
     nnoremap S :%s//g<Left><Left>

  "Disables automatic commenting on newline:
    autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

  "spell-check
    map <leader>o :setlocal spell! spelllang=fr<CR>
    map <leader>oe :setlocal spell! spelllang=en_us<CR>

  "Save file as sudo on files that require root permission
    cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

  "Automatically deletes all trailing whitespace and newlines at end of file on save.
    autocmd BufWritePre * %s/\s\+$//e
    autocmd BufWritepre * %s/\n\+\%$//e

""" latex setup

  autocmd BufRead,BufNewFile *.tex set filetype=tex

  "writing style
    map <leader>f :Goyo \| set linebreak<CR>

""" cpp setup

  "fast header source switch
    map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

""" test snippets
  nnoremap ,html :-1read $HOME/.config/nvim/snippets/skeleton_html.snip<CR>

""" plugin configurations

  "fzf
    nnoremap <C-p> :Files<ENTER>
    if has('nvim')
      aug fzf_setup
        au!
        au TermOpen term://*FZF tnoremap <silent> <buffer><nowait> <esc> <c-c>
      aug END
    end

  "wiki
  let g:vimwiki_list = [{'path': '~/Documents/vimwiki/',
                        \ 'syntax': 'markdown', 'ext': '.md'}]
  map <leader>v :VimwikiIndex

  "Nerd tree
  	map <leader>n :NERDTreeToggle<CR>
  	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
      if has('nvim')
          let NERDTreeBookmarksFile = stdpath('data') . '/NERDTreeBookmarks'
      endif

  "status bar
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
