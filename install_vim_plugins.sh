#!/bin/bash
set -e
DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

(
    cd "$DIR/home/.vim/bundle"
    declare -a plugins=(
        "vim-scripts/BufOnly.vim"
        "mileszs/ack.vim"
        "w0rp/ale"
        "kien/ctrlp.vim"
        "editorconfig/editorconfig-vim"
        "ElmCast/elm-vim"
        "haya14busa/incsearch.vim"
        "autozimu/LanguageClient-neovim"
        "vim-scripts/matchit.zip"
        "shougo/neocomplete.vim"
        "scrooloose/nerdcommenter"
        "scrooloose/nerdtree"
        "StanAngeloff/php.vim"
        "shawncplus/phpcomplete.vim"
        "ervandew/supertab"
        "majutsushi/tagbar"
        "ternjs/tern_for_vim"
        "joonty/vdebug"
        "Townk/vim-autoclose"
        "ap/vim-buftabline"
        "altercation/vim-colors-solarized"
        "easymotion/vim-easymotion"
        "xolox/vim-easytags"
        "tpope/vim-eunuch.git"
        "tpope/vim-fugitive"
        "tpope/vim-git"
        "airblade/vim-gitgutter"
        "fatih/vim-go.git"
        "pangloss/vim-javascript"
        "jelera/vim-javascript-syntax"
        "mxw/vim-jsx"
        "xolox/vim-misc"
        "alvan/vim-php-manual"
        "beanworks/vim-phpfmt"
        "tpope/vim-unimpaired"
    )
    rm -rf *
    for plugin in "${plugins[@]}"; do
        url="https://github.com/$plugin"
        git clone "$url"
    done
    rm -rf */.git
)

echo OK
