call plug#begin()

if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'tag': 'legacy' }
endif

Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }

if executable('node')
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
endif

Plug 'jiangmiao/auto-pairs'

Plug 'gruvbox-community/gruvbox'

Plug 'joshdick/onedark.vim'

Plug 'tribela/vim-transparent'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'jackguo380/vim-lsp-cxx-highlight'

call plug#end()

" Use tab for trigger completion with characters ahead and navigate.
" Insert <tab> when previous text is space, refresh completion if not.
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr> <S-Tab> coc#pum#visible() ? coc#pum#prev(1) : "\<S-Tab>"

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

"copy and paste
vnoremap <C-c> "+y
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa

"auto-pairs
let g:AutoPairsFlyMode = 0

"nerdtree
nmap <F6> :NERDTreeToggle<CR>

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

" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>qf  <Plug>(coc-fix-current)


" COC config
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

" Disable function highlighting (affects both C and C++ files)
let g:cpp_function_highlight = 1

"airline themes
set termguicolors
"let g:airline_solarized_bg='light'
"colorscheme onedark
colorscheme gruvbox
set bg=dark

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

" change cursor style
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END

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
