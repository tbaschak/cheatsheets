---
title: Bird ULG
category: CLI
---
## Universal Looking Glass

### Clone repo

```
git clone https://gitlab.labs.nic.cz/labs/ulg.git
cd ulg
```

### Install Prereqs

```
apt-get install python python-pexpect python-pygraph python-genshi libgv-python whois
```

### Make Config Dir

```
sudo mkdir /etc/ulg
sudo cp config.py.example /etc/ulg/config.py
```

### Edit Config

`/etc/ulg/config.py`

```python
#!/usr/bin/env python

from ulgcisco import *
from ulgbird import *

routers = [
    BirdRouterLocal('/var/run/bird/bird.ctl', asn=16395, name='RS1-v4'),
    BirdRouterLocal('/var/run/bird/bird6.ctl', asn=16395, name='RS1-v6')
    ]
```

### Set Up Web App

```
sudo mkdir /var/www/html/ulg
sudo cp -r * /var/www/html/ulg
sudo usermod -a -G bird www-data
sudo /etc/init.d/apache2 restart
sudo vi /etc/apache2/apache2.conf
```

Edit `/etc/apache2/apache2.conf` around line 164

```
<Directory /var/www/>
	Options Indexes FollowSymLinks
#	AllowOverride None ## Comment this 
	AllowOverride All  ## Add this
	Require all granted
</Directory>
```

Edit `/var/www/html/ulg/.htaccess`:

```
<FilesMatch "(.pyc|.*~)">
  Deny from all
</FilesMatch>

Options +ExecCGI
AddHandler cgi-script .py
```
