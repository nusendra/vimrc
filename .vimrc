set nocompatible
set tabstop=2
set shiftwidth=2
set expandtab
set number
set autoindent
set hlsearch
set background=dark

syntax enable
filetype plugin indent on

" color theme
colorscheme spacegray

" feature
autocmd FileType php setlocal shiftwidth=4 tabstop=4
" autocmd vimenter * NERDTree
autocmd FileType vue syntax sync fromstart
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
call vundle#end()
filetype plugin indent on

" Map NerdTree
map <C-b> :NERDTreeToggle<CR>

" Map Toggle IndentLine
map <C-i> :IndentLinesToggle<CR>

function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

call NERDTreeHighlightFile('vue', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('ts', 'blue', 'none', 'blue', '#151515')
call NERDTreeHighlightFile('json', 'red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('html', 'grey', 'none', 'grey', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('js', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

" keymap Split
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" FZF exclude files based on .gitignore
nnoremap <c-p> :GFiles<cr>

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

set splitbelow
set splitright
