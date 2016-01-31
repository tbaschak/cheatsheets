---
title: Gogs Upgrade
category: Git
---

### Gogs Upgrade from source

```
/etc/init.d/gogs stop

sudo su - git
cd ~git
go get -u -tags "sqlite redis memcache" github.com/gogits/gogs
cd $GOPATH/src/github.com/gogits/gogs
mv gogs gogs.$(date +%Y-%m-%d).old
go build -tags "sqlite redis memcache"

# exit back to root
exit
/etc/init.d/gogs start
```

----

See:

* [Gogs Docs: Upgrade from source](https://gogs.io/docs/upgrade/upgrade_from_source)
