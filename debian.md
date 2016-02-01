---
title: Debian
category: CLI
---

### apt/dpkg stuff

    apt-cache search mysql       # Look for something
    dpkg -S `which tsclient`    # What package does it belong to?
    dpkg -L aria2c              # What does this package provide?
    dpkg -i *.deb               # Install a deb file
    dpkg -s nodejs              # Show info

    dpkg --get-selections       # list installed packages

### Apt archives path

    /var/cache/apt/archives

### List services

    service --status-all

### Mounting a RAM drive

    $ mount -t tmpfs -o size=5G,nr_inodes=5k,mode=700 tmpfs /tmp

### Visudo

    sudo visudo

    username ALL=(ALL) NOPASSWD:/sbin/restart whatever
    theodore ALL=(ALL:ALL) NOPASSWD: /usr/bin/salt

