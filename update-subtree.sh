#!/bin/sh

git_subtree() {
    git subtree pull --prefix $1 $2 master --squash
}

git_subtree vim/bundle/vim-markdown/ https://github.com/tpope/vim-markdown
git_subtree vim/bundle/vim-fugitive/ https://github.com/tpope/vim-fugitive
git_subtree vim/bundle/ctrlp.vim https://github.com/kien/ctrlp.vim
git_subtree vim/bundle/nerdtree https://github.com/scrooloose/nerdtree
