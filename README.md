## Install

1. Clone repo
```bash
echo "..dotfiles" >> $HOME/.gitignore
git clone --bare "https://github.com/jensjpedersen/..dotfiles.git" $HOME/..dotfiles
alias c='/usr/bin/git --git-dir=$HOME/..dotfiles/ --work-tree=$HOME'
c checkout
```

2. Install packages
```bash
./..dotfiles_install.sh
```


