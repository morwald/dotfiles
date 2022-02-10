call plug#begin(stdpath('data') . '/plugged')
Plug 'preservim/nerdtree'
Plug 'lifepillar/vim-solarized8'
Plug 'itchyny/lightline.vim'
Plug 'airblade/vim-gitgutter'
Plug 'chrisbra/csv.vim'
Plug 'chrisbra/Colorizer'
Plug 'junegunn/fzf.vim',
Plug 'junegunn/goyo.vim',
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'lervag/vimtex'
call plug#end()

" source files
source $HOME/.config/nvim/functions.vim
source $HOME/.config/nvim/coc.vim

" *** general settings ***
filetype plugin indent on
set nocompatible
set hidden
set showcmd
set hlsearch
set backspace=indent,eol,start
set relativenumber
set number
set signcolumn=auto
set encoding=utf-8
set clipboard=unnamedplus
set mouse-=a
set splitbelow
set splitright

set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4
set list
set listchars=tab:>-

" *** keyboard mappings ***
" leader key
let mapleader = ","

" moving panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" resizing panes
noremap <C-w>+ :resize +5<CR>
noremap <C-w>- :resize -5<CR>
noremap <C-w>< :vertical:resize -5<CR>
noremap <C-w>> :vertical:resize +5<CR>

" color colums for >80
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)

" show whitespaces
highlight BadWhitespace ctermbg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" search and replace
nnoremap <Leader>r :%s/\<<C-r><C-w>\>//g<Left><Left>

" source or edit vimrc
nnoremap <Leader>vs :source ~/.config/nvim/init.vim<CR>:echo "reloaded vimrc"<CR>
nnoremap <leader>vm :vsp ~/.config/nvim/init.vim<CR>

" commenting shortcuts
map gc :call Comment()<CR>
map gC :call Uncomment()<CR>

" buffers
nnoremap <Leader>b :buffers<CR>:buffer<Space>

" toggle last buffer
nnoremap <Leader>B  :b#<cr>

" turn of highlighting when searching
nnoremap <esc> :noh<return><esc>

" *** language specific ***
" C 
au BufNewFile, BufRead *.c, *.h
    \ setlocal tabstop=2 |
    \ setlocal softtabstop=2 |
    \ setlocal shiftwidth=2

" python
map <silent> <F9> :w !python %<CR>

" python
map <silent> <F8> :w !FreeFem++ %<CR>

au BufNewFile, BufRead *.py
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
    \ set colorcolumn=80

" html and css
au BufNewFile, BufRead *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" *** plugins ***
" nertree
map <silent> <leader>n :NERDTreeToggle<CR>

" fuzzy finder
nnoremap <Leader>. :Files .<CR>
nnoremap <Leader>b :Buffers<cr>

" lightline
set laststatus=2
set noshowmode
let g:lightline = {}

" vim-latex-live-preview
let g:livepreview_previewer = 'zathura'

" coc-markmap
nmap <Leader>mm <Plug>(coc-markmap-create)
vmap <Leader>mm <Plug>(coc-markmap-create-v)

" color schemes
set termguicolors
source $HOME/.config/nvim/colorscheme.vim

" update lightline when sourcing
call lightline#update()
call lightline#colorscheme()
