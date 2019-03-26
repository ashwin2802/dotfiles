set encoding=utf-8
set fileencoding=utf-8
syntax on
set ttyfast
set lazyredraw

call plug#begin('~/.config/nvim/plugged')

Plug 'neomake/neomake'
Plug 'Shougo/vimproc.vim',{'do':'make'}
Plug 'Quramy/tsuquyomi'
Plug 'scrooloose/nerdtree',{'on':'NERDTreeToggle'}
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf',{'dir':'~/.fzf','do':'./install --bin'}
Plug 'Valloric/YouCompleteMe',{'do':'./install.py --clang-completer'}
Plug 'w0rp/ale'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-tbone'
Plug 'editorconfig/editorconfig-vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()

call neomake#configure#automake('w')

let g:NERDSpaceDelims=1
let g:NERDDefaultAlign='left'
let g:NERDCompactSexyComs=1
let g:NERDCommentEmptyLines=1
let g:NERDTrimTrailingWhitespace=1
let g:NERDToggleCheckAllLines=1
let g:NERDAltDelims_java=1

let NERDTreeShowHidden=1
map <silent> <C-x> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen=1

let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_max_num_candidates=10
let g:ycm_max_num_identifier_candidates=10
let g:ycm_filetype_blacklist ={
	\'markdown':1,
	\'text':1,
	\'notes':1
	\}

let g:ale_fix_on_save=1
let g:ale_lint_on_text_changed='always'
let g:ale_lint_delay=1000

let g:ale_sign_error = 'E'
let g:ale_sign_warning = 'W'

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\}

if (executable('ag'))
    let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
endif

let g:user_emmet_settings = {
\  'javascript' : {
\      'extends' : 'jsx',
\  },
\  'typescript' : {
\      'extends' : 'tsx',
\  },
\}

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'fugitive#head'
      \ },
      \ }

let g:gitgutter_diff_args = '-w'

set t_Co=256
colorscheme nord
set nowrap
set number
set laststatus=2
set noshowmode
set invlist
set list
set listchars=tab:¦\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap jj <Esc>`^

nnoremap <C-y> +y
vnoremap <C-y> +y
nnoremap <C-p> +P
vnoremap <C-p> +P

set clipboard=unnamed

set backupdir=~/.nvim/backups
set directory=~/.nvim/swapfiles

nnoremap <C-P> :Files<CR>

nnoremap ,dl    :YcmCompleter GoToDeclaration<CR>
nnoremap ,df    :YcmCompleter GoToDefinition<CR>
nnoremap ,# :YcmCompleter GoToReferences<CR>

set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
set ai
set si

command W w !sudo tee % > /dev/null

