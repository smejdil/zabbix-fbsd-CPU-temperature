#!/bin/sh
#
# Install example API file and Perl modul
#
# Lukas Maly <Iam@LukasMaly.NET> 9.11.2020
#

echo "--- Install Zabbix agent file ---"

INSTALL_DIR="/usr/local/etc/zabbix5/zabbix_agentd.conf.d/";

install -g wheel -o root -m 644 zbx.cpu.coretemp.conf ${INSTALL_DIR}/

/usr/local/etc/rc.d/zabbix_agentd restart

# EOF

