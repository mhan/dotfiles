#!/bin/bash
bundles=(
    'scrooloose/nerdtree'
    'klen/python-mode'
    'bling/vim-airline'
    'altercation/vim-colors-solarized'
    'mustache/vim-mustache-handlebars'
    'pangloss/vim-javascript'
    'puppetlabs/puppet-syntax-vim'
    'tpope/vim-surround'
)

function install_bundles() {
    pushd ~/.vim/bundle
    for b in ${bundles[@]}; do
        bundle=$(echo $b | awk -F '/' '{print $2}')
        if [ ! -e ~/.vim/bundle/$bundle ]; then
            echo "    Installing ${b} to ${bundle}"
            git clone https://github.com/${b}.git
        fi
    done
    popd
}

function setup_swap() {
    mkdir ~/.vim/{backup,swap,undo} 2>/dev/null
}

function install_pathogen() {
    if [ ! -e ~/.vim/autoload ]; then
        echo "  Installing pathogen"
        mkdir -p ~/.vim/{autoload,bundle}
        curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
    fi
}

install_pathogen
install_bundles
setup_swap
