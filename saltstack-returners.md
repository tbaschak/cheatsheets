---
title: SaltStack Returners
category: SaltStack
---

### Config Requirements

    couchdb.db: 'salt'                              # DB to return to
    couchdb.url: 'http://salt:5984/'                # URL of couchdb

    alternative.couchdb.db: 'salt'                  # Alternate DB to return to
    alternative.couchdb.url: 'http://salt:5984/'    # Alternate URL of couchdb

### Simplest Usage

    salt '*' test.ping --return couchdb             # runs a test.ping and returns to couchdb

### Alternative Config

    salt '*' test.ping --return couchdb --return_config alternative

### Documentation on the web
  * [SaltStack Returners documentation](https://docs.saltstack.com/en/latest/ref/returners/)
  * [SaltStack CouchDB Returner Docs](https://docs.saltstack.com/en/latest/ref/returners/all/salt.returners.couchdb_return.html)
