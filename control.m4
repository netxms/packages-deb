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
 debhelper (>= 9),
 dh-autoreconf,
 debconf,
 lsb-release,
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
 default-jdk,
 libvirt-dev,
 libpcre3-dev,
 libssh-dev PKG_JEMALLOC PKG_MARIADB PKG_MOSQUITTO PKG_MYSQL PKG_OPENSSL PKG_SYSTEMD PKG_ZMQ PKG_ASTERISK PKG_XEN

Package: netxms-base
Architecture: any
Multi-Arch: same
Pre-Depends: ${misc:Pre-Depends}
Depends: ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS core libraries
 <insert long description, indented with spaces>

Package: netxms-base-dbg
Architecture: any
Section: debug
Priority: extra
Depends:
 netxms-base (= ${binary:Version})
Description: debugging symbols for netxms-base
 This package contains the debugging symbols for netxms-base

Package: netxms-agent
Architecture: any
Multi-Arch: same
Depends: netxms-base (= ${binary:Version}), netxms-dbdrv-sqlite3 (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS agent
 <insert long description, indented with spaces>

Package: netxms-agent-dbg
Architecture: any
Section: debug
Priority: extra
Depends:
 netxms-agent (= ${binary:Version}), netxms-base-dbg (= ${binary:Version})
Description: debugging symbols for netxms-agent
 This package contains the debugging symbols for netxms-agent

ifdef(`WITH_ASTERISK',
`Package: netxms-agent-asterisk
Architecture: any
Multi-Arch: same
Depends: netxms-agent (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS subagent for monitoring Asterisk PBX
 <insert long description, indented with spaces>

Package: netxms-agent-asterisk-dbg
Architecture: any
Section: debug
Priority: extra
Depends:
 netxms-agent-asterisk (= ${binary:Version}), netxms-base-dbg (= ${binary:Version})
Description: debugging symbols for netxms-agent-asterisk
 This package contains the debugging symbols for netxms-agent-asterisk
')dnl

Package: netxms-java-base
Architecture: any
Multi-Arch: same
Depends: default-jdk, ${shlibs:Depends}, ${misc:Depends}
Description: Common Java libraries used by both agent and client
 <insert long description, indented with spaces>

Package: netxms-java-base-dbg
Architecture: any
Section: debug
Priority: extra
Depends:
 netxms-java-base (= ${binary:Version})
Description: debugging symbols for netxms-java-base
 This package contains the debugging symbols for netxms-agent-java

Package: netxms-agent-java
Architecture: any
Multi-Arch: same
Depends: netxms-agent (= ${binary:Version}), netxms-java-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: Java subagent for NetXMS agent
 <insert long description, indented with spaces>

Package: netxms-agent-java-dbg
Architecture: any
Section: debug
Priority: extra
Depends:
 netxms-agent-java (= ${binary:Version}), netxms-base-dbg (= ${binary:Version})
Description: debugging symbols for netxms-agent-java
 This package contains the debugging symbols for netxms-agent-java

ifdef(`WITH_MYSQL',
`Package: netxms-agent-mysql
Architecture: any
Multi-Arch: same
Depends: netxms-agent (= ${binary:Version}), netxms-dbdrv-mysql (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS subagent for monitoring MySQL
 <insert long description, indented with spaces>

Package: netxms-agent-mysql-dbg
Architecture: any
Section: debug
Priority: extra
Depends:
 netxms-agent-mysql (= ${binary:Version}), netxms-base-dbg (= ${binary:Version})
Description: debugging symbols for netxms-agent-mysql
 This package contains the debugging symbols for netxms-agent-mysql
')dnl

ifdef(`WITH_ORACLE',
`Package: netxms-agent-oracle
Architecture: any
Multi-Arch: same
Depends: netxms-agent (= ${binary:Version}), netxms-dbdrv-oracle (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS subagent for monitoring Oracle
 <insert long description, indented with spaces>

Package: netxms-agent-oracle-dbg
Architecture: any
Section: debug
Priority: extra
Depends:
 netxms-agent-oracle (= ${binary:Version}), netxms-base-dbg (= ${binary:Version})
Description: debugging symbols for netxms-agent-oracle
 This package contains the debugging symbols for netxms-agent-oracle
')dnl

Package: netxms-agent-pgsql
Architecture: any
Multi-Arch: same
Depends: netxms-agent (= ${binary:Version}), netxms-dbdrv-pgsql (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS subagent for monitoring PostgreSQL
 <insert long description, indented with spaces>

Package: netxms-agent-pgsql-dbg
Architecture: any
Section: debug
Priority: extra
Depends:
 netxms-agent-pgsql (= ${binary:Version}), netxms-base-dbg (= ${binary:Version})
Description: debugging symbols for netxms-agent-pgsql
 This package contains the debugging symbols for netxms-agent-pgsql

ifdef(`WITH_MOSQUITTO',
`Package: netxms-agent-mqtt
Architecture: any
Multi-Arch: same
Pre-Depends: ${misc:Pre-Depends}
Depends: netxms-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS subagent for MQTT
 <insert long description, indented with spaces>

Package: netxms-agent-mqtt-dbg
Architecture: any
Section: debug
Priority: extra
Depends:
 netxms-agent-mqtt (= ${binary:Version}), netxms-base-dbg (= ${binary:Version})
Description: debugging symbols for netxms-agent-mqtt
 This package contains the debugging symbols for netxms-agent-mqtt
')dnl

Package: netxms-agent-vmgr
Architecture: any
Multi-Arch: same
Depends: netxms-agent (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS subagent for monitoring hypervisors
 <insert long description, indented with spaces>

Package: netxms-agent-vmgr-dbg
Architecture: any
Section: debug
Priority: extra
Depends:
 netxms-agent-vmgr (= ${binary:Version}), netxms-base-dbg (= ${binary:Version})
Description: debugging symbols for netxms-agent-vmgr
 This package contains the debugging symbols for netxms-agent-vmgr

ifdef(`WITH_XEN',
`Package: netxms-agent-xen
Architecture: any
Multi-Arch: same
Pre-Depends: ${misc:Pre-Depends}
Depends: netxms-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS subagent for monitoring XEN
 <insert long description, indented with spaces>

Package: netxms-agent-xen-dbg
Architecture: any
Section: debug
Priority: extra
Depends:
 netxms-agent-xen (= ${binary:Version}), netxms-base-dbg (= ${binary:Version})
Description: debugging symbols for netxms-agent-mgtt
 This package contains the debugging symbols for netxms-agent-xen
')dnl

Package: netxms-client
Architecture: any
Multi-Arch: same
Depends: netxms-base (= ${binary:Version}), netxms-java-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS command line client tools
 <insert long description, indented with spaces>

Package: netxms-client-dbg
Architecture: any
Section: debug
Priority: extra
Depends:
 netxms-base (= ${binary:Version}), netxms-base-dbg (= ${binary:Version})
Description: debugging symbols for netxms-client
 This package contains the debugging symbols for netxms-client

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

Package: netxms-server-dbg
Architecture: any
Section: debug
Priority: extra
Depends:
 netxms-server (= ${binary:Version}), netxms-base-dbg (= ${binary:Version})
Description: debugging symbols for netxms-server
 This package contains the debugging symbols for netxms-server

Package: netxms-dbdrv-sqlite3
Architecture: any
Multi-Arch: same
Pre-Depends: ${misc:Pre-Depends}
Depends: netxms-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: SQLite3 driver for netxms-server
 <insert long description, indented with spaces>

Package: netxms-dbdrv-sqlite3-dbg
Architecture: any
Section: debug
Priority: extra
Depends:
 netxms-dbdrv-sqlite3 (= ${binary:Version}), netxms-base-dbg (= ${binary:Version})
Description: debugging symbols for netxms-dbdrv-sqlite3
 This package contains the debugging symbols for netxms-dbdrv-sqlite3

Package: netxms-dbdrv-pgsql
Architecture: any
Multi-Arch: same
Pre-Depends: ${misc:Pre-Depends}
Depends: netxms-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Suggests: postgresql
Description: PostgreSQL driver for netxms-server
 <insert long description, indented with spaces>

Package: netxms-dbdrv-pgsql-dbg
Architecture: any
Section: debug
Priority: extra
Depends:
 netxms-dbdrv-pgsql (= ${binary:Version}), netxms-base-dbg (= ${binary:Version})
Description: debugging symbols for netxms-dbdrv-pgsql
 This package contains the debugging symbols for netxms-dbdrv-pgsql

ifdef(`WITH_MYSQL',
`Package: netxms-dbdrv-mysql
Architecture: any
Multi-Arch: same
Pre-Depends: ${misc:Pre-Depends}
Depends: netxms-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Suggests: mysql-server
Description: MySQL driver for netxms-server
 <insert long description, indented with spaces>

Package: netxms-dbdrv-mysql-dbg
Architecture: any
Section: debug
Priority: extra
Depends:
 netxms-dbdrv-mysql (= ${binary:Version}), netxms-base-dbg (= ${binary:Version})
Description: debugging symbols for netxms-dbdrv-mysql
 This package contains the debugging symbols for netxms-dbdrv-mysql
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

Package: netxms-dbdrv-mariadb-dbg
Architecture: any
Section: debug
Priority: extra
Depends:
 netxms-dbdrv-mariadb (= ${binary:Version}), netxms-base-dbg (= ${binary:Version})
Description: debugging symbols for netxms-dbdrv-mariadb
 This package contains the debugging symbols for netxms-dbdrv-mariadb
')dnl

Package: netxms-dbdrv-odbc
Architecture: any
Multi-Arch: same
Pre-Depends: ${misc:Pre-Depends}
Depends: netxms-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: unixODBC driver for netxms-server
 <insert long description, indented with spaces>

Package: netxms-dbdrv-odbc-dbg
Architecture: any
Section: debug
Priority: extra
Depends:
 netxms-dbdrv-odbc (= ${binary:Version}), netxms-base-dbg (= ${binary:Version})
Description: debugging symbols for netxms-dbdrv-odbc
 This package contains the debugging symbols for netxms-dbdrv-odbc

ifdef(`WITH_ORACLE',
`Package: netxms-dbdrv-oracle
Architecture: any
Multi-Arch: same
Pre-Depends: ${misc:Pre-Depends}
Depends: netxms-base (= ${binary:Version}), libaio1, ${shlibs:Depends}, ${misc:Depends}
Description: Oracle driver for netxms-server
 <insert long description, indented with spaces>

Package: netxms-dbdrv-oracle-dbg
Architecture: any
Section: debug
Priority: extra
Depends:
 netxms-dbdrv-oracle (= ${binary:Version}), netxms-base-dbg (= ${binary:Version})
Description: debugging symbols for netxms-dbdrv-oracle
 This package contains the debugging symbols for netxms-dbdrv-oracle
')dnl

Package: netxms-reporting
Architecture: any
Depends: netxms-java-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS Reporting server
 JasperReports integration for the NetXMS

# EOL, do not remove
