#!/bin/sh

cat << END

_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

START INSTALL HOMEBREW AND CASK.

_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

END

echo "installing homebrew...."
which brew >/dev/null 2>&1 || /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "run brew doctor...."
which brew >/dev/null 2>&1 && brew doctor

echo "run brew update...."
which brew >/dev/null 2>&1 && brew update

echo "Ok, run brew update...."

brew upgrade

formulas=(
    git                     #gitのupgradeとかに使う
    wget                    #いわゆるダウンローダーhttp/httpsでいけるでコマンド
    curl                    #なんかあったほうがええかもしれんコマンド
    openssl                 #秘密鍵とか生成するコマンドよ
    z                       #cdの履歴を見てよく使いディレクトリを移動できるコマンド
    zsh
    zsh-completion  #zshの保管を最強にするやつ
    cask                    #アプリのインストールするやつ./applicationにデフォルトで入る
    ansible                 #構成管理ツールとかもろもろ使えるで
    peco                    #ターミナル状の標準入力をインクリメンタルにフィルタしてくれるおshellの設定ファイルみてね
    nodebrew                #node.jsのバージョン管理ツール
    python3                 #python
    markdown                #markdown使えるようにする
    ctags                   #ソース内の変数だったりメソッドを解析して他で使われているところに行ったり来たりするやつ
    ssh-copy-id             #localで生成した公開鍵を接続先のサーバーに登録するコマンド
    thefuck                 #thefuck!!!!ってしてくれるお^ ^
    yarn                    #やーん
    autoconf                #なんかいいやつ
    xz                      #解凍,圧縮ツール
    rbenv                   #rubyのバージョン管理
    ruby-build              #rubyをインストールするときに便利なやつ
    readline                #irbを使うときに便利なやつ
    icu4c                   #unicode周りでよしなに動いてくれるやつ
    pkg-config              #コンパイラパラメータをよしなにしてくれる
    libyaml                 #yaml parser
    go
    jenv
)

"brew tap..."
brew tap homebrew/cask-versions
brew tap caskroom/fonts

echo "start brew install apps..."
for formula in "${formulas[@]}"; do
    brew install $formula || brew upgrade $formula
done

casks=(
    google-chrome
    slack
    font-fira-code
    java11
    corretto8
    intellij-idea
)

echo "start brew cask install apps..."
for cask in "${casks[@]}"; do
    brew cask install $cask
done

brew cleanup

cat << END

_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

HOMEBREW INSTALLED!

_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

END
