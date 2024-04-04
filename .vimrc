call plug#begin()

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

Plug 'neoclide/coc.nvim', {'branch': 'release'}

"Plug 'jiangmiao/auto-pairs'

Plug 'gruvbox-community/gruvbox'

Plug 'joshdick/onedark.vim'

Plug 'tribela/vim-transparent'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'jackguo380/vim-lsp-cxx-highlight'

call plug#end()


"copy and paste
vnoremap <C-c> "+y
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

"nerdtree
nmap <F6> :NERDTreeToggle<CR>

inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

"turns lsp_cxx
let g:lsp_cxx_hl_use_text_props = 1
let g:coc_default_semantic_highlight_groups = 1

"turns on/off coc
let b:coc_enabled=1
"Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Disable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 0

"airline themes
set termguicolors
let g:airline_solarized_bg='light'
colorscheme gruvbox

"bind splits navigation to CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"bind resize
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

"change 2 splits from vert to hor or hor to vert
"<Leader> usually means '\' key
map <Leader>th <C-w>t<C-w>H
map <Leader>tk <C-w>t<C-w>K


set tabstop=4
set ignorecase
set shiftwidth=4  
set expandtab       
set number
set hlsearch
set incsearch
set cursorline
set splitbelow splitright
syntax on
