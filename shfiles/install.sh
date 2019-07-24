#!/bin/sh

cat << END

_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

START SET UP!

_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

END

echo "homebrew install start"

sh ./homebrew_install.sh

echo "set up jenv for java varsions"

sh ./jsetup.sh

echo "set up zsh"

sh ./default_to_zsh.sh

echo "start link to dotfiles"

sh ./link.sh

echo "restart shell"

exec /usr/local/bin/zsh

cat << END

_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

SET UP COMPLETE! bye.

_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

END
