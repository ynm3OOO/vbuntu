
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
Plugin 'bluz71/vim-nightfly-colors'
Plugin 'psliwka/vim-smoothie'
Plugin 'SirVer/ultisnips' | Plugin 'honza/vim-snippets'
Plugin 'alvan/vim-closetag'
Plugin 'dense-analysis/ale'
Plugin 'othree/html5.vim'
Plugin 'Yggdroot/indentLine'
" Plugin 'file:///home/sr/projects/firstplugin'
" Plugin 'file:///home/sr/projects/example-plugin'
" All of your Plugins must be added before this line
call vundle#end()            " required
" }}}

" GENERAL SETTINGS ------------------------------{{{ 

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

if has('mouse')
    set mouse=a
endif

set history=5000

" source when write
autocmd! bufwritepost .vimrc source % 
" Open tagbar automatically in C files, optional
syntax on
set nocompatible              " be iMproved, required
filetype off                  " required
" highlight 81 column
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

set ignorecase
set smartcase
set incsearch
set hlsearch
set shortmess-=S
set number
set cursorline
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
set termguicolors

"let g:xcodelight_green_comments=1
"let g:xcodelight_match_paren_style=1
"colorscheme xcodelight
"let g:xcodedark_green_comments=1
"let g:xcodedark_match_paren_style=1
set background=dark
colorscheme gruvbox
let g:indentLine_setColors = 0
"let g:indentLine_char = '┆'
"}}}

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

