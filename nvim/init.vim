call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'scrooloose/nerdcommenter'
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox'
Plug 'petertriho/nvim-scrollbar'

call plug#end()

" Keybindings
inoremap kj <ESC>
nmap <C-n> :NERDTreeToggle<CR>
vmap <C-_> <plug>NERDCommenterToggle
nmap <C-_> <plug>NERDCommenterToggle

" Keybindings for COCk
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()
nmap <F2> <Plug>(coc-rename)

set relativenumber
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set softtabstop=4
set mouse=a
set signcolumn=yes
set smartcase
set nohlsearch
set ic

" Colorscheme
colorscheme gruvbox

let g:coc_global_extensions = [
	\ 'coc-pairs',
	\ 'coc-snippets',
	\ 'coc-json',
    \ 'coc-tsserver',
    \ 'coc-pyright',
    \ 'coc-rls'
    \ ]

" NERDTree settings
let g:NERDTreeIgnore = ['^node_modules$']

function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

autocmd BufRead * call SyncTree()

" ctrlp settings
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" airline settings
let g:airline_theme = 'base16_gruvbox_dark_hard'
