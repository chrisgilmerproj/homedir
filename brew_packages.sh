#! /bin/bash

PACKAGES='ack
autoconf
automake
gdbm
gettext
gfortran
git
gnu-tar
mercurial
ossp-uuid
pcre
perforce
pkg-config
postgresql
python
readline
sqlite
the_silver_searcher
wget'

echo "Installing the following packages:" $PACKAGES

brew update
brew install --force --HEAD $PACKAGES
brew upgrade
