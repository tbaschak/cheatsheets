---
title: GPG
category: CLI
---

### Encrypt decrypt

    gpg --encrypt --recipient 'James Receiverson' foo.txt
    gpg --decrypt foo.txt.gpg

### Making keys

    gpg --gen-key

### Share your public key

    # via file
    gpg --armor --output pub.txt --export "Theodore Baschak"

    # via server
    gpg --send-keys "Theodore Baschak" --keyserver http://...

### Key management

    gpg --list-keys
    gpg --delete-key 'email@addie'

### Verifying Detached Signatures

	gpg --verify crucial.tar.gz{.asc,}

### Create Detached Signatures

	gpg --armor --detach-sign your-file.zip

### See
    
* https://www.madboa.com/geek/gpg-quickstart/
