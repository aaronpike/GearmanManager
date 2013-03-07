#!/bin/sh
#
# $FreeBSD: GearmanManager $
#

# PROVIDE: gearman_manager
# REQUIRE: LOGIN
# BEFORE: DAEMON
# KEYWORD: shutdown

#
# Add the following lines to /etc/rc.conf to enable clamd:
#
# gearman_manager_enable="YES"
#

. /etc/rc.subr

name="gearman_manager"
rcvar=gearman_manager_enable

load_rc_config $name
: ${gearman_manager_enable:=no}

_piddir=/var/run/${name}
pidfile=${_piddir}/${name}.pid
_logdir=/var/log
logfile=${_logdir}/${name}.log
_configdir=/usr/local/etc/${name}
_gearmanuser="gearmand"

command=/usr/local/bin/${name}
command_args="-P ${pidfile} -l ${logfile} -u ${_gearmanuser} -d -c ${_configdir}/config.ini"

run_rc_command "$1"