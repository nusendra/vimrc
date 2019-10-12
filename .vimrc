set nocompatible
set tabstop=2
set shiftwidth=2
set expandtab
set number
set autoindent
set hlsearch
set background=dark
set backspace=indent,eol,start

syntax enable
filetype plugin indent on

" color theme
if (has("termguicolors"))
  set termguicolors
endif
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let g:airline_theme='oceanicnext'
colorscheme OceanicNext

" feature
autocmd FileType php setlocal shiftwidth=4 tabstop=4
" autocmd vimenter * NERDTree
autocmd FileType vue syntax sync fromstart
autocmd FileType html setlocal sw=2 sts=2
autocmd BufRead,BufNewFile *.svelte setlocal ft=html
autocmd BufNewFile,BufRead *.vue set ft=vue
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
autocmd QuickFixCmdPost *grep* cwindow
set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:prettier#autoformat = 0

"ale
let b:ale_fixers = ['prettier', 'eslint']

" custom
let mapleader = ","
" let g:javascript_plugin_jsdoc = 1

" indentLine
let g:indentLine_color_term = 239

" Plugins
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'ajh17/spacegray.vim'
Plugin 'posva/vim-vue'
Plugin 'digitaltoad/vim-pug'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'prettier/vim-prettier'
Plugin 'tpope/vim-commentary'
Plugin 'wakatime/vim-wakatime'
Plugin 'w0rp/ale'
Plugin 'junegunn/fzf.vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Yggdroot/indentLine'
Plugin 'leafgarland/typescript-vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'Raimondi/delimitMate'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'

" vim code formatter
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
Plugin 'google/vim-glaive'
call vundle#end()
call glaive#Install()
filetype plugin indent on

" Map NerdTree
map <C-b> :NERDTreeToggle<CR>

" Map Toggle IndentLine
map <C-i> :IndentLinesToggle<CR>

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" NerdTree Highlight File Color
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

" keymap Split
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" FZF exclude files based on .gitignore
nnoremap <c-p> :GFiles<cr>

" Window Tab
nnoremap <C-N> :tabnew<cr>
nnoremap <C-Up> :tabprevious<CR>
nnoremap <C-Down> :tabnext<CR>

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

" Autoformatting using codefmt
augroup autoformat_settings
  autocmd FileType bzl AutoFormatBuffer buildifier
  autocmd FileType c,cpp,proto,javascript AutoFormatBuffer clang-format
  autocmd FileType dart AutoFormatBuffer dartfmt
  autocmd FileType go AutoFormatBuffer gofmt
  autocmd FileType gn AutoFormatBuffer gn
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType java AutoFormatBuffer google-java-format
  autocmd FileType python AutoFormatBuffer yapf
  " Alternative: autocmd FileType python AutoFormatBuffer autopep8
  autocmd FileType vue AutoFormatBuffer prettier
augroup END

set splitbelow
set splitright
