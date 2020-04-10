# Installing golang

Follow the instructions here : https://golang.org/doc/install

Install bash completion:

```
go get -u github.com/posener/complete/gocomplete
gocomplete -install
```


## Install my code

Change git configuration (`~/.gitconfig`)

```
[url "git@github.com:"]
    insteadOf = https://github.com/
```
Then you can run....

```
go get -u github.com/diversemix/accountapi-client
```

