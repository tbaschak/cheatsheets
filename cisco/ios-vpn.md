---
title: IOS Remote Access VPN
category: Cisco
---
### IOS Remote Access VPN

```
aaa new-model
aaa authentication login userauthen local
aaa authorization network groupauthor local

username user password 0 cisco

crypto isakmp policy 3
 encr 3des
 authentication pre-share
 group 2

crypto isakmp client configuration group vpngroup
 key cisco123
 dns 10.10.10.10
 wins 10.10.10.20
 domain cisco.com
 pool ippool
 acl 101

crypto ipsec transform-set myset esp-3des esp-md5-hmac

crypto dynamic-map dynmap 10
 set transform-set myset
 reverse-route

crypto map clientmap client authentication list userauthen
crypto map clientmap isakmp authorization list groupauthor
crypto map clientmap client configuration address respond
crypto map clientmap 10 ipsec-isakmp dynamic dynmap

interface FastEthernet0/0
 ip nat inside

interface FastEthernet0/1
 crypto map clientmap
 ip nat outside

ip local pool ippool 192.168.1.1 192.168.1.2

ip nat inside source list 111 interface FastEthernet1/0 overload

access-list 101 permit ip 10.10.10.0 0.0.0.255 192.168.1.0 0.0.0.255

access-list 111 deny ip 10.10.10.0 0.0.0.255 192.168.1.0 0.0.0.255
access-list 111 permit ip any any

```

### Refs

*	http://www.cisco.com/c/en/us/support/docs/routers/3600-series-multiservice-platforms/91193-rtr-ipsec-internet-connect.html
