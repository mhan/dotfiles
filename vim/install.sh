bundles=(
    'scrooloose/nerdtree'
    'klen/python-mode'
    'bling/vim-airline'
    'altercation/vim-colors-solarized'
)

function install_bundles() {
    for b in ${bundles[@]}; do
        echo "    Installing ${b}"
        git clone https://github.com/${b}.git ~/.vim/bundle
    done
}

if [ ! -e ~/.vim/autoload ]; then
    echo "  Installing pathogen"
    mkdir -p ~/.vim/autoload ~/.vim/bundle
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

    install_bundles
fi
