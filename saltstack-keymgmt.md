---
title: SaltStack Key Management
category: SaltStack
---

### Key Management

    salt-key -f minion_id        # Prints the key fingerprint of a Salt minion
    salt-call --local key.finger	# Prints the key fingerprint of a Salt minion, on a minion
    salt-key -p minion_id        # Prints the key of a Salt minion
    salt-key --list=all          # List all Salt key reg requests
    salt-key --accept-all        # Accepts ALL Salt key requests
    salt-key -a minion_id        # Accepts single Salt key request
    salt-key -d minion_id        # Removes the key of a Salt Minion
    salt-key --reject minion_id  # Rejects the key of a Salt minion

### Documentation on the web
  * [SaltStack salt-key documentation](https://docs.saltstack.com/en/latest/ref/cli/salt-key.html)
