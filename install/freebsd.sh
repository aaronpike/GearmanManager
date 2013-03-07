#!/bin/sh
#
# $FreeBSD: GearmanManager $
#

# PROVIDE: gearman-manager
# REQUIRE: LOGIN
# BEFORE: DAEMON
# KEYWORD: shutdown

#
# Add the following lines to /etc/rc.conf to enable clamd:
#
# gearman-manager_enable="YES"
#

. /etc/rc.subr

name="gearman-manager"
rcvar=gearman-manager_enable

start_cmd="${name}_start"
stop_cmd=":"

load_rc_config $name
: ${gearman-manager_enable:=no} 
: ${gearman-manager_msg="Not started."}

command=/usr/local/bin/${name}
_piddir=/var/run/${name}
pidfile=${_piddir}/${name}.pid
_logdir=/var/log
logfile=${_logdir}/${name}.log
_configdir=/usr/local/etc/gearman-manager
_gearmanuser="gearmand"

command_args="-P ${pidfile} -l ${logfile} -u ${_gearmanuser} -d -c ${_configdir}/config.ini"

run_rc_command "$1"