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

Plug 'fatih/vim-go'
Plug 'Shougo/neocomplete.vim'
Plug 'fatih/molokai'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'SirVer/ultisnips'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Shougo/neocomplete.vim'           " completion during typing
Plug 'altercation/vim-colors-solarized' " solarized colorscheme
Plug 'Shougo/vimproc.vim'
Plug 'Shougo/unite.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'rking/ag.vim'
Plug 'pbrisbin/html-template-syntax'
Plug 'othree/xml.vim'
Plug 'maksimr/vim-jsbeautify'
Plug 'einars/js-beautify'
call plug#end()

""""""""""""""""""""""
"     PluginConfs    "
""""""""""""""""""""""

" -----------------
"       THEME
" -----------------

" -- solarized theme
set background=dark
try
    colorscheme solarized
catch
endtry

" ----------------------------
"       File Management
" ----------------------------
let g:unite_source_history_yank_enable = 1
try
  let g:unite_source_rec_async_command='ag --nocolor --nogroup -g ""'
  call unite#filters#matcher_default#use(['matcher_fuzzy'])
catch
endtry
" search a file in the filetree
nnoremap <space><space> :split<cr> :<C-u>Unite -start-insert file_rec/async<cr>
nnoremap <space>f :split<cr> :<C-u>Unite file<cr>
nnoremap <space>g :split<cr> :<C-u>Unite -start-insert file_rec/git<cr>
" see the yank history
nnoremap <space>y :split<cr>:<C-u>Unite history/yank<cr>
" reset not it is <C-l> normally
:nnoremap <space>r <Plug>(unite_restart)

""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""

set nocompatible                " vimの特定の機能を有効にする
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

" 全角スペース・行末スペース・タブの可視化
" if has('syntax')
"     syntax on
" 
"     " PODバグ対策
"     syn sync fromstart
" 
"     function! ActiveInvisibleIndicator()
"         syntax match InvisibleJISX0208Space "　" display containedin=ALL
"         highlight InvisibleJISX0208Space term=underline ctermbg=Blue guibg=darkgray gui=underline
"     endfunction
" 
"     augroup invisible
"         autocmd! invisible
"         autocmd BufNew,BufRead * call ActivateInvisibleIndicator()
"     augroup END
" endif

" Colorscheme
syntax enable
set t_Co=256
let g:rehash256 = 1
let g:molokai_original = 1
colorscheme molokai

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

" インサートモードの時に C-j でノーマルモードに戻る
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

" -- js beautifer
autocmd FileType javascript noremap <buffer> <c-f> :call JsBeautify()<cr>
autocmd FileType html noremap <buffer> <c-f> :call JsBeautify()<cr>
autocmd FileType css noremap <buffer> <c-f> :call JsBeautify()<cr>

" -- vim-go
let g:go_fmt_command = "goimports"
let g:go_autodetect_gopath = 1
let g:go_list_type = "quickfix"

let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_structs = 1

" Open :GoDeclsDir with ctrl-g
nmap <C-g> :GoDeclsDir<cr>
imap <C-g> <esc>:<C-u>GoDeclsDir<cr>

autocmd FileType go :highlight goErr cterm=bold ctermfg=214
autocmd FileType go :match goErr /\<err\>/

augroup go
  autocmd!

  " Show by default 4 spaces for a tab
  autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

  " :GoBuild and :GoTestCompile
  autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

  " :GoTest
  autocmd FileType go nmap <leader>t  <Plug>(go-test)

  " :GoRun
  autocmd FileType go nmap <leader>r  <Plug>(go-run)

  " :GoDoc
  autocmd FileType go nmap <Leader>d <Plug>(go-doc)

  " :GoCoverageToggle
  autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

  " :GoInfo
  autocmd FileType go nmap <Leader>i <Plug>(go-info)

  " :GoMetaLinter
  autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

  " :GoDef but opens in a vertical split
  autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)
  " :GoDef but opens in a horizontal split
  autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

  " :GoAlternate  commands :A, :AV, :AS and :AT
  autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
  autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
augroup END

" build_go_files is a custom function that builds or compiles the test file.
" It calls :GoBuild if its a Go file, or :GoTestCompile if it's a test file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction
