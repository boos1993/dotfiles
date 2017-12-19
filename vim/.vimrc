" Thanks to https://github.com/amacgregor/dot-files for
" the vim config examples!

set encoding=utf8

"""" START Vundle Configuration 

" Disable file type for vundle
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'scrooloose/nerdtree' " Directory tree
Plugin 'majutsushi/tagbar' " Ctags explorer
Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy file searching
Plugin 'universal-ctags/ctags'
Plugin 'wincent/terminus' " Adds some nice mouse integratiosn

" Markdown / Writting
Plugin 'MikeCoder/markdown-preview.vim'

" Git Support
Plugin 'kablamo/vim-git-log'
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-fugitive'

" Theme / Interface
Plugin 'ajh17/Spacegray.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'



call vundle#end()            " required
filetype plugin indent on    " required
"""" END Vundle Configuration 

"""""""""""""""""""""""""""""""""""""
" Configuration Section
"""""""""""""""""""""""""""""""""""""

" Don't wrap to the next line
set nowrap 

" Show relative line numbers and the current line number
set number
set relativenumber

" tabs rule, spaces drool!
set tabstop=4 " Make the tabstop 4 instead of 8

" Always display the status line
set laststatus=2

" Enable highlighting of the current line
set cursorline

" Theme and Styling 
set t_Co=256
set background=dark

let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme spacegray


let g:spacegray_underline_search = 1
let g:spacegray_italicize_comments = 1

" Vim-Airline Configuration
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1 
let g:airline_theme='hybrid'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1 


"""""""""""""""""""""""""""""""""""""
" Mappings configurationn
"""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
map <C-m> :TagbarToggle<CR>


" Shortcuts
nnoremap <Leader>O :CtrlP<CR>
nnoremap <Leader>w :w<CR>

" Disable arrow movement, resize splits instead.
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" Automatically change the working directory to the same as the current file
autocmd BufEnter * silent! lcd %:p:h

" Allows you to call sudow to write file with sudo permissions
cnoremap sudow w !sudo tee % >/dev/null

" Nerdtree settings
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Use Ctrl+J/K/L/H to navigate windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
