include(`_all.m4')dnl
#!/usr/bin/make -f

#export DH_VERBOSE=1

DEB_HOST_MULTIARCH ?= $(shell dpkg-architecture -qDEB_HOST_MULTIARCH)

.PHONY: override_dh_installinit override_dh_shlibdeps override_dh_auto_configure override_dh_strip

override_dh_installinit:
	dh_installinit -pnetxms-agent --name=nxagentd
	dh_installinit -pnetxms-server --name=netxmsd
	dh_installinit -pnetxms-reporting --name=nxreportd

override_dh_install:
	dh_install
	ifdef(`WITH_RPI', `install debian/tmp/usr/lib/*/netxms/rpi.nsm debian/netxms-agent/usr/lib/*/netxms/')

override_dh_shlibdeps:
	dh_shlibdeps --dpkg-shlibdeps-params=--ignore-missing-info

override_dh_auto_configure:
	dh_auto_configure -- --with-server --with-agent --with-client \
		--with-sqlite --with-pgsql --with-odbc \
		--enable-unicode --with-jdk=/usr/lib/jvm/default-java \
		--with-vmgr CONFIGURE_JEMALLOC CONFIGURE_MARIADB CONFIGURE_MOSQUITTO CONFIGURE_MYSQL CONFIGURE_ZMQ CONFIGURE_ORACLE CONFIGURE_ASTERISK CONFIGURE_XEN CONFIGURE_ADDITIONAL

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

%:
	LD_LIBRARY_PATH=$(LD_LIBRARY_PATH):/opt/instantclient_18_3 dh $@ --parallel DH_ARG_SYSTEMD
