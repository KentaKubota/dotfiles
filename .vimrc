"*************************************************
"自動保存設定
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
"予測変換設定
set completeopt=menuone
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
  exec "imap " . k . " " . k . "<C-N><C-P>"
endfor

imap <expr> <TAB> pumvisible() ? "\<Down>" : "\<Tab>"


"*************************************************
"カラースキーム設定

syntax on
"colorscheme molokai

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
hi MatchParen  term=reverse ctermfg=14 ctermbg=12 guifg=#FFFFFF guibg=Cyan

"*************************************************

set noswapfile
set laststatus=2  " Output Status line
set updatetime=0  "swapを作るまでの時間m秒
set number
set title

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
set scrolloff=16 "fix cursor centor
set fileformat=unix "\n change format unix
set nowrap "Cousor Movement
set linebreak
set clipboard=unnamedplus "for using clipboard
set clipboard=unnamed,autoselect
set clipboard=unnamedplus
set clipboard+=unnamed
set wrap "for return of sentence

set mouse=a  "setting for iterm
set backupskip=/tmp/*,/private/tmp/*  "for crontab setting
"set virtualedit=onemore  " 行末の1文字先までカーソルを移動できるように
set ignorecase      "大文字小文字を区別しない
set smartcase       " 検索文字列に大文字が含まれている場合は区別して検索する

"タブ設定
set tabstop=4       "画面上で表示する1つのタブの幅
set shiftwidth=4    "自動インデントでのインデントの長さ
set softtabstop=4  "いくつの連続した空白を1回で削除できるようにするか
set expandtab       " Tab文字を半角スペースにする
set autoindent      "改行した時に自動でインデントします
set smarttab        "行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする。
set smartindent     "{があると次の行は自動で1段深く自動インデントしてくれる

augroup fileTypeIndent
    autocmd!
    autocmd BufNewFile,BufRead *.md setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab smartindent
    autocmd BufNewFile,BufRead *.sh setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab smartindent autoindent
    autocmd BufNewFile,BufRead *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab smartindent autoindent
    autocmd BufNewFile,BufRead *.yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smartindent autoindent
    autocmd BufNewFile,BufRead *.yml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smartindent autoindent
    autocmd BufNewFile,BufRead *.rb setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smartindent autoindent
    autocmd BufNewFile,BufRead *.erb setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab smartindent autoindent
augroup END

"*************************************************

map n nzz
map N Nzz

map * *Nzzh
map # #zz
nnoremap <backspace> i<backspace><ESC>l
"大文字のOで改行
nnoremap O A<return><ESC>k
"大文字のPで1文字空白
nnoremap P i<Space><ESC>
"全ての行をコピー
nnoremap <C-c> ggVGy
nnoremap Z 0i************************************************************<return>・
nnoremap X 0i------------------------------<ESC>0
nnoremap C 0i------------<ESC>0

"ノーマルモード時だけ;と:を入れ替える
nnoremap ; :
nnoremap : ;
nnoremap R <NOP>
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap L gt
nnoremap H gT
"tag shortcut
nnoremap t /tag<Enter>
noremap h b
noremap b h
noremap l w
noremap w l
noremap o 0
noremap e $
" jjでエスケープして上書き保存
inoremap jj <Esc>

"ビジュアルモード選択した部分を*で検索
vnoremap * "zy:let @/ = @z<CR>n

" remove no use space  ex  printf;'     '  -> printf;''
:command! RmWhiteSpace :%s/; *$/;/
