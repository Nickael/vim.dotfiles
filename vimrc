set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

if exists(':python from powerline.vim')
    set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
    python from powerline.vim import setup as powerline_setup
    python powerline_setup()
    python del powerline_setup
endif

"set t_Co=256
set nocompatible              " be iMproved, required
filetype off                  " required




set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
"Plugins installed"
Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'spf13/vim-autoclose'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/unite.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'chrisbra/csv.vim'
Plugin 'othree/html5.vim'
Plugin 'elzr/vim-json'
Plugin 'StanAngeloff/php.vim'
Plugin 'vim-scripts/SyntaxComplete'
Plugin 'Valloric/YouCompleteMe'
"Plugin 'ryanoasis/vim-devicons'
Plugin 'Yggroot/indentLine'

"Colorscheme installed"
Plugin 'tomasr/molokai'
Plugin 'jonathanfilip/vim-lucius'
"Plugin 'AlessandroYorba/Sierra'
"Plugin 'ninja/sky'
"Plugin 'atelierbram/vim-colors_duotones'
"Plugin 'NLKNguyen/papercolor-theme'
"Plugin 'atelierbram/vim-colors_atelier-schemes'
"Plugin 'gosukiwi/vim-atom-dark'
"Plugin 'lanox/lanox-vim-theme'
"Plugin 'scwood/vim-hybrid'
"Plugin 'joshdick/onedark.vim'
"Plugin 'mkarmona/materialbox'
"Plugin 'jscappini/material.vim'
call vundle#end()

let g:Powerline_symbols = 'fancy'

"Set colorscheme
colorscheme molokai
" List of colorscheme
" sky
" sierra
" lucius
" PaperColor
" molokai
" atom-dark
" atom-dark-256
" lanox
" hybrid
" End list
" LuciusDark

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"delete spaces at end of line
autocmd BufWritePre !*.xml silent! %s/[\r \t]\+$//
" retab to replace tab by space when you write
autocmd BufWritePre *.php :set et|retab

"Fugitive autocommand
autocmd QuickFixCmdPost *grep* cwindow
" NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
    exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
    exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

"call NERDTreeHighlightFile('jade', 'green', 'none', 'green', '#151515')
"call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
"call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
"call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
"call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
"call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
"call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
"call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')


filetype plugin indent on

syntax enable

set anti
set autoread
set autoindent
set autowrite
"set background=dark
set backspace=indent,eol,start
set backupdir=~/.vim/tmp,.
set confirm
set copyindent
set cursorline
set colorcolumn=80
set directory=~/.vim/tmp,.
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set guioptions-=T               "remove toolbar
set guioptions-=r               "remove right-hand scroll bar
set guioptions-=L               "remove left-hand scroll bar"
set hidden
set history=700
set hlsearch
set incsearch
set ignorecase
set laststatus=2
set nobomb
set noshowmode
set nowrapscan
set number
set preserveindent
set ruler
set scrolloff=2
set shiftround
set shiftwidth=4
set showcmd
set showmatch
set showmode
set showtabline=2
set smartcase
set smartindent
"set term=screen-256color
"set t_ut=
set tabstop=4
set title                      " show title in console title bar"
set ttyfast
set visualbell
set wim=longest:full,full
set wildmenu
set wildmode=list:longest,full

if has('mouse')
    set mouse=a                 " Enable mouse
endif
if has("autocmd") && exists("+omnifunc")
    autocmd Filetype *
                \Filetypeif &omnifunc == "" |
                \Filetypeifsetlocal omnifunc=syntaxcomplete#Complete |
                \Completeendif
endif

highlight LineNr ctermfg=239 ctermbg=235
highlight CursorLineNR ctermfg=239
highlight ColorColumn ctermbg=235
highlight Search ctermbg=240 ctermfg=248


let g:ctrlp_map = '<BS>'
let php_sql_query = 1
let php_htmlInStrings = 1
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_aria_attributes_complete = 0
let g:indentLine_noConcealCursor=""

"Shortcuts
map <F2> :NERDTreeToggle<CR>
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>
noremap <F1> <NOP>
noremap <Space> :set hlsearch! hlsearch?<CR>

"nnoremap <Space> :buffers<CR>:buffer<Space>

nnoremap <silent> <Right> :bn<CR>
nnoremap <silent> <Left> :bp<CR>
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>
