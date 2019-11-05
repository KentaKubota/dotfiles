"*************************************************
"全角スペース可視化
"augroup highlightIdegraphicSpace
"  autocmd!
"  autocmd Colorscheme * hi IdeographicSpace term=underline ctermbg=DarkGreen guibg=DarkGreen
"  autocmd VimEnter,WinEnter * match IdeographicSpace /　/
"augroup END

"*************************************************
"Setting of auto saveing
set autowrite
set updatetime=500

function s:AutoWriteIfPossible()
  if &modified && !&readonly && bufname('%') !=# '' && &buftype ==# '' && expand("%") !=# ''
    write
  endif
endfunction

autocmd CursorHold * call s:AutoWriteIfPossible()
autocmd CursorHoldI * call s:AutoWriteIfPossible()

"*************************************************
"Setting of Bundle
set nocompatible
filetype off

if has('vim_starting')
    set runtimepath+=~/.vim/bundle/neobundle.vim
    call neobundle#begin(expand('~/.vim/bundle/'))
    NeoBundle 'scrooloose/nerdtree'
    NeoBundle 'Shougo/unite.vim'
    NeoBundle 'aereal/vim-colors-japanesque'
    NeoBundle 'toyamarinyon/vim-swift'
    NeoBundle 'apple/swift'
    call neobundle#end()
endif

filetype plugin indent on

"Setting of NERD_tree
nnoremap W <C-w>w
nnoremap <silent>F :NERDTreeToggle<CR>
"*************************************************
"Automatic complementation
set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap " . k . " " . k . "<C-N><C-P>"
endfor

imap <expr> <TAB> pumvisible() ? "\<Down>" : "\<Tab>"

"*************************************************
"Setting of Vundle 
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'itchyny/lightline.vim'

call vundle#end()            " required
filetype plugin indent on    " required

set t_Co=256
"set ambiwidth=double



let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'fugitive', 'readonly', 'path', 'modified' ] ],
      \ },
      \ 'component_function': {
      \   'path': 'Path'
      \ },
      \ 'separator': { 'left': '', 'right': '' },
      \ 'subseparator': { 'left': '', 'right': '' }
      \ }


    function! Path()
        let b = substitute(expand('%:p'), $HOME, '~', '')
        let path_list = split(b,'/')
        if 2 < len(path_list)
            return join([path_list[-3], path_list[-2], path_list[-1]], '  ')
        else
            return join([path_list[-2], path_list[-1]], '  ')
      endfunction
"*************************************************
"setting the colorscheme

 syntax on
 colorscheme molokai   

    hi String ctermfg=darkred " < > in include 
    hi Include ctermfg=126  " include 
    hi Comment ctermfg=25  " comment out
    hi Structure ctermfg=2 " class 
    hi Statement ctermfg=130 " public,private in class 
    hi Type ctermfg=2  " void  and int
    hi Number ctermfg=darkred  " number
    hi Float ctermfg=darkred  " number
    hi Boolean ctermfg=darkred  " false true
    hi cConstant ctermfg=darkred  " NULL
    hi conditional ctermfg=130  " if
    hi Exception ctermfg=130  " try
    hi SpecialChar ctermfg=126 " %d
    hi StorageClass ctermfg=2 " static
    hi Repeat ctermfg=130 " for
    hi Visual  ctermbg=235 "23 " visual mode
    hi Search      ctermfg=cyan ctermbg=12 "4 
    hi LineNr      ctermfg=darkgreen
    hi WarningMsg  ctermfg=Yellow

    "hi MatchParen  term=reverse ctermbg=12 guibg=Cyan

    hi MatchParen  term=reverse ctermfg=14 ctermbg=12 guifg=#FFFFFF guibg=Cyan


    "hi Identifier  term=standout ctermfg=224 guifg=Orange "swift main color


    "hi Identifer ctermbg=green
    "hi Function ctermbg=green

    "hi Typedef ctermbg=green
    "hi Special ctermbg=green

    "hi Label ctermbg=green

    "hi Operator ctermbg=green
    "hi Keyword ctermbg=green






    "hi Statement  ctermbg=green " public private
    " hi PreCondit ctermfg=Yellow
    " hi Macro ctermfg=Yellow


 "*************************************************


 set noswapfile
 set laststatus=2  " Output Status line 
 set updatetime=0  "swapを作るまでの時間m秒
 set number
 set title

 set tabstop=4
 set shiftwidth=4
 set smarttab
 set expandtab

 set smartindent
 set cindent 
 set nrformats-=octal
 set hidden
 set history=500
 set virtualedit=block
 set whichwrap=b,s,[,],<,>
 set backspace=indent,eol,start
 set hlsearch
 set whichwrap=b,s,h,l,<,>,[,]  " iminaikamo?
 set incsearch "for search
 set listchars=tab:>\ ,extends:< "Tab setting ?
 set showmatch " () {} []
 "set scrolloff=999 "fix cursor centor
 set scrolloff=16 "fix cursor centor
 set fileformat=unix "\n change format unix
 set nowrap "Cousor Movement
 set linebreak
 "set ambiwidth=double
 set clipboard=unnamedplus "for using clipboard
 set clipboard=unnamed,autoselect
 set clipboard=unnamedplus
 " mac settings
 set clipboard+=unnamed

 set wrap "for return of sentence

