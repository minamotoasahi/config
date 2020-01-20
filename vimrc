filetype off
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'Yggdroot/indentLine'
Plug 'Yggdroot/LeaderF'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Plug 'whatyouhide/vim-gotham'
Plug 'altercation/vim-colors-solarized'

" Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'justinmk/vim-dirvish'

Plug 'ycm-core/YouCompleteMe', { 'do': './install.py' }
Plug 'derekwyatt/vim-fswitch'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Shougo/echodoc.vim'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'python'] }
Plug 'sgur/vim-textobj-parameter'

" Plugin 'airblade/vim-gitgutter'
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif

" Initialize plugin system
call plug#end()

" map Leader
let mapleader=' '


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" custom config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
highlight LineNr ctermbg=none
highlight LineNr ctermfg=grey

set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set cc=80
" highlight ColorColumn ctermbg=8
set backspace=indent,eol,start

" 解决中文文件乱码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

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
set expandtab

" quickfix list
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprevious<CR>

" location list
nnoremap <leader>ln :lnext<CR>
nnoremap <leader>lp :lprevious<CR>

" windows
nnoremap <leader>wc :close<CR>
nnoremap <leader>wo :only<CR>
nnoremap <leader>wj <C-W>j
nnoremap <leader>wk <C-W>k
nnoremap <leader>wh <C-W>h
nnoremap <leader>wl <C-W>l

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
nnoremap <leader>bd :bdelete<CR>

" vimrc 
nnoremap <leader>ve  :split $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>

" command for format json
command! FormatJSON %!python -m json.tool

" sign
iabbrev cjl changjiulong@baidu.com

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent> <F9> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" let NERDTreeWinPos=0      " 在右侧显示
" let NERDTreeWinSize=25    " 设置宽度
" let NERDTreeShowBookmarks=0   " 是否显示书签
" let NERDTreeShowHidden=0  " 显示隐藏文件
" let NERDChristmasTree=0
" map <silent> <F8> :NERDTreeToggle<CR>

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
set t_Co=256
let g:airline_theme='badwolf'
"let g:airline_solarized_bg='dark'
"let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" easy motion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map <leader>j <Plug>(easymotion-prefix)
nmap <Leader>jw <Plug>(easymotion-overwin-w)
nmap <Leader>jl <Plug>(easymotion-overwin-line)
nmap <Leader>jc <Plug>(easymotion-overwin-f)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" don't show the help in normal mode
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 0
" popup mode
let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1
let g:Lf_StlSeparator = { 'left': "\ue0b0", 'right': "\ue0b2", 'font': "DejaVu Sans Mono for Powerline" }
let g:Lf_PreviewResult = {'Function': 0, 'BufTag': 0 }

let g:Lf_CommandMap = {'<C-K>': ['<C-P>'], '<C-J>': ['<C-N>']}
let g:Lf_RootMarkers = ['.project', '.git']
let g:Lf_WorkingDirectoryMode = 'Ac'

let g:Lf_ShortcutF = "<leader>ff"
let g:Lf_PythonVersion = "3"
noremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>
noremap <leader>fm :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>
noremap <leader>ft :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
noremap <leader>fl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>

nnoremap <leader>ss :Leaderf rg -F --stayOpen<CR>
nnoremap <leader>sw :<C-U><C-R>=printf("Leaderf! rg --current-buffer -e %s ", expand("<cword>"))<CR>
nnoremap <leader>sW :<C-U><C-R>=printf("Leaderf! rg -e %s ", expand("<cword>"))<CR>

" search visually selected text literally
xnoremap <leader>sv :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap <leader>so :<C-U>Leaderf! rg --recall<CR>

" search tags
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>tr :<C-U><C-R>=printf("Leaderf! gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>td :<C-U><C-R>=printf("Leaderf! gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>tt :<C-U><C-R>=printf("Leaderf! gtags --recall %s", "")<CR><CR>
noremap <leader>tn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>tp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Solarized
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable
set background=dark
" colorscheme gotham
colorscheme solarized
let g:solarized_termcolors=256

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ycm_server_python_interpreter='/home/changjiulong/.jumbo/bin/python3.6'
let g:ycm_extra_conf_vim_data = ['&filetype']
let g:ycm_global_ycm_extra_conf='/home/changjiulong/.vim/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0
" let g:ycm_seed_identifiers_with_syntax=1
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_key_invoke_completion = '<c-z>'
noremap <c-z> <NOP>
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_show_diagnostics_ui = 0
let g:ycm_server_log_level = 'info'
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
let g:ycm_semantic_triggers =  {
			\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
			\ 'cs,lua,javascript': ['re!\w{2}'],
			\ }
let g:ycm_filetype_whitelist = { 
			\ "c":1,
			\ "cpp":1, 
			\ "sh":1,
			\ "zsh":1,
			\ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fswitch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>gg :FSHere<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Signify
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set updatetime=100
nmap <leader>hn <plug>(signify-next-hunk)
nmap <leader>hp <plug>(signify-prev-hunk)

nnoremap <leader>hl :SignifyDiff<CR>
nnoremap <leader>hd :SignifyHunkDiff<CR>
nnoremap <leader>hu :SignifyHunkUndo<CR>
" nmap <leader>hJ 9999<leader>gj
" nmap <leader>hK 9999<leader>gk
" Hunk text object
omap ih <plug>(signify-motion-inner-pending)
xmap ih <plug>(signify-motion-inner-visual)
omap ah <plug>(signify-motion-outer-pending)
xmap ah <plug>(signify-motion-outer-visual)

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" echodoc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noshowmode
let g:echodoc_enable_at_startup = 1


