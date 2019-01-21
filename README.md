# Debian/Ubuntu packaging scripts for NetXMS

This repository contains scripts for creating deb packages (netxms-server/netxms-agent).

Packages are built by NetXMS team and published on http://packages.netxms.org/.

Supported releases (i386/amd64):
 * Debian 7 "Wheezy"
 * Debian 8 "Jessie"
 * Debian 9 "Stretch"
 * Ubuntu 14.04 LTS "Trusty Tahr"
 * Ubuntu 16.04 LTS "Xenial Xerus"
 * Ubuntu 18.04 LTS "Bionic Beaver"
 * Ubuntu 18.10 "Cosmic Cuttlefish"

# How to use

(replace version with actual)

```shell
mkdir -p netxms-build && cd netxms-build
# install tools and dependencies
sudo apt-get install devscripts
# - Download Instant Client (basic + sdk) 18.3.0.0 from Oracle and unpack to /opt/instantclient_18_3:
#   unzip instantclient-basic-linux.x64-18.3.0.0.0dbru.zip
#   unzip instantclient-sdk-linux.x64-18.3.0.0.0dbru.zip
#   sudo mv instantclient_18_3 /opt/
# - Install jemalloc (deb version is too old; this requirement is build-time only):
git clone https://github.com/jemalloc/jemalloc.git
cd jemalloc
git checkout 115ce935 # last tested revision
./autogen.sh
./configure --prefix=/opt/jemalloc
make
sudo make install_bin install_include install_lib
VERSION=2.2.12
cd ..
wget https://netxms.org/download/releases/2.2/$VERSION/netxms-$VERSION.tar.gz https://netxms.org/download/releases/2.2/$VERSION/netxms-$VERSION.tar.gz.asc
ln -s netxms-2.2.12.tar.gz netxms_2.2.12.orig.tar.gz
gpg --verify netxms-$VERSION.tar.gz.asc netxms-$VERSION.tar.gz
tar zxf netxms-$VERSION.tar.gz
cd netxms-$VERSION
git clone https://github.com/netxms/packages-deb debian
cd debian
make DIST=`lsb_release -sc`
cd ..
# install build dependencies
sudo mk-build-deps -i
rm netxms-build-deps_2.2.12-1_all.deb # clean build tree or dpkg-buildpackage will fail
dpkg-buildpackage --no-sign
sudo apt-get purge --auto-remove netxms-build-deps # optional step, will cleanup packages installed by mk-build-deps
```

## Build options

Two options can be set as parameters for make:

* DIST - distro name
* PROFILE - optional profile for selected distro

Default configurtion is stored in config/default/ (_all.m4 is an entry point)
Distro-specific configuration is in config/$DIST (e.g. config/stretch)
Profile-specific configuration is in config/$DIST-$PROFILE (e.g. config/stretch-raspbian)

Load order is (each file is included from _all.m4):
1. config/$DIST-$PROFILE/_file_.m4 (if exist)
1. config/$DIST/_file_.m4 (if exist)
1. config/default/_file_.m4
