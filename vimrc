"""""""""""""""""""""""""""""" Vbundle 配置 """""""""""""""""""""""""""""""""
set nocompatible
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
Plugin 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plugin 'vim-syntastic/syntastic'

Plugin 'majutsushi/tagbar'
Plugin 'easymotion/vim-easymotion'
Plugin 'surround.vim'
Plugin 'the-NERD-tree'
Plugin 'mbbill/undotree'
Plugin 'Yggdroot/LeaderF'
Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'rust-lang/rust.vim'

" Plugin 'tpope/vim-fugitive'
" Plugin 'Shougo/neosnippet.vim'
" Plugin 'Shougo/neocomplete.vim'

" Git plugin not hosted on GitHub
" Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
" Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
" Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
" To ignore plugin indent changes, instead use:
filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" You Complete me
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" gotags
let g:tagbar_type_go = {
	\ 'ctagstype' : 'go',
	\ 'kinds'     : [
		\ 'p:package',
		\ 'i:imports:1',
		\ 'c:constants',
		\ 'v:variables',
		\ 't:types',
		\ 'n:interfaces',
		\ 'w:fields',
		\ 'e:embedded',
		\ 'm:methods',
		\ 'r:constructor',
		\ 'f:functions'
	\ ],
	\ 'sro' : '.',
	\ 'kind2scope' : {
		\ 't' : 'ctype',
		\ 'n' : 'ntype'
	\ },
	\ 'scope2kind' : {
		\ 'ctype' : 't',
		\ 'ntype' : 'n'
	\ },
	\ 'ctagsbin'  : 'gotags',
	\ 'ctagsargs' : '-sort -silent'
\ }

map <silent> <F9> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDTreeWinPos=0      " 在右侧显示
let NERDTreeWinSize=25    " 设置宽度
let NERDTreeShowBookmarks=0   " 是否显示书签
let NERDTreeShowHidden=0  " 显示隐藏文件
let NERDChristmasTree=0
map <silent> <F8> :NERDTreeToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Undotree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent> <F10> :UndotreeToggle<CR>
set backup
set undofile
set undodir=~/.undodir
set backupdir=~/.bkdir

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" airline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='violet'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easy motion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>j <Plug>(easymotion-prefix)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf 快速查找文件
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=/usr/local/opt/fzf
map <leader>sf :FZF<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" custom config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set cc=80
highlight ColorColumn ctermbg=8

set backspace=indent,eol,start

" 解决中文文件乱码
set fileencodings=utf-8,gbk,gbk2312,cp936

" 显示行号
set number

" 可以暂时不保存当前缓存
set hidden

set hls
set is
filetype on
filetype plugin on
filetype indent on 
syntax on

set ts=4
set sw=4
" set expandtab
set autoindent

" set foldmethod=syntax

" map Leader
let mapleader=' '

" quickfix list
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprevious<CR>

" location list
nnoremap <leader>ln :lnext<CR>
nnoremap <leader>lp :lprevious<CR>

" windows
nnoremap <leader>wc :close<CR>
nnoremap <leader>wo :only<CR>
nnoremap <leader>w+ <C-W>+
nnoremap <leader>w- <C-W>-
nnoremap <leader>w< <C-W><
nnoremap <leader>w> <C-W>>
nnoremap <leader>w= <C-W>=
" next window
nnoremap <leader>wp <C-W>p
" move to new tab
nnoremap <leader>wt <C-W>t 

nnoremap <leader>ws <C-W>s 
nnoremap <leader>wv <C-W>v 


" buffer
nnoremap <leader>bp :bprevious<CR>
nnoremap <leader>bn :bnext<CR>
nnoremap <leader>bl :ls<CR>

" vimrc 
nnoremap <leader>ve  :vsplit $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>

" clear seach highlight
nnoremap <leader>sc :nohlsearch<CR>

" command for format json
command! FormatJSON %!python -m json.tool

" sign
iabbrev cjl changjiulong@4paradigm.com

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Syntastic
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" errors
nnoremap <leader>en :lnext<CR>
nnoremap <leader>ep :lprevious<CR>
nnoremap <leader>el :Errors<CR>
nnoremap <leader>ec :SyntasticReset<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0


