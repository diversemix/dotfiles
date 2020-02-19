# dotfiles


Started by reading the article[1].

Seems a common thing to do, and I find it very convient working on a number of machines to unify my setup.
This did use an `install.sh` script - however I've found I need greater constrol of how things are done.
Below is how I use/install the dotfiles configuations

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

## References

[1] http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
