# NeoViM

Now I am using neovim installation is a little more involved:

Install yarn:
```
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install --no-install-recommends yarn
```

Install plugins using vim:

```
# Install Vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginUpdate +qall
```

Finally install neovim and configure to use your vim settings:
```
sudo apt install neovim
cp init.vim ~/.config/nvim/init.vim
```

