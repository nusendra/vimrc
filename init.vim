set nocompatible
set tabstop=2
set shiftwidth=2
set expandtab
set number
set autoindent
set hlsearch
set background=dark
set backspace=indent,eol,start
set guifont=DroidSansMono

syntax enable
filetype plugin indent on

call plug#begin()
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'mhartington/oceanic-next'
Plug 'ryanoasis/vim-devicons'
Plug 'wakatime/vim-wakatime'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'posva/vim-vue'
Plug 'gko/vim-coloresque'
Plug 'tpope/vim-commentary'
Plug 'Yggdroot/indentLine'
Plug 'leafgarland/typescript-vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'jiangmiao/auto-pairs'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" colorscheme
if (has("termguicolors"))
  set termguicolors
endif
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext

" nerdtree
map <C-b> :NERDTreeToggle<CR>
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeLimitedSyntax = 1

" keymap Split
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Window Tab
nnoremap <C-N> :tabnew<cr>
nnoremap <C-Y> :tabprevious<CR>
nnoremap <C-U> :tabnext<CR>

" vim-vue
let g:vue_pre_processors = [] " disable all pre-processor

" Map Toggle IndentLine
map <C-i> :IndentLinesToggle<CR>

" trailing whitespaces
map <C-f> :FixWhitespace<CR>

" FZF exclude files based on .gitignore
nnoremap <c-p> :GFiles<cr>

"Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier
let g:prettier#config#bracket_spacing = 'true'
