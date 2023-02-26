" using powerline style on latest python3.10 version
set rtp+=$HOME/.local/lib/python3.10/site-packages/powerline/bindings/vim
" uncomment if you want to use python2.7 for powerline styling
"set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

"if exists(':python from powerline.vim')
"    set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/
"    python from powerline.vim import setup as powerline_setup
"    python powerline_setup()
"    python del powerline_setup
"endif

"set t_Co=256
set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call plug#begin()
"Plugs installed"
Plug 'scrooloose/nerdtree'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'spf13/vim-autoclose'
Plug 'scrooloose/syntastic'
Plug 'Shougo/unite.vim'
Plug 'tpope/vim-fugitive'
Plug 'chrisbra/csv.vim'
Plug 'othree/html5.vim'
Plug 'elzr/vim-json'
Plug 'StanAngeloff/php.vim'
Plug 'vim-scripts/SyntaxComplete'
Plug 'Valloric/YouCompleteMe'
Plug 'ryanoasis/vim-devicons'
"Plug 'Yggroot/indentLine'

"Colorscheme installed"
"Plug 'tomasr/molokai'
Plug 'jonathanfilip/vim-lucius'
"Plug 'AlessandroYorba/Sierra'
"Plug 'ninja/sky'
"Plug 'atelierbram/vim-colors_duotones'
Plug 'NLKNguyen/papercolor-theme'
"Plug 'atelierbram/vim-colors_atelier-schemes'
Plug 'gosukiwi/vim-atom-dark'
Plug 'arcticicestudio/nord-vim'
"Plug 'lanox/lanox-vim-theme'
"Plug 'scwood/vim-hybrid'
"Plug 'joshdick/onedark.vim'
"Plug 'mkarmona/materialbox'
"Plug 'jscappini/material.vim'
call plug#end()

let g:Powerline_symbols = 'fancy'

"Set colorscheme
"colorscheme molokai
"colorscheme PaperColor
"colorscheme atom-dark-256
colorscheme nord
"colorscheme lucius
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


filetype Plug indent on

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

"highlight LineNr ctermfg=239 ctermbg=235
"highlight CursorLineNR ctermfg=239
"highlight ColorColumn ctermbg=235
"highlight Search ctermbg=240 ctermfg=248

let g:ctrlp_map = '<BS>'
let php_sql_query = 1
let php_htmlInStrings = 1
let g:html5_event_handler_attributes_complete = 0
let g:html5_rdfa_attributes_complete = 0
let g:html5_aria_attributes_complete = 0
let g:indentLine_noConcealCursor=""

"Shortcuts
map <C-t> :NERDTreeToggle<CR>
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
