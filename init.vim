let mapleader=","
map <leader>v :e ~/.config/nvim/init.vim<CR>
map <leader>n :NERDTreeToggle<CR>
map <leader>/ :q<CR>
map <Esc><Esc> :w<CR>

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-easy-align'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'vim-scripts/indentpython.vim'
Plug 'preservim/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tmhedberg/SimpylFold'
Plug 'vim-syntastic/syntastic'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'ervandew/supertab'
call plug#end()

colorscheme gruvbox
set background=dark
