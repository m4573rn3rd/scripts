# Script to install packages for a list.
# Because why not



# This is a simple example

#!/bin/sh
#LIST_OF_APPS="a b c d e"
#aptitude update
#aptitude install -y $LIST_OF_APPS



#!/bin/bash

set -eu -o pipefail # If there is an error fail and report it also debug all lines 

sudo -n true
test $? -eq 0 || exit 1 "You have to have sudo please run sudo touch 1 then try again"

echo "installing the must-have pre-requisites"
while read -r p ; do sudo apt-get install -y $p ; done < <(cat << "EOF"
    perl
    zip 
    unzip
    gimp
    vim
    vlc
    tmux
    espeak
    curl
    wget
    festival
    openjdk-11-jdk     
EOF
)

echo installing the nice-to-have pre-requisites
echo you have 5 seconds to proceed ...
echo or
echo hit Ctrl+C to quit
echo -e "\n"
sleep 6