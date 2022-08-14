if ! [ -d ~/.asdf ]; then
    git clone https://github.com/asdf-vm/asdf.git ~/.asdf --depth 1
fi

. $HOME/.asdf/asdf.sh
