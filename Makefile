#
INSTALL?=	/usr/bin/install
LN?=		/bin/ln

#
all:
	/bin/true

install:
	${INSTALL} -g root -o root -m 0644 smokeping-fcgi.service /etc/systemd/system/multi-user.target.wants/
	${INSTALL} -g root -o root -m 0755 smokeping-cron /usr/sbin/
	${INSTALL} -g root -o root -m 0644 smokeping /etc/cron.d/
