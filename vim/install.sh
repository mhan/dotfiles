bundles=(
    'scrooloose/nerdtree'
    'klen/python-mode'
    'bling/vim-airline'
    'altercation/vim-colors-solarized'
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

if [ ! -e ~/.vim/autoload ]; then
    echo "  Installing pathogen"
    mkdir -p ~/.vim/autoload ~/.vim/bundle
    curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

fi

install_bundles
