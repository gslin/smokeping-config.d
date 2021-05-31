#
GREP?=		/usr/bin/grep
INSTALL?=	/usr/bin/install
LN?=		/bin/ln
SED?=		/usr/bin/sed
SYSTEMCTL?=	$(shell which systemctl)

#
all::
	/bin/true

install::
	${GREP} -q '^@include /etc/smokeping/config.d/Targets.custom$$' /etc/smokeping/config || ${SED} -i -e '\#^@include /etc/smokeping/config.d/Targets$$#a @include /etc/smokeping/config.d/Targets.custom' /etc/smokeping/config
	${INSTALL} -g root -o root -m 0644 smokeping-fcgi.service /lib/systemd/system/
	${INSTALL} -g root -o root -m 0755 smokeping-cron /usr/sbin/
	${INSTALL} -g root -o root -m 0644 smokeping /etc/cron.d/
	${SYSTEMCTL} daemon-reload
