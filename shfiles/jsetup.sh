#!/bin/sh

cat << END

_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

START SETTING UP JENV

_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

END

jenv add $(/usr/libexec/java_home -v 1.8)

jenv add $(/usr/libexec/java_home -V 11)

echo "finish set up!"
echo "try 'jenv versions'!"
echo "jenv global 11 or jenv local 11"

jenv global 11.0

cat << END

_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

FINISHED SETTING!

_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/_/

END
