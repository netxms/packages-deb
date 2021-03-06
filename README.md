# Debian/Ubuntu packaging scripts for NetXMS

This repository contains scripts for creating deb packages (netxms-server/netxms-agent).

Packages are built by NetXMS team and published on http://packages.netxms.org/.

Supported releases (i386/amd64):
 * Debian 9 "Stretch"
 * Debian 10 "Buster"
 * Ubuntu 16.04 LTS "Xenial Xerus"
 * Ubuntu 18.04 LTS "Bionic Beaver"
 * Ubuntu 20.04 LTS "Focal Fossa" (amd64 only)
 * Ubuntu 20.10 "Groovy Gorilla" (amd64 only)
 * Devuan 2.0 "ASCII"

# Branches

Branches follow branching layout in netxms/netxms.git:

* master - development
* stable-3.4 - 3.4 release
* stable-2.2 - 2.2 release
* …

# How to use

## Prerequisites

* Custom jemalloc package should be built from [netxms/jemalloc-deb](https://github.com/netxms/jemalloc-deb) and installed into the system or added to pbuilder chroot.
* For Ubuntu 20, libexosip2-dev deb should be built and installed into the system or added to pbuilder chroot.
* Oracle instant client 18.3 should be unpacked to /opt/instantclient_18_3 (both instantclient-basic-linux.x64-18.3.0.0.0dbru.zip and instantclient-sdk-linux.x64-18.3.0.0.0dbru.zip)

## Build

```shell
mkdir -p netxms-build && cd netxms-build
# install tools and dependencies
sudo apt-get install devscripts
git clone https://github.com/netxms/netxms.git
cd netxms
VERSION=$(git describe|cut -d- -f1,2|sed s,-,.,g)
./reconf
./configure --with-dist
make dist
cd ..
ln -s netxms/netxms-$VERSION.tar.gz netxms_$VERSION.orig.tar.gz
tar zxf netxms/netxms-$VERSION.tar.gz
cd netxms-$VERSION
git clone https://github.com/netxms/packages-deb debian
cd debian
make DIST=`lsb_release -sc` # make debian/rules and debian/control for particular Debian/Ubuntu release
cd ..
# install build dependencies
sudo mk-build-deps -i
rm netxms-build-deps_*_all.deb # clean build tree or dpkg-buildpackage will fail
dpkg-buildpackage --no-sign
sudo apt-get purge --auto-remove netxms-build-deps # optional step, will cleanup packages installed by mk-build-deps
```

## Build options

Two options can be set as parameters for make when configuring package:

* DIST - distro name
* PROFILE - optional profile for selected distro

Default configurtion is stored in config/default/ (_all.m4 is an entry point).

Distro-specific configuration is in config/\$DIST (e.g. config/stretch).

Profile-specific configuration is in config/\$DIST-\$PROFILE (e.g. config/stretch-raspbian).

Load order is (each file is included from _all.m4):
1. config/\$DIST-$PROFILE/_file_.m4 (if exist)
1. config/$DIST/_file_.m4 (if exist)
1. config/default/_file_.m4