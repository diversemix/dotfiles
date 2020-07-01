# Installing golang

1) Follow the instructions here : https://golang.org/doc/install

2) After this install gvm, see https://github.com/moovweb/gvm

3) Install bash completion:

```
go get -u github.com/posener/complete/gocomplete
gocomplete -install
```

4) Also in vim perform:

```
:GoInstallBinaries
:CocInstall coc-go
```

## Using git to install code

Change git configuration (`~/.gitconfig`)

```
[url "git@github.com:"]
    insteadOf = https://github.com/
```
Then you can run....

```
go get -u github.com/diversemix/accountapi-client
```

