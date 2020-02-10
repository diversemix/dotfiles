# dotfiles


Started by reading the article[1].

Seems a common thing to do, and I find it very convient working on a number of machines to unify my setup.
The "install.sh" script is used to install the dotfiles config to the working config of the current users.
The existing config is backed up so don't worry.

## What the install does

The result of running the install should result in the following being added to
your home folder:
```
.bash_aliases -> /home/peter/dotfiles/bashrc-aliases.sh
.tmux.conf -> dotfiles/tmux.conf
.vimrc -> /home/peter/dotfiles/vimrc
```

In most `~/.bashrc` there is a section that runs `~/.bash_aliases` if it exists.
If not you can add the following to your `~/.bashrc`:

```{bash}
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
```

## References

[1] http://blog.smalleycreative.com/tutorials/using-git-and-github-to-manage-your-dotfiles/
