
" ---------------------------------------
let mapleader = " "

map J 5j
map K 5k
map H ^
map L $


map sl :set splitright<CR>:vsplit<CR>
map sh :set nosplitright<CR>:vsplit<CR>
map sk :set nosplitbelow<CR>:split<CR>
map sj :set splitbelow<CR>:split<CR>

map <LEADER>h <C-w>h
map <LEADER>j <C-w>j
map <LEADER>k <C-w>k
map <LEADER>l <C-w>l

map <up> :res +5<cr>
map <down> :res -5<cr>
map <left> :vertical resize-5<cr>
map <right> :vertical resize+5<cr>

map zl :tabn<CR>
map zj :tabp<CR>

map tt :set splitright<CR>:vsplit<CR>:term<CR>i
tnoremap <esc> <C-\><C-N>

" -------------------------------------------
set nu
set wrap
set incsearch
set hlsearch
set ignorecase
set list
set scrolloff=5
set nocompatible
set listchars=tab:▶\ ,eol:$
set hidden
set updatetime=100
set shortmess+=c
set signcolumn=number

if has("termguicolors")
	set termguicolors
endif
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" -------------------------------------------
call plug#begin('~/.config/nvim/plugged')
Plug 'gcmt/wildfire.vim'
Plug 'tpope/vim-surround'
Plug 'sainnhe/everforest'
Plug 'liuchengxu/vista.vim'
Plug 'tpope/vim-commentary'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vim-airline/vim-airline'
Plug 'machakann/vim-highlightedyank'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()

" ---------------------------------------
set background=dark
colorscheme everforest
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0

nnoremap ss :Vista coc<CR>

inoremap <silent><expr> <TAB>
			\ coc#pum#visible() ? coc#pum#next(1):
			\ CheckBackspace() ? "\<Tab>" :
			\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
			\: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
function! CheckBackspace() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

nmap <c-d> :CocDiagnostics<CR>
nmap <silent> [p <Plug>(coc-diagnostic-prev)
nmap <silent> [p <Plug>(coc-diagnostic-next)
nnoremap <silent> sd :call ShowDocumentation()<CR>
function! ShowDocumentation()
	if CocAction('hasProvider', 'hover')
		call CocActionAsync('doHover')
	else
		call feedkeys('sd', 'in')
	endif
endfunction
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

noremap <C-f> :FZF<CR>
noremap <C-a> :Ag<CR>
" ---------------------------------------
let g:coc_global_extensions = [ "coc-explorer" ,
				\"coc-snippets",
				\"coc-clangd",
				\"coc-json",
				\"coc-python",
				\"coc-html",
				\"coc-css",
				\"coc-tsserver",
				\"coc-sh",
				\"coc-vimlsp"]


" ---------------------------------------
nnoremap ee :CocCommand explorer<CR>
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-n> <Plug>(coc-snippets-select)
let g:coc_snippet_next = '<c-n>'
let g:coc_snippet_prev = '<c-p>'
imap <C-n> <Plug>(coc-snippets-expand-jump)

