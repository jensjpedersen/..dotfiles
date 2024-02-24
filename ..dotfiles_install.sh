#!/bin/bash
#
# TODO: 
# * rofi emoji
# * resurrect tmux setup

#  Capture ctrl-c
trap ctrl_c INT
function ctrl_c() {
    echo "Exiting"
    exit 1
}


if command -v pacman &> /dev/null; then
    echo "Using pacman package manager"





elif command -v apt-get &> /dev/null; then
    echo "Using apt package manager"

    sudo apt -y install curl


    # 1. Install snap alacritty
    sudo apt -y install snapd
    sudo snap install --classic alacritty

    # 2. Install alacirtty from source
    # Install alacritty
    # if ! command -v alacritty &> /dev/null; then
    #     cd ~ && git clone https://github.com/alacritty/alacritty.git
    #     cd alacritty

    #     # Install rust compiler
    #     curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
    #     rustup override set stable
    #     rustup update stable

    #     # Dependencies
    #     apt -y install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3

    #     # Build
    #     cargo build --release

    #     # Terminfo
    #     infocmp alacritty || sudo tic -xe alacritty,alacritty-direct extra/alacritty.info
    #     # Check INSTALL.md for alacritty flag completion, desktop entry, man page 
    #     cd ~ 
    # fi


    if ! command -v alacritty &> /dev/null; then
        echo "--------------- Exiting ---------------"
        echo "Alacritty is required, can not continue with the installation."
    fi



    # Awesome setup
    sudo apt -y install awesome polybar feh zsh tmux xclip xdotool ranger sxhkd rofi

    # Tools
    #
    # Dev tools
    sudo apt -y install nodejs npm

    sudo apt -y install python3 python3-pip ptpython pipx
    # source pipx
    # then; pip install ipython numpy pandas matplotlib seaborn pyarrow rich


    sudo apt -y install syncthing qutebrowser arandr tldr texlive-full zathura

    sudo apt -y install taskwarrior timewarrior

    sudo apt -y install pulsemixer playerctl


    # Install dmneu with height patch 
    if ! command -v dmenu &> /dev/null; then 
        sudo apt-get -y install libx11-dev libxft-dev libxinerama-dev build-essential
        cd ~  && git clone https://git.suckless.org/dmenu
        cd dmenu 
        wget "https://tools.suckless.org/dmenu/patches/line-height/dmenu-lineheight-5.2.diff"
        wget --output-document="dmenu-lineheight-5.2.diff" https://tools.suckless.org/dmenu/patches/line-height/dmenu-lineheight-5.2.diff
        git apply "dmenu-lineheight-5.2.diff"
        sudo make clean install 
    fi


    # Install clipmenu
    if ! command -v clipmenud &> /dev/null; then
        sudo apt -y install xsel libxfixes-dev
        cd ~ && git clone "https://github.com/cdown/clipnotify.git"
        cd clipnotify && sudo make install

        cd ~ && git clone "https://github.com/cdown/clipmenu.git"
        cd clipmenu && sudo make install
    fi



    if command ! -v starship &> /dev/null; then
       curl -sS "https://starship.rs/install.sh" | sh
    fi


    # Dependecies fzf widgets 
    sudo apt -y install ripgrep fd-find fzf bat exa
    [ ! -f ~/.local/bin/bat ] && ln -s /usr/bin/batcat ~/.local/bin/bat
    [ ! -f ~/.local/bin/fd ] && ln -s /usr/bin/fdfind ~/.local/bin/fd



    # Dev setup 



    # Install Meslo NerdFont
    if ! fc-list | grep "MesloNerdFont" &> /dev/null; then 
        cd ~/Downloads && wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/Meslo.zip"
        unzip Meslo.zip -d MesloNerdFont
        sudo mv MesloNerdFont /usr/share/fonts
        fc-cache -f
    fi
 		

    # Install SauceCodePro NerdFont
    if ! fc-list | grep "SauceCodeProNerdFont" &> /dev/null; then 
        cd ~/Downloads && wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/SourceCodePro.zip"
        unzip SourceCodePro.zip -d SourceCodePro
        sudo mv SourceCodePro /usr/share/fonts
        fc-cache -f
    fi


    # Install gh 
    if ! command -v gh &> /dev/null; then
        echo "--------------- Installing gh-cli ---------------" 
        type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
        curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
        && sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
        && echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
        && sudo apt update \
        && sudo apt install gh -y
    fi
	
	

	# Install neovim
	if ! command -v nvim &> /dev/null; then
		echo "--------------- Installing neovim ---------------" 
		sudo apt-get -y install ninja-build gettext cmake unzip curl
		cd ~ && git clone https://github.com/neovim/neovim
		cd neovim && make CMAKE_BUILD_TYPE=RelWithDebInfo
		cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb


        # Copilot
        git clone https://github.com/github/copilot.vim.git ~/.config/nvim/pack/github/start/copilot.vim

        # Conf Dependecies
        sudo apt -y install exuberant-ctags

	fi	


    # Download Install tmux plugins 
    [ ! -d ~/.tmux/plugins ] && mkdir -p ~/.tmux/plugins]

    ## Resurrect
    if [ ! -d ~/.tmux/plugins/tmux-resurrect ]; then
        cd ~/.tmux/plugins || (echo "Could not find tmux plugins directory. Exit; tmux-resurrect install. " 1>&2 && exit 1)
        mkdir -p ~/.config/tmux/plugins
        git clone https://github.com/tmux-plugins/tmux-resurrect
    fi


    if ! command -v docker &> /dev/null; then
        # Add Docker's official GPG key:
        sudo apt-get update
        sudo apt-get -y install ca-certificates curl
        sudo install -m 0755 -d /etc/apt/keyrings
        sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
        sudo chmod a+r /etc/apt/keyrings/docker.asc

        # Add the repository to Apt sources:
        echo \
            "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
            $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
        sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
        sudo apt-get update

        # Install Docker
        sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

        sudo systemctl start docker

        # Fix permissions
        sudo groupadd -f docker
        sudo usermod -aG docker $USER
        newgrp docker
    fi


    if ! command -v lazydocker &> /dev/null; then
        curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
    fi

    # Change shell to zsh
    if [ ! "$SHELL" = "$(which zsh)" ]; then 
        chsh -s "$(which zsh)"
    fi



else
    echo "Unsupported package manager"
    exit 1
fi




