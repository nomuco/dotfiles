if &compatible
  set nocompatible
endif

set runtimepath+=~/dotfiles/vimfiles/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.cache/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})

call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neocomplete.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet')
call dein#add('fatih/vim-go')

call dein#end()

if dein#check_install()
    call dein#install()
endif

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/

filetype plugin indent on

" matchit {{{
" if や for などの文字にも%で移動できるようになる
source $VIMRUNTIME/macros/matchit.vim
let b:match_ignorecase = 1
" }}}

" set t_Co=256は256色対応のターミナルソフトでのみ作用する
set t_Co=256

syntax on

colorscheme desert

" ターミナルの右端で文字を折り返さない
set nowrap

" tempファイルを作らない。編集中に電源落ちまくるし、とかいう人はコメントアウトで
set noswapfile

" ハイライトサーチを有効にする。
set hlsearch

" 大文字小文字を区別しない(検索時)
set ignorecase

" ただし大文字を含んでいた場合は大文字小文字を区別する(検索時)
set smartcase

" 改行時にインデントを引き継いで改行する
set autoindent

" カーソル位置が右下に表示される
set ruler

" 行番号を付ける
set number

" タブ文字の表示 ^I で表示されるよ
set list

" コマンドライン補完が強力になる
set wildmenu

" コマンドを画面の最下部に表示する
set showcmd

" インデントにつかわれる空白の数
set shiftwidth=4

" <Tab>押下時の空白数
set softtabstop=4

" <Tab>押下時に<Tab>ではなく、ホワイトスペースを挿入する
set expandtab

" <Tab>が対応する空白の数
set tabstop=4

set smarttab

set clipboard=unnamed

" インクリメント、デクリメントを16進数にする(0x0とかにしなければ10進数です。007をインクリメントすると010になるのはデフォルト設定が8進数のため)
set nf=hex
" マウス使えます
set mouse=a


let g:go_list_type = "quickfix"

" :wを自動化
set autowrite

map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" インサートモードの時に C-j でノーマルモードに戻る
imap <C-j> <esc>
" [ って打ったら [] って入力されてしかも括弧の中にいる(以下同様)
imap [ []<left>
imap ( ()<left>
imap { {}<left>

" ２回esc を押したら検索のハイライトをヤメる
nmap <Esc><Esc> :nohlsearch<CR><Esc>
" }}}
