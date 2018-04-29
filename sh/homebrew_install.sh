#!/bin/sh

echo "installing homebrew...."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor...."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update...."
which brew >/dev/null 2>&1 && brew update

echo "Ok, run brew update...."

brew upgrade --all

formulas=(
    git                     #gitのupgradeとかに使う
    wget                    #いわゆるダウンローダーhttp/httpsでいけるでコマンド
    curl                    #なんかあったほうがええかもしれんコマンド
    tree                    #ディレクトリ配下をtree状に表示するコマンド
    openssl                 #秘密鍵とか生成するコマンドよ
    z                       #cdの履歴を見てよく使いディレクトリを移動できるコマンド
    colordiff               #diffの色付け, shellのconfigみてな
    # " -- without-etcdir zsh"
    # zsh-completion  #zshの保管を最強にするやつ
    # " -- with-cocoa --srgb emacs"
    cask                    #アプリのインストールするやつ./applicationにデフォルトで入る
    ansible                 #構成管理ツールとかもろもろ使えるで
    peco                    #ターミナル状の標準入力をインクリメンタルにフィルタしてくれるおshellの設定ファイルみてね
    hub                     #github系のツール,該当repoをブラウザで開いたり色々してくれるおshellの設定ファイルみてね
    tig                     #TUI,GitRepo内の変更内容をVimライクな操作で高速に閲覧するコマンド ex) tig -all
    nodebrew                #node.jsのバージョン管理ツール
    python3                 #python
    lua                     #vimでneocomplete使うために必要なんかも
    vim --with-lua          #vimにluaを紐づけるためのやつ
    mysql                   #mysqlのやつ
    postgresql              #postgresqlのやつ
    sqlite                  #sqliteのやつ
    # "php55 --homebrew-apxs" #php開発するときに必要になりそう↓
    # httpd22
    # sqlite
    # composer
    markdown                #markdown使えるようにする
    ctags                   #ソース内の変数だったりメソッドを解析して他で使われているところに行ったり来たりするやつ
    ssh-copy-id             #localで生成した公開鍵を接続先のサーバーに登録するコマンド
    phantomjs               #ヘッドレスブラウザエンジン
    mecab                   #文書形態素解析
    diff-so-fancy           #git diffをもっと見やすくするやーつgitの設定ファイル見てね
    thefuck                 #thefuck!!!!ってしてくれるお^ ^
    mongodb                 #mongodb
    flow                    #jsの静的型点検
    yarn                    #やーん
    ghq                     #goのパッケージもこれで一見
    nsq                     #メッセーギキュー
    watchman                #ウォッチメン
    autoconf                #なんかいいやつ
    fish                    #fish shell
    xz                      #解凍,圧縮ツール
    rbenv                   #rubyのバージョン管理
    ruby-build              #rubyをインストールするときに便利なやつ
    readline                #irbを使うときに便利なやつ
    icu4c                   #unicode周りでよしなに動いてくれるやつ
    gdbm                    #GNU database maneger
    pkg-config              #コンパイラパラメータをよしなにしてくれる
    libyaml                 #yaml parser
)

"brew tap..."
brew tap homebrew/dupes
brew tap homebrew/versions
#brew tap homebrew/homebrew-php
#brew tap homebrew/apache
#brew tap sanemat/font

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

casks=(
    # dropbox
    # evernote
    # skitch
    # bettertouchtool
    google-chrome
    google-japanese-ime
    slack
    # alfred
    iterm2
    # libreoffice
    # cyberduck
    # vlc
    # atom
    virtualbox
    vagrant
    vagrant-manager
)

echo "start brew cask install apps..."
for cask in "${casks[@]}"; do
    brew cask install $cask
done

brew cleanup
brew cask cleanup

cat << END

**************************************************
HOMEBREW INSTALLED! bye.
**************************************************

END
