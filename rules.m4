include(`_all.m4')dnl
#!/usr/bin/make -f
# vim: noexpandtab ts=3 sw=3

#export DH_VERBOSE=1

DEB_HOST_MULTIARCH ?= $(shell dpkg-architecture -qDEB_HOST_MULTIARCH)

.PHONY: override_dh_install override_dh_shlibdeps override_dh_auto_configure override_dh_auto_build override_dh_strip override_dh_builddeb

override_dh_install:
	dh_install
	ifdef(`WITH_RPI', `install debian/tmp/usr/lib/*/netxms/rpi.nsm debian/netxms-agent/usr/lib/*/netxms/')

override_dh_strip_nondeterminism:
	dh_strip_nondeterminism -X .jar

override_dh_shlibdeps:
	dh_shlibdeps --dpkg-shlibdeps-params=--ignore-missing-info

override_dh_auto_configure:
	dh_auto_configure -- \
		--enable-release-build \
		--with-server \
		--with-agent \
		--with-client \
		--with-sqlite \
		--with-pgsql \
		--with-odbc \
		--enable-unicode \
		--with-jdk=/usr/lib/jvm/default-java \
		--without-gui-client \
		--with-vmgr CONFIGURE_JEMALLOC CONFIGURE_JQ CONFIGURE_MARIADB CONFIGURE_MOSQUITTO CONFIGURE_MYSQL CONFIGURE_ZMQ CONFIGURE_ORACLE CONFIGURE_ASTERISK CONFIGURE_XEN CONFIGURE_ADDITIONAL

override_dh_auto_build:
	dh_auto_build
	cp build/netxms-build-tag.properties src/java-common/netxms-base/src/main/resources/
	mvn -f src/pom.xml versions:set -DnewVersion=$(shell grep NETXMS_VERSION build/netxms-build-tag.properties | cut -d = -f 2) -DprocessAllModules=true
	mvn -f src/client/nxmc/java/pom.xml versions:set -DnewVersion=$(shell grep NETXMS_VERSION build/netxms-build-tag.properties | cut -d = -f 2)
	mvn -f src/pom.xml install -Dmaven.test.skip=true -Dmaven.javadoc.skip=true

override_dh_strip:
	dh_strip -pnetxms-base --dbg-package=netxms-base-dbg
	dh_strip -pnetxms-agent --dbg-package=netxms-agent-dbg
	ifdef(`WITH_ASTERISK', `dh_strip -pnetxms-agent-asterisk --dbg-package=netxms-agent-asterisk-dbg')
	ifdef(`WITH_MOSQUITTO', `dh_strip -pnetxms-agent-mqtt --dbg-package=netxms-agent-mqtt-dbg')
	dh_strip -pnetxms-client --dbg-package=netxms-client-dbg
	dh_strip -pnetxms-server --dbg-package=netxms-server-dbg
	dh_strip -pnetxms-dbdrv-sqlite3 --dbg-package=netxms-dbdrv-sqlite3-dbg
	dh_strip -pnetxms-dbdrv-pgsql --dbg-package=netxms-dbdrv-pgsql-dbg
	ifdef(`WITH_MYSQL', `dh_strip -pnetxms-dbdrv-mysql --dbg-package=netxms-dbdrv-mysql-dbg')
	ifdef(`WITH_MARIADB', `dh_strip -pnetxms-dbdrv-mariadb --dbg-package=netxms-dbdrv-mariadb-dbg')
	ifdef(`WITH_ORACLE', `dh_strip -pnetxms-dbdrv-oracle --dbg-package=netxms-dbdrv-oracle-dbg')
	dh_strip -pnetxms-dbdrv-odbc --dbg-package=netxms-dbdrv-odbc-dbg

override_dh_builddeb:
	dh_builddeb -- -Zxz

%:
	LD_LIBRARY_PATH=$(LD_LIBRARY_PATH):/opt/instantclient_12_2 dh $@ --parallel
