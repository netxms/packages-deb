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
make DIST=`lsb_release -sc`
cd ..
dpkg-buildpackage --no-sign
```

## Build options

Two options can be set as parameters for make:

* DIST - distro name
* PROFILE - optional profile for selected distro

Default configurtion is stored in config/default/ (_all.m4 is an entry point)
Distro-specific configuration is in config/$DIST (e.g. config/stretch)
Profile-specific configuration is in config/$DIST-$PROFILE (e.g. config/stretch-raspbian)

Load order is:
1. config/$DIST-$PROFILE/….m4 (if exist)
1. config/$DIST/….m4 (if exist)
1. config/default/….m4
