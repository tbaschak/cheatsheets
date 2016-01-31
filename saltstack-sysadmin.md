---
title: SaltStack Sysadmin Stuff
category: SaltStack
---

### Daily Sysadmin Stuff

    salt 'minion-x-*' system.reboot                        # reboot minions that match minion-x-*
    salt '*' status.uptime                                 # Get the uptime of all our minions
    salt -v -G owner:theo pkg.list_upgrades                # List available package updates for Theo's minions
    salt 'web*' pkg.install dstat                          # Install a package on matching Salt Minions
    salt '*' ps.grep apache                                # Check if a specific application/process is running
    salt 'web*' cp.push /var/log/dpkg.log                  # Gather/collect/pull files from Salt minions and upload them to the master
    salt '*' file.contains /etc/hosts.allow 'yber'         # Check if a file on the Salt minions contains a certain string
    salt-cp '*' some_script.py /target-dir/some_script.py  # Push or upload or copy a file from the Salt master to the Salt minions

### Other Awesome Commands

    salt '*' cmd.run 'uname -a'                  # Show running kernel and OS info on all minions
    salt '*' cmd.run 'df -h'                     # Show Diskspace info on all minions

### Packages

    salt '*' pkg.list_upgrades                   # get a list of packages that need to be upgrade
    salt '*' pkg.refresh_db                      # refreshes package db (apt-get update)
    salt '*' pkg.upgrade                         # Upgrades all packages via apt-get dist-upgrade (or similar)
    salt '*' pkg.version bash                    # get current version of the bash package
    salt '*' pkg.install bash                    # install or upgrade bash package
    salt '*' pkg.install bash refresh=True       # install or upgrade bash package but
                                                        # refresh the package database before installing.

### System Services

    salt '*' service.status <service name
    salt '*' service.available <service name>
    salt '*' service.start <service name>
    salt '*' service.restart <service name>
    salt '*' service.stop <service name

### Network

    salt 'minion1' network.ip_addrs              # Get IP of your minion
    salt 'minion1' network.ping <hostname>       # Ping a host from your minion
    salt 'minion1' network.traceroute <hostname> # Traceroute a host from your minion
    salt 'minion1' network.get_hostname          # Get hostname
    salt 'minion1' network.mod_hostname          # Modify hostname

### States

    salt-run state.highstate                     # runs all states targetted for a minion, on a minion
    salt 'ns*' state.highstate                   # runs all states targetted for a minion, from master
    salt 'web*' state.sls settings.nginx         # runs settings/nginx/init.sls on web*
