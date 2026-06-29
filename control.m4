# vim: syntax=debcontrol
# warning: PKG_* in Build-Depends shoult NOT be on the separate line
include(`_all.m4')dnl
Source: netxms
Priority: extra
Maintainer: Alex Kirhenshtein <alk@netxms.org>
Standards-Version: 4.9.3
Section: admin
Homepage: http://netxms.com/
Build-Depends:
 debhelper (>= 10),
 dh-autoreconf,
 debconf,
 lsb-release,
 flex,
 bison,
 maven,
 protobuf-compiler, libprotobuf-dev,
 zlib1g-dev,
 libargon2-dev,
 libexpat1-dev,
 libjansson-dev,
 libreadline-dev,
 libsqlite3-dev,
 libcurl4-openssl-dev,
 libpq-dev,
 libldap2-dev,
 libaio-dev,
 unixodbc-dev,
 libvirt-dev,
 libpcre3-dev | libpcre2-dev,
 libedit-dev,
 libmicrohttpd-dev,
 libstrophe-dev,
 libnxmodbus-dev (>= 3.1.10-4),
 libpng-dev,
 libx11-dev,
 libxext-dev,
 libssh-dev PKG_LM_SENSORS PKG_JDK PKG_JEMALLOC PKG_JQ PKG_MARIADB PKG_MONGODB PKG_MOSQUITTO PKG_MYSQL PKG_OPENSSL PKG_SYSTEMD PKG_ZMQ PKG_XEN PKG_LIBSTROPHE

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
 NetXMS is an open source network and infrastructure monitoring and
 management system. It provides comprehensive monitoring of network
 equipment, servers, applications, and services across heterogeneous
 environments.
 .
 This package contains the shared libraries used by all other NetXMS
 components (agent, server, client tools and database drivers).

Package: netxms-agent
Architecture: any
Multi-Arch: same
Depends: netxms-base (= ${binary:Version}), netxms-dbdrv-sqlite3 (= ${binary:Version}), unzip, ${shlibs:Depends}, ${misc:Depends}
Suggests: smartmontools
Description: NetXMS agent
 The NetXMS agent (nxagentd) runs on monitored hosts and provides the
 NetXMS server with detailed system metrics, log file data, file system
 information and the ability to execute remote actions.
 .
 The agent supports active and passive data collection, log monitoring,
 file transfers, encrypted tunnel connections and an extensible
 subagent interface for monitoring additional applications and services.

Package: netxms-agent-asterisk
Architecture: any
Multi-Arch: same
Depends: netxms-agent (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS subagent for monitoring Asterisk PBX
 Subagent for the NetXMS agent that collects metrics from Asterisk PBX
 servers via the Asterisk Manager Interface (AMI). It exposes channel
 counts, peer status, SIP/IAX registration state, call statistics and
 other Asterisk-specific parameters to the NetXMS server.

Package: netxms-agent-mssql
Architecture: any
Multi-Arch: same
Depends: netxms-agent (= ${binary:Version}), netxms-dbdrv-odbc (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS subagent for monitoring Microsoft SQL Server
 Subagent for the NetXMS agent that monitors Microsoft SQL Server
 instances. The subagent loads its database driver at runtime and
 connects to SQL Server through the unixODBC database driver, collecting
 instance status, database state, performance counters and other metrics
 exposed by the server.

Package: netxms-java-base
Architecture: any
Multi-Arch: same
Depends: PKG_JRE, ${shlibs:Depends}, ${misc:Depends}
Description: Common Java libraries used by both agent and client
 Shared Java runtime components for NetXMS, including the NetXMS client
 API (libnxclient) JAR files and supporting libraries. Required by the
 Java subagent, the NetXMS reporting server and any third-party Java
 applications built on top of the NetXMS client API.

Package: netxms-agent-java
Architecture: any
Multi-Arch: same
Depends: netxms-agent (= ${binary:Version}), netxms-java-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: Java subagent for NetXMS agent
 Subagent that embeds a Java Virtual Machine into the NetXMS agent and
 allows custom subagents to be written in Java. It provides the bridge
 between the native NetXMS agent and user-supplied Java classes that
 implement parameters, lists, tables and actions.

Package: netxms-agent-mysql
Architecture: any
Multi-Arch: same
Depends: netxms-agent (= ${binary:Version}), netxms-dbdrv-mysql (= ${binary:Version}) | netxms-dbdrv-mariadb (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS subagent for monitoring MySQL/MariaDB
 Subagent for the NetXMS agent that monitors MySQL and MariaDB database
 servers. It collects server status variables, connection counts,
 query statistics, replication state, InnoDB metrics and other
 parameters exposed by the database, and reports them to the NetXMS
 server.

ifdef(`WITH_ORACLE',
`Package: netxms-agent-oracle
Architecture: any
Multi-Arch: same
Depends: netxms-agent (= ${binary:Version}), netxms-dbdrv-oracle (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS subagent for monitoring Oracle
 Subagent for the NetXMS agent that monitors Oracle database servers.
 It collects instance status, tablespace usage, session counts,
 SGA/PGA statistics, ASM disk group information and other parameters
 exposed by the Oracle data dictionary views.
')dnl

Package: netxms-agent-pgsql
Architecture: any
Multi-Arch: same
Depends: netxms-agent (= ${binary:Version}), netxms-dbdrv-pgsql (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS subagent for monitoring PostgreSQL
 Subagent for the NetXMS agent that monitors PostgreSQL database
 servers. It collects backend counts, transaction and query
 statistics, replication lag, database and table sizes, lock
 information and other metrics exposed by PostgreSQL system catalogs
 and statistics views.

ifdef(`WITH_MONGODB',
`Package: netxms-agent-mongodb
Architecture: any
Multi-Arch: same
Pre-Depends: ${misc:Pre-Depends}
Depends: netxms-agent (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS subagent for monitoring MongoDB
 Subagent for the NetXMS agent that monitors MongoDB servers. It
 collects server status, connection counts, replication state,
 database and collection sizes, operation counters and other metrics
 exposed by MongoDB diagnostic commands.
')dnl

ifdef(`WITH_MOSQUITTO',
`Package: netxms-agent-mqtt
Architecture: any
Multi-Arch: same
Pre-Depends: ${misc:Pre-Depends}
Depends: netxms-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS subagent for MQTT
 Subagent for the NetXMS agent that connects to MQTT brokers and
 subscribes to configured topics. Received messages can be parsed and
 exposed as agent parameters or forwarded to the NetXMS server as
 events, allowing NetXMS to integrate with IoT devices and other
 systems that publish data over MQTT.
')dnl

Package: netxms-agent-session
Architecture: any
Multi-Arch: same
Depends: netxms-agent (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS session agent
 The session agent (nxsagent) runs inside a user's interactive desktop
 session and cooperates with the system-wide NetXMS agent. It enables
 features that require access to the user session, such as displaying
 notification messages to the logged-in user, capturing desktop
 screenshots and reporting information about the active session.

Package: netxms-agent-fbdev
Architecture: any
Multi-Arch: same
Depends: netxms-agent (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS subagent for framebuffer screenshot capture
 Subagent that captures the contents of a Linux framebuffer device
 (/dev/fb*) and returns it as a PNG image to the NetXMS server. Useful
 for monitoring headless systems, kiosks and embedded devices where
 the on-screen output needs to be inspected remotely.

Package: netxms-agent-vmgr
Architecture: any
Multi-Arch: same
Depends: netxms-agent (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS subagent for monitoring hypervisors
 Subagent for the NetXMS agent that uses libvirt to monitor
 virtualization hosts and the virtual machines running on them.
 Supports KVM, QEMU, LXC and other libvirt-compatible hypervisors,
 reporting host capabilities, guest state, CPU and memory usage and
 virtual storage information.

ifdef(`WITH_XEN',
`Package: netxms-agent-xen
Architecture: any
Multi-Arch: same
Pre-Depends: ${misc:Pre-Depends}
Depends: netxms-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS subagent for monitoring XEN
 Subagent for the NetXMS agent that monitors Xen hypervisors using the
 libxl management library. It reports information about the running
 domains, their CPU and memory consumption and overall host resource
 usage.
')dnl

Package: netxms-client
Architecture: any
Multi-Arch: same
Depends: netxms-base (= ${binary:Version}), netxms-java-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: NetXMS command line client tools
 Command line utilities for interacting with NetXMS servers and
 agents. Includes nxshell (NXSL scripting shell against a NetXMS
 server), nxaction/nxget/nxupload (direct agent access), nxsnmpget,
 nxsnmpset and nxsnmpwalk (SNMP utilities), nxmibc (MIB compiler),
 nxencpasswd, nxpush and other helpers used for scripting and
 administration.

Package: netxms-server
Architecture: any
Multi-Arch: same
Depends:
 netxms-base (= ${binary:Version}),
 netxms-dbdrv-sqlite3 (= ${binary:Version}) |
ifdef(`WITH_MARIADB', ` netxms-dbdrv-mariadb (= ${binary:Version}) |')dnl
ifdef(`WITH_ORACLE', ` netxms-dbdrv-oracle (= ${binary:Version}) |')dnl
ifdef(`WITH_MYSQL', ` netxms-dbdrv-mysql (= ${binary:Version}) |')dnl
 netxms-dbdrv-pgsql (= ${binary:Version}),
 ${shlibs:Depends}, ${misc:Depends}
Suggests:
ifdef(`WITH_MARIADB', ` netxms-dbdrv-mariadb, ')dnl
ifdef(`WITH_MYSQL', ` netxms-dbdrv-mysql, ')dnl
ifdef(`WITH_ORACLE', ` netxms-dbdrv-oracle, ')dnl
 netxms-dbdrv-pgsql
Description: NetXMS management server
 The NetXMS management server (netxmsd) is the central component of
 the NetXMS monitoring system. It performs network discovery, polls
 nodes via SNMP and the NetXMS agent protocol, processes events and
 alarms, collects performance data, evaluates thresholds and serves
 the management console and other clients.
 .
 This package depends on at least one database driver. SQLite3 is
 suitable for small installations and testing; PostgreSQL is
 recommended for production deployments.

Package: netxms-dbdrv-sqlite3
Architecture: any
Multi-Arch: same
Pre-Depends: ${misc:Pre-Depends}
Depends: netxms-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: SQLite3 driver for netxms-server
 SQLite3 database driver for the NetXMS server and other NetXMS
 components. SQLite is convenient for evaluation, small installations
 and the local configuration database used by the NetXMS agent, but
 is not recommended as the primary backend for large production
 NetXMS servers.

Package: netxms-dbdrv-pgsql
Architecture: any
Multi-Arch: same
Pre-Depends: ${misc:Pre-Depends}
Depends: netxms-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Suggests: postgresql
Description: PostgreSQL driver for netxms-server
 PostgreSQL database driver for the NetXMS server. PostgreSQL is the
 recommended backend for production NetXMS deployments and supports
 TimescaleDB for efficient storage of time-series performance data.

ifdef(`WITH_MYSQL',
`Package: netxms-dbdrv-mysql
Architecture: any
Multi-Arch: same
Pre-Depends: ${misc:Pre-Depends}
Depends: netxms-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Suggests: mysql-server
Description: MySQL driver for netxms-server
 MySQL database driver for the NetXMS server, built against the
 official MySQL client libraries. Allows the NetXMS server to use
 a MySQL instance as its configuration and historical data backend.
')dnl

ifdef(`WITH_MARIADB',
`Package: netxms-dbdrv-mariadb
Architecture: any
Multi-Arch: same
Pre-Depends: ${misc:Pre-Depends}
Depends: netxms-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Suggests: mariadb-server
Description: MariaDB driver for netxms-server
 MariaDB database driver for the NetXMS server, built against the
 MariaDB client libraries. Allows the NetXMS server to use a MariaDB
 instance as its configuration and historical data backend.
')dnl

Package: netxms-dbdrv-odbc
Architecture: any
Multi-Arch: same
Pre-Depends: ${misc:Pre-Depends}
Depends: netxms-base (= ${binary:Version}), ${shlibs:Depends}, ${misc:Depends}
Description: unixODBC driver for netxms-server
 Generic ODBC database driver for the NetXMS server, built against
 unixODBC. Allows the NetXMS server to connect to any database that
 provides a working ODBC driver, including Microsoft SQL Server, DB2
 and other commercial databases.

ifdef(`WITH_ORACLE',
`Package: netxms-dbdrv-oracle
Architecture: any
Multi-Arch: same
Pre-Depends: ${misc:Pre-Depends}
Depends: netxms-base (= ${binary:Version}), libaio1, ${shlibs:Depends}, ${misc:Depends}
Description: Oracle driver for netxms-server
 Oracle database driver for the NetXMS server, built against the
 Oracle Call Interface (OCI). Allows the NetXMS server to use an
 Oracle database as its configuration and historical data backend.
 The Oracle Instant Client libraries must be installed separately.
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
