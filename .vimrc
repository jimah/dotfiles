" PLUGINS
if &compatible
        set nocompatible               " Be iMproved
endif

call plug#begin('~/.vim/plugged')

" Editor
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go'
Plug 'easymotion/vim-easymotion'

" Themes
Plug 'w0ng/vim-hybrid'
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'altercation/vim-colors-solarized'
Plug 'chriskempson/base16-vim'
Plug 'dracula/vim'

" Golang
Plug 'fatih/vim-go'

" Python
Plug 'davidhalter/jedi-vim'
Plug 'zchee/deoplete-jedi'

" Ruby
Plug 'tpope/vim-rails'

" Javascript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Elixir

Plug 'elixir-lang/vim-elixir'

" Utility
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/syntastic'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'vim-scripts/BufOnly.vim'
Plug 'vim-scripts/indentpython.vim'

call plug#end()

filetype plugin indent on

" BASE

syntax on
set encoding=utf-8
set background=dark

"let base16colorspace=256
"let g:hybrid_custom_term_colors = 1
"let g:hybrid_reduced_contrast = 1 " Remove this line if using the default palette.
if (has("termguicolors"))
    "set termguicolors
endif


set t_Co=256
colorscheme solarized
"colorscheme dracula
"colorscheme base16-ocean
"colorscheme base16-default
"colorscheme hybrid
"colorscheme material-theme
"colorscheme gruvbox
"colorscheme OceanicNext
"colorscheme gotham
"colorscheme nord

let mapleader = ","

" Toggle light/dark background
map <Leader>bg :let &background = ( &background == "dark"? "light" : "dark" )<CR>

" Jumping around split panes
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Navigating split windows
nnoremap <leader>wj <C-W><C-J>
nnoremap <leader>wk <C-W><C-K>
nnoremap <leader>wl <C-W><C-L>
nnoremap <leader>wh <C-W><C-H>

" Splitting windows
nnoremap <leader>wv :vsp<CR>
nnoremap <leader>ws :spl<CR>

" List open buffers
nnoremap <leader>l :ls<CR>:b
" Close all buffers except this one
nnoremap <leader>B :BufOnly<CR>

set splitright
set splitbelow

" Quickfix navigation
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" Standard stuff
set number
set ruler
set nowrap

" Tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
autocmd Filetype javascript setlocal ts=2 sw=2

" Making search a bit more sensible
set ignorecase
set smartcase
set hlsearch
set incsearch

" Fuck bells
set noerrorbells
set novisualbell

" Maintain commands
set showcmd
set laststatus=1
set showmode

" Ignore vendor folders in search
set wildignore+=*/vendor/**

" Reloads files modified outside of vim
set autoread

" Scroll offset
set so=7

set mouse=a

" PLUGIN CONFIG

" Ctrlp
nnoremap <leader>p :CtrlP<CR>
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" NERDTree
let NERDTreeIgnore=['\~$', '\.swp$', '\.DS_Store$', '\.\.$', '\.$', '\~$', '\.pyc$']
let NerdTreeMinimalUi=1
let NERDTreeShowHidden=1

nnoremap <leader>\ :NERDTreeToggle<CR>

" Airline
let g:airline_powerline_fonts = 1
let g:airline_section_y = '%{strftime("%c")}'
let g:airline#extensions#syntastic#enabled = 1
let g:airline_left_sep=''
let g:airline_right_sep=''

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 3
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

let g:syntastic_go_checkers = ['golint', 'govet', 'errcheck']
let g:syntastic_mode_map = { 'mode': 'active' }
" Enable this if vim starts lagging on save
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }

" Bit of a hack for syntastic to understand vim-go GOPATHs
au FileType go let $GOPATH = go#path#Detect()

" TagBar
nnoremap <leader>; :TagbarToggle<CR>

" Deoplete & Deoplete-go
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#align_class = 1

" Javascript
let g:jsx_ext_required = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:javascript_plugin_jsdoc = 1

" SASS
let g:syntastic_scss_checkers = ['scss_lint']

" Python
let g:syntastic_python_checkers = ['flake8']

" Tern
let g:tern_map_keys = 1
let g:tern_show_argument_hints = 'on_move'
let g:tern_show_signature_in_pum = 1

" Go
" Syntax highlighting
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1

" Run goimports
let g:go_fmt_command = "goimports"

" Run linter on save
let g:go_metalinter_autosave = 1

" Update status line with type info
let g:go_auto_type_info = 1
set updatetime=100

autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4 

autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <leader>d  :GoDef<CR>
autocmd FileType go nmap <leader>gd  :GoDeclsDir<CR>
autocmd FileType go nmap <leader>ga  :GoAlternate<CR>
autocmd FileType go nmap <leader>t   :GoTest<CR>

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#cmd#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

" Typescript
autocmd BufNewFile,BufRead *.tsx set filetype=typescript.tsx

