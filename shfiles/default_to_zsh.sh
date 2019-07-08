#!/bin/sh

echo "default to zsh shell..."

echo "install oh-my-zsh..."

curl -L https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh

echo "default shell to zsh"

echo /usr/local/bin/zsh | sudo tee -a /etc/shells

chsh -s /usr/local/bin/zsh
