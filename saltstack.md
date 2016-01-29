---
title: SaltStack
category: SaltStack
---

## Key Management

    $ sudo salt-key -L              # List all Salt key reg requests
    $ sudo salt-key -A              # Accepts ALL Salt key requests
    $ sudo salt-key -a minion_id    # Accepts single Salt key request
    $ sudo salt-key -d minion_id    # Removes the key of a Salt Minion

## Minion Overview

    $ sudo salt-run manage.up       # Shows what Minions are up
    $ sudo salt-run manage.down     # Shows what Minions are down or not connected
    $ sudo salt-run manage.status   # Shows both online and offline Minions
    $ sudo salt -v \* test.ping     # Pings all minions

## Targetting Minions

    $ sudo salt "*" some_module                    # target all Salt Minions
    $ sudo salt "web*" some_module                 # Target Minion(s) based on their Minion ID
    $ sudo salt -G "oscodename:wheezy" some_module # Target Minions based on their grains

## Daily Sysadmin Stuff

    $ sudo salt -v -G owner:theo pkg.list_upgrades                # List available package updates for Theo's minions
    $ sudo salt "web*" pkg.install dstat                          # Install a package on matching Salt Minions
    $ sudo salt "*" ps.grep apache                                # Check if a specific application/process is running
    $ sudo salt "web*" cp.push /var/log/dpkg.log                  # Gather/collect/pull files from Salt minions and upload them to the master
    $ sudo salt "*" file.contains /etc/hosts.allow "yber"         # Check if a file on the Salt minions contains a certain string
    $ sudo salt-cp "*" some_script.py /target-dir/some_script.py  # Push or upload or copy a file from the Salt master to the Salt minions

## Job Management

    $ sudo salt-run jobs.list_jobs                      # Lists ALL Jobs
    $ sudo salt-call saltutil.running                   # Lists running jobs
    $ sudo salt-call saltutil.kill_job <job id number>  # Kills a specific running job
    $ sudo salt-run jobs.active                         # get list of active jobs
    $ sudo salt-run jobs.lookup_jid <job id number>     # get details of this specific job

## States

    $ sudo salt-run state.highstate               # runs all states targetted for a minion, on a minion
    $ sudo salt "ns*" state.highstate             # runs all states targetted for a minion, from master
    $ sudo salt "web*" state.sls settings.nginx   # runs settings/nginx/init.sls on web*

## Grains

    $ sudo salt '*' grains.ls                         # List all grains on all minions
    $ sudo salt '*' grains.item os                    # Show the value of the OS grain for every minion
    $ sudo salt '*' grains.item roles                 # Show the value of the roles grain for every minion
    $ sudo salt 'minion1' grains.setval mygrain True  # Set mygrain to True (create if it doesn't exist yet)
    $ sudo salt 'minion1' grains.delval mygrain       # Delete the value of the grain

## Other Awesome Commands

    $ sudo salt "*" cmd.run "uname -a"          # Show running kernel and OS info on all minions
    $ sudo salt "*" cmd.run "df -h"             # Show Diskspace info on all minions (Unix hopefully LOL)

## Documentation on the system
    $ sudo salt '*' sys.doc             # output sys.doc (= all documentation)
    $ sudo salt '*' sys.doc pkg         # only sys.doc for pkg module
    $ sudo salt '*' sys.doc network     # only sys.doc for network module
    $ sudo salt '*' sys.doc system      # only sys.doc for system module
    $ sudo salt '*' sys.doc status      # only sys.doc for status module

## Documentation on the web
  * [SaltStack documentation](http://docs.saltstack.com/en/latest/)
  * [Salt-Cloud](http://docs.saltstack.com/en/latest/topics/cloud/)
  * [Jobs](http://docs.saltstack.com/en/latest/topics/jobs/)



