---
title: Cisco Switch Recovery
category: Cisco
---
### General Catalyst Recovery

1.	Serial in. (9600/8/N/1)
1.	Unplug the power cord.
1.	Hold down the MODE button while you reconnect the power cable to the switch. The MODE button is on the left side of the front panel.
1.	Release the MODE button after the LED that is above Port 1x goes out. Note: The LED position can vary slightly, which depends on the model. You are now at the `switch:` prompt.
1.	Issue the `flash_init` command and then `load_helper` command. 
1.	Issue the `dir flash:` command in order to view the contents of the Flash file system. If you are attempting to recover from a bad flash image there may be an older working one you can boot. ex: `boot flash:c3750-xxxxxxxxx.bin`
1.	If you forgot your user or enable credentials you can move the file `flash:/private-config.text` to be named something else like `flash:/backup-old` and then `boot` the device. Once it has booted you can then log in, enable, and `copy flash:/back-old running-config` and un-shut all interfaces.

### References:

*	[Recovering Catalyst Fixed Configuration Switches from a Corrupted or Missing Image](http://www.cisco.com/c/en/us/support/docs/switches/catalyst-2950-series-switches/41845-192.html)