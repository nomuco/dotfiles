if has('vim_starting')
    set rtp+=~/dotfiles/vimfiles/vim-plug
    if !isdirectory(expand('~/dotfiles/vimfiles/vim-plug'))
        echo 'install vim-plug...'
        call system('mkdir -p ~/dotfiles/vimfiles/vim-plug')
        call system('git clone https://github.com/junegunn/vim-plug.git ~/dotfiles/vimfiles/vim-plug/autoload')
    end
endif

call plug#begin('~/dotfiles/vimfiles/vim-plug')
Plug 'junegunn/vim-plug',
        \ {'dir': '~/.vim/plugged/vim-plug/autoload'}
Plug 'ajmwagar/vim-deus'
call plug#end()

""""""""""""""""""""""
"     PluginConfs    "
""""""""""""""""""""""

" -----------------
"       THEME
" -----------------

set t_Co=256
"colorscheme 'ajmagar/vim-deus'"
set termguicolors
set background=dark
let g:deus_termcolors=256

" ----------------------------
"       File Management
" ----------------------------

""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""

filetype off                    " 最初にファイルタイプの検出をリセットする
filetype plugin indent on       " ファイルタイプの検出を有効化
" matchit {{{
" if や for などの文字にも%で移動できるようになる
source $VIMRUNTIME/macros/matchit.vim
let b:match_ignorecase = 1
" }}}
set ttyfast                     " Indicate fast terminal conn for faster redraw
set ttymouse=xterm2             " Indicate terminal type for mouse codes
set ttyscroll=3                 " Speedup scrolling
set laststatus=2                " Show status line always
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically read changed files
set autoindent                  " 改行時インデントを引き継ぐ
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " ハイライトサーチを有効化
set noerrorbells                " No beeps
set number                      " 行番号をつける
set nowrap                      " ターミナルの右端で文字を折り返さない
set showcmd                     " コマンドを画面の最下部に表示する
set noswapfile                  " tempファイルを作らない
set nobackup                    " Don't create annoying backup files
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set autowrite                   " Automatically save before :next, :make etc.
set hidden                      " Buffer should still exist if window is closed
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set noshowmatch                 " Do not show matching brackets by flickering
set noshowmode                  " We show the mode with airline or lightline
set ignorecase                  " 大文字小文字を区別しない(検索時)
set smartcase                   " ただし大文字を含んでいた場合は大文字小文字を区別
set completeopt=menu,menuone    " Show popup menu, even if there is one entry
set pumheight=10                " Completion window max size
set nocursorcolumn              " Do not highlight column (speeds up highlighting)
set nocursorline                " Do not highlight cursor (speeds up highlighting)
set lazyredraw                  " Wait to redraw
set ruler                       " カーソル位置が右下に表示される
set list                        " タブ文字の表示 ^I で表示されるよ
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set wildmenu                    " コマンドライン保管が最強になるかも
set shiftwidth=4                " インデントに使われる空白の数
set softtabstop=4               " <Tab>押下時の空白数
set expandtab                   " <Tab>押下時に<Tab>ではなく、ホワイトスペースを挿入する
set tabstop=4                   " <Tab>が対応する空白の数
set smarttab
set nf=hex                      " インクリメント, デクリメントを16進数にする(0x0とかにしなければ10進数です. 007をインクリメントすると010になるのはデフォルト設定が8進数のため)
set mouse=a                     " マウス使える
set showmode                    " 現在のモードを表示

set clipboard+=unnamedplus,unnamed
" Enable to copy to clipboard for operations like yank, delete, change and put
" http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
" if has('unnamedplus')
"   set clipboard^=unnamed
"   set clipboard^=unnamedplus
" endif

" This enables us to undo files even if you exit Vim.
if has('persistent_undo')
  set undofile
  set undodir=~/.config/vim/tmp/undo//
endif

""""""""""""""""""""""
"      Mappings      "
""""""""""""""""""""""

" Set leader shortcut to a comma ','. By default it's the backslash
let mapleader = ","

" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" quickfix window with <leader>a
map <C-n> :cnext<CR>
map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>

" インサートモードの時に jj でノーマルモードに戻る
imap jj <esc>
" [ って打ったら [] って入力されてしかも括弧の中にいる(以下同様)
imap [ []<left>
imap ( ()<left>
imap { {}<left>

inoremap <expr><C-i> neocoplete#complete_common_string()

" ２回esc を押したら検索のハイライトをヤメる
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" --- type ° to search the word in all files in the current dir
nmap * :Ag <c-r>=expand("<cword>")<cr><cr>
nnoremap <space>/ :Ag

"""""""""""""""""""""
"      Plugins      "
"""""""""""""""""""""
