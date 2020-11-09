## zabbix-fbsd-CPU-temperature

Monitoring FreeBSD CPU temperature featuring LLD (Intel &amp; AMD) 

This tutorial was taken from [Zabbix Share](https://share.zabbix.com/operating-systems/freebsd/cpu-temperature-coretemp) from user [Felician Hoppal](https://share.zabbix.com/owner/felici)

## Features:

- Low Level Discovery (LLD)
- Zabbix Agent

## Installation
### 1. Load FreeBSD kernel module

load coretemp kernel module: [kldload coretemp](https://www.freebsd.org/cgi/man.cgi?coretemp) (for Intel CPUs or amdtemp kernel module: [kldload amdtemp](https://www.freebsd.org/cgi/man.cgi?query=amdtemp) (for AMD CPUs)

### 2. Configure load module
 
add coretemp_load="YES" or amdtemp_load="YES" to `/boot/loader.conf`

### 3. Create zabbix config file

create zbx.cpu.coretemp.conf file in zabbix_agentd.conf.d

* make sure you have bash installed and the Include directive is present and valid in zabbix_agentd.conf to include individual files *

### 4. Restart zabbix agentd

restart zabbix_agentd, import & apply the template

### 5. Confirere path for zabbix agent

also make sure zabbix_agentd has all the paths needed: in `/etc/rc.conf`

`zabbix_agentd_paths="/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin"`

## Install script
`
git clone https://github.com/smejdil/zabbix-fbsd-CPU-temperature && cd ./zabbix-fbsd-CPU-temperature/scripts/ && ./install
`

## Test discovery key
`
zabbix_get -s 127.0.0.1 -k coretemp.cpu.discovery                                   
{"data":[{"{#CPUCORE}":"0"},{"{#CPUCORE}":"1"},{"{#CPUCORE}":"2"},{"{#CPUCORE}":"3"},{"{#CPUCORE}":"4"},{"{#CPUCORE}":"5"},{"{#CPUCORE}":"6"},{"{#CPUCORE}":"7"}]}
`

