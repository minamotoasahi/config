
filetype off
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-surround'
Plug 'mbbill/undotree'
Plug 'preservim/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'Yggdroot/indentLine'

Plug 'altercation/vim-colors-solarized'

Plug 'justinmk/vim-dirvish'

Plug 'ycm-core/YouCompleteMe'
Plug 'derekwyatt/vim-fswitch'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Shougo/echodoc.vim'

Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'python'] }
Plug 'sgur/vim-textobj-parameter'

Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plug 'honza/vim-snippets'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" Plugin 'airblade/vim-gitgutter'
if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
" git blame
Plug 'zivyangll/git-blame.vim'

" Initialize plugin system
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" custom config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" map Leader
let mapleader=' '

set history=50      " keep 50 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " display incomplete commands
set cc=80
highlight ColorColumn ctermbg=8
set backspace=indent,eol,start

set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8

set number
set hidden
set hls
set is
filetype on
filetype plugin on
filetype indent on 
syntax on

set ts=4
set sts=4
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
nnoremap <leader>ve :e $MYVIMRC<CR>
nnoremap <leader>vs :source $MYVIMRC<CR>

" command for format json
command! FormatJSON %!python -m json.tool

" sign
iabbrev cjl changjiulong@baidu.com

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
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1
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
" Leaderf fzf
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" don't show the help in normal mode
let g:Lf_ShowDevIcons = 0
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

let g:Lf_RootMarkers = ['.project']
let g:Lf_WorkingDirectoryMode = 'A'

let g:Lf_ShortcutF = "<leader>ff"
let g:Lf_PythonVersion = "3"
nnoremap <leader>fb :<C-U><C-R>=printf("Leaderf buffer %s", "")<CR><CR>

nnoremap <leader>sl :<C-U><C-R>=printf("Leaderf line %s", "")<CR><CR>
nnoremap <leader>st :<C-U><C-R>=printf("Leaderf bufTag %s", "")<CR><CR>
nnoremap <leader>ss :Leaderf rg<CR>
nnoremap <leader>sw :<C-U><C-R>=printf("Leaderf! rg -e %s", expand("<cword>"))<CR><CR>
" search visually selected text literally
xnoremap <leader>sv :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR><CR>
nnoremap <leader>so :<C-U>Leaderf! rg --recall<CR>

" search tags
let g:Lf_GtagsAutoGenerate = 0
let g:Lf_Gtagslabel = 'native-pygments'
noremap <leader>tr :<C-U><C-R>=printf("Leaderf gtags -r %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>td :<C-U><C-R>=printf("Leaderf gtags -d %s --auto-jump", expand("<cword>"))<CR><CR>
noremap <leader>to :<C-U><C-R>=printf("Leaderf gtags --recall %s", "")<CR><CR>
noremap <leader>tn :<C-U><C-R>=printf("Leaderf gtags --next %s", "")<CR><CR>
noremap <leader>tp :<C-U><C-R>=printf("Leaderf gtags --previous %s", "")<CR><CR>
noremap <leader>tt :LeaderfBufTag<CR>
noremap <leader>tf :LeaderfFunction<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Tagbar
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"map <silent> <leader>tt :TagbarToggle<CR>
"let g:tagbar_width = 60

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let g:ycm_use_clangd = 1
"let g:ycm_clangd_binary_path = '/home/changjiulong/myApp/llvm82/bin/clangd'
let g:ycm_global_ycm_extra_conf='/home/changjiulong/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_extra_conf_globlist = ['/home/changjiulong/.vim/*']
"let g:ycm_always_populate_location_list = 1
let g:ycm_show_diagnostics_ui = 0
set completeopt=
nnoremap gd :YcmCompleter GoTo<CR>
nnoremap gr :YcmCompleter GoToReferences<CR>
nnoremap gc :YcmCompleter GoToDeclaration<CR>
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_key_list_stop_completion = ['<C-y>']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" snip
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" If you want :UltiSnipsEdit to split your window.
" let g:UltiSnipsEditSplit="vertical"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fswitch
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>gg :FSHere<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Signify and Git-blame
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

nnoremap <leader>gb :<C-u>call gitblame#echo()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" echodoc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set noshowmode
let g:echodoc_enable_at_startup = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" textobj
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vim_textobj_parameter_mapping = ','

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" indentLine
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>ii :IndentLinesToggle<CR>

syntax enable
set background=dark
colorscheme solarized

" proto file setting -----------------------{{{
function! ValidProtoMessage()
  if search('{', 'b') == 0
    return
  endif
  let start = line('.') + 1
  if search('}') == 0
    return
  endif
  let end = line('.') - 1

  let no = 1
  for l_nu in range(start, end)
    let line = getline(l_nu)
    if line =~? '\v^\s*$'
      continue
    endif
    execute 'silent normal! ' . l_nu . 'G'
    execute 'silent normal! 0f=belC = ' . no . ';'
    let no += 1
  endfor
endfunction

augroup filetype_proto
    autocmd!
    autocmd FileType proto nnoremap <buffer> <leader>xm :call ValidProtoMessage()<CR>
augroup END
" }}}

" VimScript file setting -----------------------{{{
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" C++ file setting -----------------------{{{
function! CppHeader()
    let lst = ["// Copyright (c) 2021 Baidu.com, Inc. All Rights Reserved",
              \"// ",
              \"// Authors: Jiulong Chang (changjiulong@baidu.com)",
              \"// Date: " . strftime('%Y/%m/%d %T')]
    let failed = append(0, lst)
    if !failed
        echom 'Error'
    endif
endfunction

function! MacroFormat()
    execute 'silent normal! {'
    let b = line('.')
    if empty(getline(b))
        let b += 1
    endif
    execute 'silent normal! }'
    let e = line('.')
    if empty(getline(e))
        let e -= 1
    endif
    let max = 0
    for lnu in range(b, e)
        let ln = getline(lnu)
        if ln[-1:] ==# '\'
            let ln = ln[:-2]
        endif
        while ln[-1:] ==# ' '
            let ln = ln[:-2]
        endwhile
        call setline(lnu, ln)
        let sz = len(ln)
        if sz > max
            let max = sz
        endif
    endfor
    let max += 1
    let e -= 1
    for lnu in range(b, e)
        let ln = getline(lnu)
        let sz = len(ln)
        for i in range(sz, max)
            let ln = ln . ' '
        endfor
        let ln = ln . '\'
        call setline(lnu, ln)
    endfor
endfunction

augroup filetype_cpp
    autocmd!
    autocmd FileType c,cpp nnoremap <buffer> <leader>xm  v100<>>0f(F f:xbdf:f)lC;<esc>
    autocmd FileType c,cpp nnoremap <buffer> <leader>xf  v100<f)lC;<esc>
    autocmd FileType c,cpp nnoremap <buffer> <leader>ah  :call CppHeader()<CR>
    autocmd FileType c,cpp nnoremap <buffer> <leader>xd  :call MacroFormat()<CR>
augroup END
" }}}

