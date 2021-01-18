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
let g:airline_theme='solarized'
colorscheme apprentice

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

"ale
let b:ale_fixers = ['prettier', 'eslint']
let g:ale_linter_aliases = {'svelte': ['css', 'javascript']}
let g:ale_linters = {'svelte': ['stylelint', 'eslint']}
let g:ale_fixers = {'svelte': ['eslint', 'prettier', 'prettier_standard']}

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
Plugin 'dense-analysis/ale'
Plugin 'junegunn/fzf.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'leafgarland/typescript-vim'
Plugin 'bronson/vim-trailing-whitespace'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'jiangmiao/auto-pairs'
Plugin 'neoclide/coc.nvim', {'branch': 'release'}
Plugin 'sheerun/vim-polyglot'
Plugin 'mhinz/vim-startify'
Plugin 'hugolgst/vimsence'

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
nnoremap <C-Y> :tabprevious<CR>
nnoremap <C-U> :tabnext<CR>

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list=1
let g:syntastic_aggregate_errors = 1

"Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html Prettier

let g:prettier#config#bracket_spacing = 'true'

let g:startify_custom_header = [
      \ '                        ~~                             ',
      \ '                       |@@=                            ',
      \ '                      j@@@@}                           ',
      \ '                    `K@@^^@@k`                         ',
      \ '                   .N@Q,  ~Q@N.                        ',
      \ '                  ~Q@%.    .N@Q_                       ',
      \ '  `.             <@@h       `X@@^             .`       ',
      \ '   }#y^`        z@@z          f@@7        `ryBu        ',
      \ '    |@@@&y^`   U@@+            =@@S   `+5Q@@@=         ',
      \ '     ~@@@Q@@QyW@Q:              ~Q@gaQ@@Q@@Q~          ',
      \ '      ,Q@Q~=R@@@Qj^`          `^yQ@@@D=;Q@Q.           ',
      \ '       `R@Q7@@K=aQ@@By^`  `^5B@@Qa+b@@7@@K`            ',
      \ '         o@@@n    .=oQ@@QQ@@Bo^`    5@@@y              ',
      \ '         o@@@Y    .+oQ@@QQ@@Bo^`    5@@@y              ',
      \ '       `D@@z@@6^yB@@Qa=.  .=mQ@@Ny^q@@z@@6`            ',
      \ '      .Q@Q~^D@@@Qo+`          .+ZQ@@@D^;Q@B.           ',
      \ '     ~@@@Q@@QyW@Q:              ~Q@gaQ@@Q@@Q~          ',
      \ '    *@@@QS=.  `q@@^            r@@P   .<mQ@@@^         ',
      \ '   YQa+.        s@@T          I@@J        .>ZQt        ',
      \ '  `.             <@@h       `X@@^             .`       ',
      \ '                  ~Q@%.    .N@Q_                       ',
      \ '                   .B@Q.  ,Q@#.                        ',
      \ '                    `d@@;!@@U`                         ',
      \ '                      j@@@@}                           ',
      \ '                       i@@*                            ',
      \ '                        ;;                             ',
        \ ]

set splitbelow
set splitright
