# dotfiles
My own bash and app configurations and knowledge-base installed on all the machines I use.

**NOTE** knowledge based now moved to Dropbox

## Contents Explained

- All of the files in the root of the folder contain configuration and can be installed using the instructions below.
- `apps` - Used to install Ubuntu applications.
- `kb` - This knowledge-base contains methods of commonly used tasks, recorded as scripts or text.

## Installing on Ubuntu

### Aliases

- Link with `ln -s ${HOME}/dotfiles/diversemix_aliases ~/.bash_aliases`

(If you already have this file you can source `diversemix_aliases`at the end)

### Bash Environment

There are 2 steps:

1) Edit `.bashrc` and add `source ~/dotfiles/diversemix_profile`, you may wish to follow the pattern below 
so that you don't have issues in non-interactive shells.

```
case "$-" in
  *i*) source ~/dotfiles/diversemix_profile ;;
  *)   echo This shell is not interactive ;;
esac

```

### ViM Environment

- Use `ln -s ${HOME}/dotfiles/diversemix.vimrc ~/.vimrc`

### TMux Environment

- Use `ln -s ${HOME}/dotfiles/diversemix.tmux.conf ~/.tmux.conf`

### Git Environment

```
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
git config --global diff.tool meld
git config --global difftool.prompt false
```
