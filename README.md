# Debian/Ubuntu packaging scripts for NetXMS

This repository contains scripts for creating deb packages (netxms-server/netxms-agent).

Packages are built by NetXMS team and published on http://packages.netxms.org/.

Supported releases (i386/amd64):
 * Debian 7 "Wheezy"
 * Debian 8 "Jessie"
 * Debian 9 "Stretch"
 * Ubuntu 14.04 LTS "Trusty Tahr"
 * Ubuntu 16.04 LTS "Xenial Xerus"
 * Ubuntu 17.10 "Artful Aardvark"
 * Ubuntu 18.04 LTS "Bionic Beaver"

# How to use

(replace version with actual)

```shell
VERSION=2.2.8
wget https://netxms.org/download/releases/2.2/$VERSION/netxms-$VERSION.tar.gz https://netxms.org/download/releases/2.2/$VERSION/netxms-$VERSION.tar.gz.asc
gpg --verify netxms-$VERSION.tar.gz.asc netxms-$VERSION.tar.gz
tar zxf netxms-$VERSION.tar.gz
cd netxms-$VERSION
git clone https://github.com/netxms/packages-deb debian
cd debian
DIST=`lsb_release -sc` make
cd ..
dpkg-buildpackage --no-sign
```
