# Debian/Ubuntu packaging scripts for NetXMS

This repository contains scripts for creating deb packages (netxms-server/netxms-agent).

These scripts are used to build official packages which are available on http://packages.netxms.org/.

Publicly available packages are built for following distributions:

 * Debian 10 "Buster" (i386 / amd64)
 * Debian 11 "Bullseye" (i386 / amd64 / aarch64)
 * Ubuntu 18.04 LTS "Bionic Beaver" (i386 / amd64)
 * Ubuntu 20.04 LTS "Focal Fossa" (i386 / amd64)
 * Ubuntu 22.04 LTS "Jammy Jellyfish" (i386 / amd64)
 * Raspbian 10 "Buster" (armv7l)

# Branches

Branches follow branching layout in netxms/netxms.git:

* master - development
* stable-4.1 - 4.1.x release
* stable-4.0 - 4.0.x release
* …

# How to use

Note: commit message for official releases contains both version (e.g. "Version 3.9.235") and git commit hash of the specific release in [netxms/netxms](https://github.com/netxms/netxms) ("TAG: 106072975a").

## Prerequisites

* Custom jemalloc package should be built from [netxms/jemalloc-deb](https://github.com/netxms/jemalloc-deb) and installed into the system or added to pbuilder chroot.
* For Ubuntu 20+, libexosip2-dev deb should be built and installed into the system or added to pbuilder chroot.
* Latest Oracle instant client should be unpacked to /opt/instantclient_12_2 (both instantclient-basiclite-linux.x64-*.zip and instantclient-sdk-linux.x64-*.zip). Correct symlinks for libclntsh.so should be created there, if missing ([details in Oracle KB](https://support.oracle.com/knowledge/Oracle%20Database%20Products/2519112_1.html)).

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