"python setting
 autocmd FileType python setl autoindent
 autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
 autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4
"*************************************************

 map n nzz
 map N Nzz
"検索結果を今のものから検索し始める
 map * *Nzzh 
 map # #zz




"O conversion Newline
 nnoremap <backspace> i<backspace><ESC>l



"O conversion Newline
" nnoremap <silent> O :<C-u>call append(expand('.'), '')<Cr>j
 nnoremap O A<return><ESC>k


"P conversion <space>
 nnoremap P i<Space><ESC>

"Comment out
" nnoremap Z 0wi//<ESC>


"Annotation input comment out backline
" nnoremap Zz A // 

"Annotation input comment out backline
" nnoremap Zz A // 
" nnoremap Zz 0i/*****          *****/<ESC>10hi

"Function comment input 
" nnoremap ZZ 0i/*****          *****/<ESC>10hi

"All line copy 
 nnoremap <C-c> ggVGy



 nnoremap Z 0i************************************************************<return>・
 nnoremap X 0i------------------------------<ESC>0
 nnoremap C 0i------------<ESC>0
 "nnoremap C 0i    ------------<ESC>0

"Setting of tab 
 nnoremap L gt
 nnoremap H gT



"*****************************
"tag shortcut
nnoremap t /tag<Enter>

"*****************************

 noremap h b
 noremap b h
 noremap l w
 noremap w l

"*****************************

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

"*****************************
 noremap o 0
 noremap e $

"high light () 
" hi MatchParen ctermbg=4

"*****************************

" jjでエスケープして上書き保存
"inoremap jj <Esc>:w<Enter>
inoremap jj <Esc>

inoremap ｊｊ <Esc>
"*****************************
" remove no use space  ex  printf;'     '  -> printf;''
:command! RmWhiteSpace :%s/; *$/;/


"*****************************

"大文字小文字を区別しない
set ignorecase

"大文字で検索されたら対象を大文字限定にする
set smartcase




"*****************************

" F5キーでコマンド履歴を開く
" F6キーで検索履歴を開く
":nnoremap <F5> <CR>q:
":nnoremap <F6> <CR>q/
" q:、q/、q? は無効化
":nnoremap q: <NOP>
":nnoremap q/ <NOP>
":nnoremap q? <NOP>
"*****************************

"NERD_tree mapping
"nnoremap T <NOP>
"nnoremap t T

"*****************************



"ノーマルモード時だけ;と:を入れ替える
nnoremap ; :
nnoremap : ;

nnoremap R <NOP>



"ビジュアルモード選択した部分を*で検索できる。これはかなり便利です。
vnoremap * "zy:let @/ = @z<CR>n

"setting for iterm 
set mouse=a
"for crontab setting
set backupskip=/tmp/*,/private/tmp/*


