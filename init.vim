let mapleader=","
map <leader>v :e ~/.config/nvim/init.vim<CR>
map <leader>n :NERDTreeToggle<CR>
map <leader>/ :q<CR>
map <Esc><Esc> :w<CR>
map <leader><left> :bp<CR>
map <leader><right> :bn<CR>
map <leader><up> :b #<CR>
map <leader><down> :bd<CR>
map <leader>m :CtrlP<CR>
map <leader>t :vimgrep /TODO/ **<CR>:copen<CR>
map <leader>. :ClearCtrlPCache<CR>
map <leader>l :CtrlPTag<CR>
map <leader>k :!ctags -R .<CR>
nmap <F8> :TagbarToggle<CR>
autocmd InsertLeave * write
autocmd FileType python map <buffer> <F9> :w<CR>:split term://python3 %<CR>
autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:split term://python3 %<CR>

call plug#begin('~/.vim/plugged')
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'davidhalter/jedi-vim'
Plug 'preservim/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'pangloss/vim-javascript'
Plug 'posva/vim-vue'
Plug 'ervandew/supertab'
Plug 'majutsushi/tagbar'
call plug#end()

set termguicolors
colorscheme gruvbox
set background=dark
set wildignore+=*/node_modules/*,*/bin/*,*/lib/*,*/log/*
set nobackup
set nowritebackup
let g:ctrlp_show_hidden = 1
set tabstop=2
set softtabstop=2
set shiftwidth=2
set autoindent
set expandtab
let g:jedi#usages_command = "<leader>a"
let g:ale_fix_on_save = 1
let g:ale_fixers = {
\   'javascript': [
\       'prettier',
\       'eslint',
\   ],
\   'vue': [
\       'prettier',
\       'eslint',
\   ],
\   'python': [
\       'black',
\       'isort',
\   ],
\}
