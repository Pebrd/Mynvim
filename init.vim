set encoding=utf-8
syntax enable 
set noswapfile
set scrolloff=7
set backspace=indent,eol,start
set number relativenumber 
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent 

let $PATH .= ';C:\cygwin64\bin'

"Spellcheck
set spelllang=en,cjk
nnoremap <silent> <F12> :set spell!cr><
inoremap <silent> <F12> <C-O>:set spell!<cr>


let mapleader = ' '

call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'morhetz/gruvbox'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tpope/vim-commentary'
Plug 'huyvohcmc/atlas.vim'
Plug 'ryanoasis/vim-devicons'



 "
 "Visual Guide  
 Plug 'Yggdroot/indentLine'
 " syntax check
 Plug 'w0rp/ale'
 " Autocomplete
 Plug 'ncm2/ncm2'
 Plug 'roxma/nvim-yarp'
 Plug 'ncm2/ncm2-bufword'
 Plug 'ncm2/ncm2-path'
Plug 'mhinz/vim-startify'

" Auto sessions
Plug 'tpope/vim-obsession'

Plug 'sheerun/vim-polyglot' 

" Autocompletition
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"   " Ctrl enter to complete
if exists('*complete_info')
inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" :
" "\<C-g>u\<CR>"
else
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif
"       " GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gI <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)"
"     "




Plug 'Chiel92/vim-autoformat'
 "

call plug#end()



"COLORSCHEME

let base16colorspace=250
colorscheme simple-dark

set background=dark
" True Color Support if it's avaiable in terminal
if has("termguicolors")
set termguicolors
endif
if has("gui_running")
set guicursor=n-v-c-sm:block,i-ci-ve:block,r-cr-o:blocks
endif"

"AIRLINE
let g:airline_theme='minimalist'
let g:airline#extensions#tabline#enabled = 1


"NERDTree  
autocmd VimEnter * NERDTree | wincmd p
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
let g:NERDTreeWinPos = "right" 
let g:NERDTreeWinSize=25 



" vim-autoformat
noremap <F3> :Autoformat<CR>

" " NCM2
augroup NCM2
autocmd!
"     " enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
"         " :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<cr>" : "\<CR>")
    inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
        inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['jedi']}
