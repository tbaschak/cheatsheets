---
title: Go Traffic
category: Go
---

### Traffic Installation

    go get github.com/pilu/traffic

### Sample Traffic App

```go
//  Description = ipquail website
//  Author = Theodore Baschak
//  Version = 1.0

package main

import (
  "fmt"
  "net"
  "github.com/pilu/traffic"
)

func ipHandler(w traffic.ResponseWriter, r *traffic.Request) {
  traffic.Logger().Print( r.Header.Get("X-Forwarded-For") ) 
  w.Header().Add("Content-type", "text/plain")
  w.WriteText( r.Header.Get("X-Forwarded-For") )
  w.WriteText( "\n" )
}

func ipapiHandler(w traffic.ResponseWriter, r *traffic.Request) {
  traffic.Logger().Print( r.Header.Get("X-Forwarded-For") ) 
  w.Header().Add("Access-Control-Allow-Origin", "*")
  w.Header().Add("Access-Control-Allow-Methods", "GET")
  w.Header().Add("Access-Control-Allow-Headers", "X-Requested-With,Accept,Content-Type,Origin")
  w.Header().Add("Content-type", "application/json")
  w.WriteText( "{ \"ip\": \"" )
  w.WriteText( r.Header.Get("X-Forwarded-For") )
  w.WriteText( "\" }" )
}

func main() {
  router := traffic.New()

  // add a route for each page you add to the site
  // make sure you create a route handler for it

//  router.Get("/", indexHandler)
  router.Get("/ip", ipHandler)
  router.Get("/ptr", ptrHandler)
  router.Get("/api/ip", ipapiHandler)
  router.Get("/api/ptr", ptrapiHandler)
  router.Run()
}
```
