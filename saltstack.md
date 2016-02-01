---
title: SaltStack
category: SaltStack
---

### Minion Overview

    salt-run manage.up                           # Shows what Minions are up
    salt-run manage.down                         # Shows what Minions are down or not connected
    salt-run manage.status                       # Shows both online and offline Minions
    salt '*'' test.ping                          # Pings all minions

### Targetting Minions

    salt '*' some_module                         # target all Salt Minions
    salt 'web*' some_module                      # Target Minion(s) based on their Minion ID
    salt -G 'oscodename:wheezy' some_module      # Target Minions based on their grains

### Job Management

    salt-run jobs.list_jobs                      # Lists ALL Jobs
    salt-call saltutil.running                   # Lists running jobs
    salt-call saltutil.kill_job <job id number>  # Kills a specific running job
    salt-run jobs.active                         # get list of active jobs
    salt-run jobs.lookup_jid <job id number>     # get details of this specific job

### States

    salt-run state.highstate                     # runs all states targetted for a minion, on a minion
    salt 'ns*' state.highstate                   # runs all states targetted for a minion, from master
    salt 'web*' state.sls settings.nginx         # runs settings/nginx/init.sls on web*

### Grains

    salt '*' grains.ls                           # List all grains on all minions
    salt '*' grains.item os                      # Show the value of the OS grain for every minion
    salt '*' grains.item roles                   # Show the value of the roles grain for every minion
    salt 'minion1' grains.setval mygrain True    # Set mygrain to True (create if it doesn't exist yet)
    salt 'minion1' grains.delval mygrain         # Delete the value of the grain

### Documentation on the system
    salt '*' sys.doc                             # output sys.doc (= all documentation)
    salt '*' sys.doc pkg                         # only sys.doc for pkg module
    salt '*' sys.doc network                     # only sys.doc for network module
    salt '*' sys.doc system                      # only sys.doc for system module
    salt '*' sys.doc status                      # only sys.doc for status module

### Documentation on the web
  * [SaltStack documentation](https://docs.saltstack.com/en/latest/)
  * [Salt-Cloud](https://docs.saltstack.com/en/latest/topics/cloud/)
  * [Job Management](https://docs.saltstack.com/en/latest/topics/jobs/)
  * [Targetting Minions](https://docs.saltstack.com/en/latest/topics/targeting/)
  * [Storing Static Data In The Pillar](https://docs.saltstack.com/en/latest/topics/pillar/)
  * [Walkthru Tutorial](https://docs.saltstack.com/en/latest/topics/tutorials/walkthrough.html)
  * [Hardening Salt](https://docs.saltstack.com/en/latest/topics/hardening.html)
  * [Git Fileserver Backend Walkthrough](https://docs.saltstack.com/en/latest/topics/tutorials/gitfs.html)

### This list is partly inspired by the fine lists on:
  * http://www.xenuser.org/saltstack-cheat-sheet/
  * https://github.com/saltstack/salt/wiki/Cheat-Sheet
