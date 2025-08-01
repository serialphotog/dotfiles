# Dotfiles

These are my Linux dotfiles. 

## Installation

```
git clone git@github.com:serialphotog/dotfiles.git ~/.dotfiles

wget -O ~/.gdbinit-gef.py -q https://gef.blah.cat/py

curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

touch ~/.aliases.local
ln -s /home/adam/.dotfiles/.zshrc /home/adam/.zshrc
ln -s /home/adam/.dotfiles/.vimrc /home/adam/.vimrc
ln -s /home/adam/.dotfiles/.tmux.conf /home/adam/.tmux.conf
ln -s /home/adam/.dotfiles/.gdbinit /home/adam/.gdbinit
ln -s /home/adam/.dotfiles/.aliases.zsh /home/adam/.aliases.zsh
```