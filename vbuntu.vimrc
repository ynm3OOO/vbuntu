
" PLUGINS ------------------------------------------------{{{
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'preservim/nerdtree'
Plugin 'preservim/tagbar'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'morhetz/gruvbox'
Plugin 'lifepillar/vim-wwdc17-theme'
Bundle 'sonph/onehalf', {'rtp': 'vim/'}
Plugin 'tyrannicaltoucan/vim-deep-space'
Plugin 'bluz71/vim-nightfly-colors'
Plugin 'altercation/vim-colors-solarized'
Plugin 'psliwka/vim-smoothie'
Plugin 'SirVer/ultisnips' | Plugin 'honza/vim-snippets'
Plugin 'alvan/vim-closetag'
Plugin 'dense-analysis/ale'
Plugin 'othree/html5.vim'
Plugin 'Yggdroot/indentLine'
Plugin 'tpope/vim-commentary'
" StackExchange Automatically place closing curly brace on new line
Plugin 'jiangmiao/auto-pairs'
Plugin 'pangloss/vim-javascript'
" Plugin 'file:///home/sr/projects/firstplugin'
" Plugin 'file:///home/sr/projects/example-plugin'
" All of your Plugins must be added before this line
call vundle#end()            " required
" }}}

" GENERAL SETTINGS ------------------------------{{{ 


"if has('mouse')
"    set mouse=a
"endif

set history=5000

" source when write
autocmd! bufwritepost .vimrc source % 
" Open tagbar automatically in C files, optional
syntax on
set nocompatible              " be iMproved, required
filetype off                  " required
" highlight 81 column
"highlight ColorColumn ctermbg=magenta
"call matchadd('ColorColumn', '\%81v', 100)

set ignorecase
set smartcase
set incsearch
set hlsearch
set shortmess-=S
set number
filetype plugin indent on    " required

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces

set expandtab
set smarttab

set autoindent
set smartindent

" autocmd FileType c call tagbar#autoopen(0)
" Open tagbar automatically in Python files, optional
" autocmd FileType python call tagbar#autoopen(0)
set foldmethod=marker

"}}}

" COLORSCHEME ------------------------------{{{ 
"set termguicolors
"set t_Co=256
set background=light
colorscheme solarized
"}}}

" CURSOR -----------------------------------{{{

"change cursor shape according to vim mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

set cursorline 
"set cursorcolumn
hi clear CursorLine
augroup CLClear
    autocmd! ColorScheme * hi clear CursorLine
augroup END

" hi clear CursorColumn
" augroup CLClear
"     autocmd! ColorScheme * hi clear CursorColumn
" augroup END

hi CursorLineNR cterm=bold,italic ctermfg=white ctermbg=yellow
augroup CLNRSet
    autocmd! ColorScheme * hi CursorLineNR cterm=bold
augroup END
" }}} 

" STATUSLINE ---------------------------------------{{{
" Show status bar, optional
set laststatus=2
" Set status as git status (branch), optional
set statusline=%{FugitiveStatusline()}
set statusline+=\ %f
set statusline+=%R
set statusline+=%{&modified?'[+]':''}
set statusline+=%=
" following is right aligned"
set statusline+=row:\ %l\ col:\ %c\ \ \  
set statusline+=[%p%%]
set showcmd
"}}}

" MAPINGS ----------------------------------------------------{{{

let g:AutoPairsShortcutToggle = '<c-a>'
inoremap <C-e> <del>
" snippets mapping
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
nnoremap Y y$
"nnoremap o o<Esc>
"nnoremap O O<Esc>
" nnoremap n nzz
" nnoremap N Nzz
nnoremap <F8> :TagbarToggle<CR>
nnoremap <C-p> :Files<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <Leader>w <C-w><C-w>
nnoremap <C-t> :terminal<CR>
nnoremap <CR> :nohlsearch<CR>
nnoremap <Leader>l :Limelight!!<CR>
nnoremap <Leader>c :InsertCountry<CR>
"=========[ Run current file]============
nnoremap <Leader>p :w \| !clear;python3 %<CR>
" nnoremap <Leader>cpp :!c++ % -o %:r && ./%:r<CR>
" nnoremap <Leader>s :!chmod +x % && source %<CR>
" nnoremap <Leader>c :!clang % -o %:r && ./%:r<CR>
" nnoremap <Leader>j :!javac % && java %:r<CR>


" }}}

" GLOBAL VARIABLE ------------------------------{{{ 
" gutentags
let g:gutengtags_project_root = ['.git']
" let $FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
" let g:fzf_preview_window = ['right,50%', 'ctrl-/']
let g:fzf_layout = { 'down': '60%' }
" Color name (:help cterm-colors) or ANSI code
let g:limelight_conceal_ctermfg = 238

let g:jedi#show_call_signatures = 0
set completeopt-=popup
let g:jedi#popup_on_dot = 1
" }}}

