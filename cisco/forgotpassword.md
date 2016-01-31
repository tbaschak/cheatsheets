---
title: Secret Recovery
category: Cisco
---
### Enable Secret Reset

1.	Serial in. (9600/8/N/1)
1.	Power off and back on via power switch or cord.
1.	Send Break within 60s of boot.
1.	Type `confreg 0x2142` at the rommon 1> prompt in order to boot from Flash. This step bypasses the startup configuration where the passwords are stored.
1.	Type `reset` at the rommon 2> prompt. The router reboots, but ignores the saved configuration.
1.	Type `no` after each setup question, or press `Ctrl-C` in order to skip the initial setup procedure.
1.	Type `enable` at the Router> prompt.
1.	Type `configure memory` or `copy startup-config running-config` in order to copy the nonvolatile RAM (NVRAM) into memory.
1.	The `show running-config` command shows the configuration of the router. All interfaces will be shutdown.
1.	Type configure terminal.
1.	Type `enable secret <password>` in order to change the enable secret password.
1.	Set the configuration register back: `config-register 0x2102`

### User Secret Reset

1.	Serial in. (9600/8/N/1)
1.	Power off and back on via power switch or cord.
1.	Send Break within 60s of boot.
1.	Type `confreg 0x2142` at the rommon 1> prompt in order to boot from Flash. This step bypasses the startup configuration where the passwords are stored.
1.	Type `reset` at the rommon 2> prompt. The router reboots, but ignores the saved configuration.
1.	Type `no` after each setup question, or press `Ctrl-C` in order to skip the initial setup procedure.
1.	Type `enable` at the Router> prompt.
1.	Type `configure memory` or `copy startup-config running-config` in order to copy the nonvolatile RAM (NVRAM) into memory.
1.	The `show running-config` command shows the configuration of the router. All interfaces will be shutdown.
1.	Type configure terminal.
1.	Type `user <username> secret <password>` in order to change the user secret password.
1.	Set the configuration register back: `config-register 0x2102`
