# vim: syntax=debcontrol
# warning: PKG_* in Build-Depends shoult NOT be on the separate line
include(`_all.m4')dnl
Source: netxms
Priority: extra
Maintainer: Alex Kirhenshtein <alk@netxms.org>
Standards-Version: 4.9.3
Section: admin
Homepage: http://www.netxms.org/
Build-Depends:
 debhelper (>= 10),
 dh-autoreconf,
 debconf,
 lsb-release,
 flex,
 bison,
 maven,
 zlib1g-dev,
 libexpat1-dev,
 libsensors4-dev,
 libjansson-dev,
 libreadline-dev,
 libsqlite3-dev,
 libcurl4-openssl-dev,
 libpq-dev,
 libldap2-dev,
 libaio1,
 unixodbc-dev,
 libvirt-dev,
 libpcre3-dev,
 libedit-dev,
 libnxmodbus-dev (>= 3.1.10-4),
 libssh-dev PKG_JDK PKG_JEMALLOC PKG_JQ PKG_MARIADB PKG_MOSQUITTO PKG_MYSQL PKG_OPENSSL PKG_SYSTEMD PKG_ZMQ PKG_ASTERISK PKG_XEN

Package: netxms-dbg
Architecture: any
Section: debug
Priority: optional
Depends:
 netxms-base (= ${binary:Version})
Replaces:
 netxms-agent-asterisk-dbg (<< 4.2),
 netxms-agent-dbg (<< 4.2),
 netxms-agent-java-dbg (<< 4.2),
 netxms-agent-mqtt-dbg (<< 4.2),
 netxms-agent-mysql-dbg (<< 4.2),
 netxms-agent-oracle-dbg (<< 4.2),
 netxms-agent-pgsql-dbg (<< 4.2),
 netxms-agent-vmgr-dbg (<< 4.2),
 netxms-agent-xen-dbg (<< 4.2),
 netxms-base-dbg (<< 4.2),
 netxms-client-dbg (<< 4.2),
 netxms-dbdrv-mariadb-dbg (<< 4.2),
 netxms-dbdrv-mysql-dbg (<< 4.2),
 netxms-dbdrv-odbc-dbg (<< 4.2),
 netxms-dbdrv-oracle-dbg (<< 4.2),
 netxms-dbdrv-pgsql-dbg (<< 4.2),
 netxms-dbdrv-sqlite3-dbg (<< 4.2),
 netxms-java-base-dbg (<< 4.2),
 netxms-server-dbg (<< 4.2)
Breaks:
 netxms-agent-asterisk-dbg (<< 4.2),
 netxms-agent-dbg (<< 4.2),
 netxms-agent-java-dbg (<< 4.2),
 netxms-agent-mqtt-dbg (<< 4.2),
 netxms-agent-mysql-dbg (<< 4.2),
 netxms-agent-oracle-dbg (<< 4.2),
 netxms-agent-pgsql-dbg (<< 4.2),
 netxms-agent-vmgr-dbg (<< 4.2),
 netxms-agent-xen-dbg (<< 4.2),
 netxms-base-dbg (<< 4.2),
 netxms-client-dbg (<< 4.2),
 netxms-dbdrv-mariadb-dbg (<< 4.2),
 netxms-dbdrv-mysql-dbg (<< 4.2),
 netxms-dbdrv-odbc-dbg (<< 4.2),
 netxms-dbdrv-oracle-dbg (<< 4.2),
 netxms-dbdrv-pgsql-dbg (<< 4.2),
 netxms-dbdrv-sqlite3-dbg (<< 4.2),
 netxms-java-base-dbg (<< 4.2),
 netxms-server-dbg (<< 4.2)
Description: debug symbols for all NetXMS packages
 This package combines and replaces all netxms-*-dbg packages.

Package: netxms-base
Architecture: any
Multi-Arch: same
Pre-Depends: ${misc:Pre-Depends}
Depends: ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS core libraries
 <insert long description, indented with spaces>

Package: netxms-agent
Architecture: any
Multi-Arch: same
Depends: netxms-base (= ${binary:Version}), netxms-dbdrv-sqlite3 (= ${binary:Version}), unzip, ${shlibs:Depends}, ${misc:Depends}
Suggests: smartmontools
Description: NetXMS agent
 <insert long description, indented with spaces>

ifdef(`WITH_ASTERISK',
`Package: netxms-agent-asterisk
Architecture: any
Multi-Arch: same
Depends: netxms-agent (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS subagent for monitoring Asterisk PBX
 <insert long description, indented with spaces>
')dnl

Package: netxms-java-base
Architecture: any
Multi-Arch: same
Depends: default-jdk, ${shlibs:Depends}, ${misc:Depends}
Description: Common Java libraries used by both agent and client
 <insert long description, indented with spaces>

Package: netxms-agent-java
Architecture: any
Multi-Arch: same
Depends: netxms-agent (= ${binary:Version}), netxms-java-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: Java subagent for NetXMS agent
 <insert long description, indented with spaces>

Package: netxms-agent-mysql
Architecture: any
Multi-Arch: same
Depends: netxms-agent (= ${binary:Version}), netxms-dbdrv-mysql (= ${binary:Version}) | netxms-dbdrv-mariadb (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS subagent for monitoring MySQL/MariaDB
 <insert long description, indented with spaces>

ifdef(`WITH_ORACLE',
`Package: netxms-agent-oracle
Architecture: any
Multi-Arch: same
Depends: netxms-agent (= ${binary:Version}), netxms-dbdrv-oracle (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS subagent for monitoring Oracle
 <insert long description, indented with spaces>
')dnl

Package: netxms-agent-pgsql
Architecture: any
Multi-Arch: same
Depends: netxms-agent (= ${binary:Version}), netxms-dbdrv-pgsql (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS subagent for monitoring PostgreSQL
 <insert long description, indented with spaces>

ifdef(`WITH_MOSQUITTO',
`Package: netxms-agent-mqtt
Architecture: any
Multi-Arch: same
Pre-Depends: ${misc:Pre-Depends}
Depends: netxms-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS subagent for MQTT
 <insert long description, indented with spaces>
')dnl

Package: netxms-agent-vmgr
Architecture: any
Multi-Arch: same
Depends: netxms-agent (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS subagent for monitoring hypervisors
 <insert long description, indented with spaces>

ifdef(`WITH_XEN',
`Package: netxms-agent-xen
Architecture: any
Multi-Arch: same
Pre-Depends: ${misc:Pre-Depends}
Depends: netxms-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS subagent for monitoring XEN
 <insert long description, indented with spaces>
')dnl

Package: netxms-client
Architecture: any
Multi-Arch: same
Depends: netxms-base (= ${binary:Version}), netxms-java-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS command line client tools
 <insert long description, indented with spaces>

Package: netxms-server
Architecture: any
Multi-Arch: same
Depends:
 netxms-base (= ${binary:Version}),
ifdef(`WITH_MARIADB', ` netxms-dbdrv-mariadb (= ${binary:Version}) |')dnl
ifdef(`WITH_ORACLE', ` netxms-dbdrv-oracle (= ${binary:Version}) |')dnl
ifdef(`WITH_MYSQL', ` netxms-dbdrv-mysql (= ${binary:Version}) |')dnl
 netxms-dbdrv-sqlite3 (= ${binary:Version}) |
 netxms-dbdrv-pgsql (= ${binary:Version}),
 ${shlibs:Depends}, ${misc:Depends}
Suggests:
ifdef(`WITH_MARIADB', ` netxms-dbdrv-mariadb, ')dnl
ifdef(`WITH_MYSQL', ` netxms-dbdrv-mysql, ')dnl
ifdef(`WITH_ORACLE', ` netxms-dbdrv-oracle, ')dnl
 netxms-dbdrv-pgsql
Description: meta package
 <insert long description, indented with spaces>

Package: netxms-dbdrv-sqlite3
Architecture: any
Multi-Arch: same
Pre-Depends: ${misc:Pre-Depends}
Depends: netxms-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: SQLite3 driver for netxms-server
 <insert long description, indented with spaces>

Package: netxms-dbdrv-pgsql
Architecture: any
Multi-Arch: same
Pre-Depends: ${misc:Pre-Depends}
Depends: netxms-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Suggests: postgresql
Description: PostgreSQL driver for netxms-server
 <insert long description, indented with spaces>

ifdef(`WITH_MYSQL',
`Package: netxms-dbdrv-mysql
Architecture: any
Multi-Arch: same
Pre-Depends: ${misc:Pre-Depends}
Depends: netxms-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Suggests: mysql-server
Description: MySQL driver for netxms-server
 <insert long description, indented with spaces>
')dnl

ifdef(`WITH_MARIADB',
`Package: netxms-dbdrv-mariadb
Architecture: any
Multi-Arch: same
Pre-Depends: ${misc:Pre-Depends}
Depends: netxms-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Suggests: mariadb-server
Description: MariaDB driver for netxms-server
 <insert long description, indented with spaces>
')dnl

Package: netxms-dbdrv-odbc
Architecture: any
Multi-Arch: same
Pre-Depends: ${misc:Pre-Depends}
Depends: netxms-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: unixODBC driver for netxms-server
 <insert long description, indented with spaces>

ifdef(`WITH_ORACLE',
`Package: netxms-dbdrv-oracle
Architecture: any
Multi-Arch: same
Pre-Depends: ${misc:Pre-Depends}
Depends: netxms-base (= ${binary:Version}), libaio1, ${shlibs:Depends}, ${misc:Depends}
Description: Oracle driver for netxms-server
 <insert long description, indented with spaces>
')dnl

Package: netxms-reporting
Architecture: any
Depends: netxms-java-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS Reporting server
 JasperReports integration for the NetXMS

######################
# old debug packages #
######################
Package: netxms-agent-asterisk-dbg
Depends: netxms-dbg (= ${binary:Version})
Architecture: all
Priority: optional
Section: oldlibs
Description: transitional package
 This is a transitional package. It can safely be removed.

Package: netxms-agent-dbg
Depends: netxms-dbg (= ${binary:Version})
Architecture: all
Priority: optional
Section: oldlibs
Description: transitional package
 This is a transitional package. It can safely be removed.

Package: netxms-agent-java-dbg
Depends: netxms-dbg (= ${binary:Version})
Architecture: all
Priority: optional
Section: oldlibs
Description: transitional package
 This is a transitional package. It can safely be removed.

Package: netxms-agent-mqtt-dbg
Depends: netxms-dbg (= ${binary:Version})
Architecture: all
Priority: optional
Section: oldlibs
Description: transitional package
 This is a transitional package. It can safely be removed.

Package: netxms-agent-mysql-dbg
Depends: netxms-dbg (= ${binary:Version})
Architecture: all
Priority: optional
Section: oldlibs
Description: transitional package
 This is a transitional package. It can safely be removed.

Package: netxms-agent-oracle-dbg
Depends: netxms-dbg (= ${binary:Version})
Architecture: all
Priority: optional
Section: oldlibs
Description: transitional package
 This is a transitional package. It can safely be removed.

Package: netxms-agent-pgsql-dbg
Depends: netxms-dbg (= ${binary:Version})
Architecture: all
Priority: optional
Section: oldlibs
Description: transitional package
 This is a transitional package. It can safely be removed.

Package: netxms-agent-vmgr-dbg
Depends: netxms-dbg (= ${binary:Version})
Architecture: all
Priority: optional
Section: oldlibs
Description: transitional package
 This is a transitional package. It can safely be removed.

Package: netxms-agent-xen-dbg
Depends: netxms-dbg (= ${binary:Version})
Architecture: all
Priority: optional
Section: oldlibs
Description: transitional package
 This is a transitional package. It can safely be removed.

Package: netxms-base-dbg
Depends: netxms-dbg (= ${binary:Version})
Architecture: all
Priority: optional
Section: oldlibs
Description: transitional package
 This is a transitional package. It can safely be removed.

Package: netxms-client-dbg
Depends: netxms-dbg (= ${binary:Version})
Architecture: all
Priority: optional
Section: oldlibs
Description: transitional package
 This is a transitional package. It can safely be removed.

Package: netxms-dbdrv-mariadb-dbg
Depends: netxms-dbg (= ${binary:Version})
Architecture: all
Priority: optional
Section: oldlibs
Description: transitional package
 This is a transitional package. It can safely be removed.

Package: netxms-dbdrv-mysql-dbg
Depends: netxms-dbg (= ${binary:Version})
Architecture: all
Priority: optional
Section: oldlibs
Description: transitional package
 This is a transitional package. It can safely be removed.

Package: netxms-dbdrv-odbc-dbg
Depends: netxms-dbg (= ${binary:Version})
Architecture: all
Priority: optional
Section: oldlibs
Description: transitional package
 This is a transitional package. It can safely be removed.

Package: netxms-dbdrv-oracle-dbg
Depends: netxms-dbg (= ${binary:Version})
Architecture: all
Priority: optional
Section: oldlibs
Description: transitional package
 This is a transitional package. It can safely be removed.

Package: netxms-dbdrv-pgsql-dbg
Depends: netxms-dbg (= ${binary:Version})
Architecture: all
Priority: optional
Section: oldlibs
Description: transitional package
 This is a transitional package. It can safely be removed.

Package: netxms-dbdrv-sqlite3-dbg
Depends: netxms-dbg (= ${binary:Version})
Architecture: all
Priority: optional
Section: oldlibs
Description: transitional package
 This is a transitional package. It can safely be removed.

Package: netxms-java-base-dbg
Depends: netxms-dbg (= ${binary:Version})
Architecture: all
Priority: optional
Section: oldlibs
Description: transitional package
 This is a transitional package. It can safely be removed.

Package: netxms-server-dbg
Depends: netxms-dbg (= ${binary:Version})
Architecture: all
Priority: optional
Section: oldlibs
Description: transitional package
 This is a transitional package. It can safely be removed.

# EOL, do not remove
