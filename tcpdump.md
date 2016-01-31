---
title: Tcpdump
---

### HTTP Headers

	tcpdump -A -s 10240 'tcp port 80 and (((ip[2:2] - ((ip[0]&0xf)<<2)) - ((tcp[12]&0xf0)>>2)) != 0)' | egrep --line-buffered "^........(GET |HTTP\/|POST |HEAD )|^[A-Za-z0-9-]+: " | sed -r 's/^........(GET |HTTP\/|POST |HEAD )/\n\1/g'

### CDP

	tcpdump -nn -v -i en0 -s 1500 -c 1 'ether[20:2] == 0x2000'

### LLDP

	tcpdump -nn -v -i en0 -s 1500 -XX -c 1 'ether proto 0x88cc'

### LLDP & CDP

	tcpdump -nn -v -i en0 -s 1500 -c 1 '(ether[12:2]=0x88cc or ether[20:2]=0x2000)'

### IPv6 ND and Friends

	tcpdump -i eth0 'ip6 && icmp6 && (ip6[40] == 133 || ip6[40] == 134 || ip6[40] == 135 || ip6[40] == 136)'

