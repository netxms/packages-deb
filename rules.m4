include(`_all.m4')dnl
#!/usr/bin/make -f

#export DH_VERBOSE=1

DEB_HOST_MULTIARCH ?= $(shell dpkg-architecture -qDEB_HOST_MULTIARCH)

.PHONY: override_dh_installinit override_dh_shlibdeps override_dh_auto_configure override_dh_strip

override_dh_installinit:
	dh_installinit -pnetxms-agent --name=nxagentd
	dh_installinit -pnetxms-server --name=netxmsd

override_dh_shlibdeps:
	dh_shlibdeps --dpkg-shlibdeps-params=--ignore-missing-info

override_dh_auto_configure:
	dh_auto_configure -- --with-server --with-agent --with-client \
		--with-sqlite --with-mysql --with-pgsql --with-odbc \
		--enable-unicode --with-jdk=/usr/lib/jvm/default-java --with-vmgr \
		--with-jemalloc=/opt/jemalloc CONFIGURE_MARIADB CONFIGURE_MOSQUITTO CONFIGURE_ZMQ CONFIGURE_ORACLE CONFIGURE_ASTERISK

override_dh_strip:
	dh_strip -pnetxms-base --dbg-package=netxms-base-dbg
	dh_strip -pnetxms-agent --dbg-package=netxms-agent-dbg
	dh_strip -pnetxms-client --dbg-package=netxms-client-dbg
	dh_strip -pnetxms-server --dbg-package=netxms-server-dbg
	dh_strip -pnetxms-dbdrv-sqlite3 --dbg-package=netxms-dbdrv-sqlite3-dbg
	dh_strip -pnetxms-dbdrv-pgsql --dbg-package=netxms-dbdrv-pgsql-dbg
	dh_strip -pnetxms-dbdrv-mysql --dbg-package=netxms-dbdrv-mysql-dbg
	ifdef(`WITH_MARIADB', `dh_strip -pnetxms-dbdrv-mariadb --dbg-package=netxms-dbdrv-mariadb-dbg')
	ifdef(`WITH_ORACLE', `dh_strip -pnetxms-dbdrv-oracle --dbg-package=netxms-dbdrv-oracle-dbg')
	dh_strip -pnetxms-dbdrv-odbc --dbg-package=netxms-dbdrv-odbc-dbg

%:
	LD_LIBRARY_PATH=$(LD_LIBRARY_PATH):/opt/instantclient_18_3 dh $@ --parallel DH_ARG_SYSTEMD
