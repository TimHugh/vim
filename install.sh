#!/bin/bash

vimdir=`dirname $0`
cd $vimdir/bundle
git clone https://github.com/VundleVim/Vundle.vim.git
vim +PluginInstall +qall
