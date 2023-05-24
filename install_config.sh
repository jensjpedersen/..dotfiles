#!/bin/sh

sudo apt install git tmux ranger fzf curl cmake python3

# Install syntching 
if ! which syncthing >/dev/null; then  
    ## Add the release PGP keys:
    sudo curl -o /usr/share/keyrings/syncthing-archive-keyring.gpg https://syncthing.net/release-key.gpg
    # Add the "stable" channel to your APT sources:
    echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing stable" | sudo tee /etc/apt/sources.list.d/syncthing.list
    # Add the "candidate" channel to your APT sources:
    echo "deb [signed-by=/usr/share/keyrings/syncthing-archive-keyring.gpg] https://apt.syncthing.net/ syncthing candidate" | sudo tee /etc/apt/sources.list.d/syncthing.list
    # Update and install syncthing:
    sudo apt-get update
    sudo apt-get install syncthing
fi 

# Install latest nvim
if [ ! -d "$HOME/neovim" ]; then
    sudo apt-get install ninja-build gettext cmake unzip curl # required for building
    git clone https://github.com/neovim/neovim
    cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo 
    sudo make install
    cd "$HOME" 
fi

