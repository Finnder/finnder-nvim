call plug#begin("~/.local/share/nvim/plugged")

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'tpope/vim-fugitive'

"File Managment
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim'

"Language Server (Intellasense)
Plug 'neoclide/coc.nvim', {'branch': 'release'}
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver']

" Plug 'davidhalter/jedi-vim' " Python autocomplete

"Syntax
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'preservim/vim-markdown'
Plug 'leafgarland/typescript-vim'
Plug 'sheerun/vim-polyglot'

" Status Bar
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

let g:airline_theme='angr'
let g:airline#extensions#tabline#formatter = 'unique_tail' " file-name.js
let g:airline#extensions#whitespace#enabled = 0

let g:airline_section_x = ''
let g:airline_section_y = ''
let g:airline_section_z = '🐧'

" Dashboard
"Plug 'glepnir/dashboard-nvim'

" Simple 
Plug 'tpope/vim-commentary'

"Themes
Plug 'joshdick/onedark.vim'
Plug 'junegunn/seoul256.vim'
Plug 'sainnhe/everforest'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'
Plug 'dracula/vim'
Plug 'haystackandroid/carbonized'

call plug#end()

filetype plugin indent on

" this just makes the ; key act as :
nmap ; :

" turn syntax highlighting on for everything
syntax on

" just a shortcut
command W w

" disable cursor styling in nvim
set guicursor=

" default colorscheme
colorscheme everforest

" transparent toggle
hi Normal guibg=NONE ctermbg=NONE 

" Set empty lines transparent "
highlight EndOfBuffer ctermbg=NONE ctermfg=NONE

"Set bg as transparent or not"
let t:is_transparent = 0 "1 - start with transparent on"
function! Toggle_transparent_background()                      
  if t:is_transparent == 0                   
    hi Normal guibg=#111111 ctermbg=black                     
    let t:is_transparent = 1
  else
    hi Normal guibg=NONE ctermbg=NONE                    
    let t:is_transparent = 0                        
  endif                    
endfunction               

set nu
set nocompatible
set nobackup
set nowritebackup
set noswapfile
set mouse=a
" set ttymouse=sgr
set backspace=indent,eol,start
set autoindent
set tabstop=4
set softtabstop=0
set expandtab
set shiftwidth=4
set smarttab
set lazyredraw
set ttyfast

" this makes indenting really easy
"
" and un-indenting just do shift+tab
nnoremap <Tab> >>_
nnoremap <S-Tab> <<_
inoremap <S-Tab> <C-D>
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" edit wrapped lines like multiple lines
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> 0 g0
nnoremap <silent> $ g$

" some go specific indent/tab shit (not even sure if you need this)
autocmd Filetype go setlocal nolist
autocmd Filetype go setlocal noexpandtab
autocmd Filetype go setlocal shiftwidth=4 softtabstop=4 tabstop=4

" key for fzf 
noremap <c-p> :Files<CR>
noremap <c-f> :R<CR>
noremap <c-l> :Lines<CR>
noremap <c-k> :GoDoc<CR>
noremap <c-j> :GoDef<CR>
noremap <c-c> :GoCallers<CR>

" NERD TREE Config
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
