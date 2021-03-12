#
INSTALL?=	/usr/bin/install
LN?=		/bin/ln

#
all::
	/bin/true

install::
	${INSTALL} -g root -o root -m 0644 smokeping-fcgi.service /lib/systemd/system/
	${INSTALL} -g root -o root -m 0755 smokeping-cron /usr/sbin/
	${INSTALL} -g root -o root -m 0644 smokeping /etc/cron.d/
