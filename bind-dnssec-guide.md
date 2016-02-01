---
title: BIND DNSSEC Guide
category: CLI
---
### Generate Keys

```
# cd /etc/bind/keys/example.com
# dnssec-keygen -a RSASHA256 -b 1024 example.com
Generating key pair...++++++ .............++++++ 
Kexample.com.+008+17694
# dnssec-keygen -a RSASHA256 -b 2048 -f KSK example.com
Generating key pair........................+++ ..................................+++ 
Kexample.com.+008+06817
```

### Reconfigure BIND

```
options {
    directory "/etc/bind";
    recursion no;
    minimal-responses yes;
};

zone "example.com" IN {
    type master;
    file "db/example.com.db";
    key-directory "keys/example.com";
    inline-signing yes;
    auto-dnssec maintain;
};
```

### Testing

```
$ dig @192.168.1.13 example.com. DNSKEY +multiline +noall +answer

; <<>> DiG 9.10.1 <<>> @192.168.1.13 example.com. DNSKEY +multiline +noall +answer
; (1 server found)
;; global options: +cmd
example.com.		300 IN DNSKEY 256 3 8 (
				AwEAAclob7q+ccvDwaTVuMM2ddGIynWyMwaZlhFrU6cC
				0qknWoPpkq0gIwTrYf3DJY+eIKPVHxrM+o2AoRIVhubG
				jfv1bT5wTYrawZstS84ejCQ+ehA+8DxKyeWUEzW0ZMBe
				OhyeG0cuQVK/p6Z1E096JLu0DjgbabLspequkw4M+HT7
				) ; ZSK; alg = RSASHA256; key id = 57009
example.com.		300 IN DNSKEY 257 3 8 (
				AwEAAdQ2ctHx8VmryndiOgpchXPdj3NwxMeUvAre6uYI
				5KELlFJUghTHrz+/CzEc8CXG8wwQ4ZvAey0FGV2nJAFC
				ENMxoRiCz0oSiQQxryNhACd3RnE2/D7G+ShwlOM6w53E
				wUJ/lsgu5UevSxFC+eA3fKeL3TWR44PH4iJQp9QmfW5v
				7qG8Sic/HQvBGBdOGfFtHAl0a4jDPBi57imS4YsHcUYD
				9bsWmhYWSHJKZ66+JnTiMS0nQM69YwBF43QfDKurs5R6
				qPUDiBlaMCzSxmlaBU6fsI1Mu/yIU8w1ewy26a42rUTU
				rPBC3Oa/zf9VQ8kpUrMZgJ7LEAA4xmR+qwWDh6U=
				) ; KSK; alg = RSASHA256; key id = 28267
```

### Parent Zone / DS Records

```
# cd /etc/bind/keys/example.com
# dnssec-dsfromkey -a SHA-1 Kexample.com.+008+06817.key
example.com. IN DS 6817 8 1 59194A835ACD78D25D538D5F35CA043A8F3F4446
# dnssec-dsfromkey -a SHA-256 Kexample.com.+008+06817.key
example.com. IN DS 6817 8 2 2A5F1DF55D5E64CBD7BCFE1EFA6E9586AF335FA56A2473296E975B89AFD31E11
```

or

```
$ dig @192.168.1.13 example.com. DNSKEY | dnssec-dsfromkey -f - example.com
example.com. IN DS 6817 8 1 59194A835ACD78D25D538D5F35CA043A8F3F4446
example.com. IN DS 6817 8 2 2A5F1DF55D5E64CBD7BCFE1EFA6E9586AF335FA56A2473296E975B89AFD31E11
```

### Refs

*	http://users.isc.org/~jreed/dnssec-guide/dnssec-guide.html
