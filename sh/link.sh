#!/bin/sh

set -u
DOT_DIRECTORY="${HOME}/dotfiles"
DOT_CONFIG_DIRECTORY=".config"

echo "link home directory dotfiles"
cd ${DOT_DIRECTORY}

for f in _??*; do
    ln -snfv ${DOT_DIRECTORY}/${f} ${HOME}/.${f:1}
done

# echo "link .config directory dotfiles"
# cd ${DOT_DIRECTORY}/${DOT_CONFIG_DIRECTORY}
#
# for file in `\find . -maxdepth 8 -type f`; do
#     ln -snfv ${DOT_DIRECTORY}/${DOT_CONFIG_DIRECTORY}${file:2} ${HOME}/S{DOT_CONFIG_DIRECTORY}/${file:2}
# done

echo "linked dotfiles complete!"
