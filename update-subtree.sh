#!/bin/sh

git_subtree() {
    if [ -f $1 ]; then
        git subtree pull -P $1 $2 master --squash
    else
        git subtree add -P $1 $2 master --squash
    fi
}

git_subtree vim/bundle/vim-markdown/ https://github.com/tpope/vim-markdown
git_subtree vim/bundle/vim-fugitive/ https://github.com/tpope/vim-fugitive
git_subtree vim/bundle/ctrlp.vim https://github.com/kien/ctrlp.vim
git_subtree vim/bundle/nerdtree https://github.com/scrooloose/nerdtree
git_subtree vim/bundle/puppet-syntax-vim https://github.com/puppetlabs/puppet-syntax-vim
