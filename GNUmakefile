#
GREP?=		$(shell which grep)
INSTALL?=	/usr/bin/install
LN?=		/bin/ln
SED?=		$(shell which sed)
SYSTEMCTL?=	$(shell which systemctl)
TEST?=		/bin/test

#
all::
	/bin/true

install::
	# smokeping configuration
	${GREP} -q '^@include /etc/smokeping/config.d/Probes.custom$$' /etc/smokeping/config || ${SED} -i -e '\#^@include /etc/smokeping/config.d/Probes$$#a @include /etc/smokeping/config.d/Probes.custom' /etc/smokeping/config
	${GREP} -q '^@include /etc/smokeping/config.d/Targets.custom$$' /etc/smokeping/config || ${SED} -i -e '\#^@include /etc/smokeping/config.d/Targets$$#a @include /etc/smokeping/config.d/Targets.custom' /etc/smokeping/config
	${TEST} -e /usr/share/smokeping/www/smokeping.fcgi || ${LN} -s ../smokeping.cgi /usr/share/smokeping/www/smokeping.fcgi

	# systemd configuration
	${INSTALL} -g root -o root -m 0644 smokeping-fcgi.service /etc/systemd/system/
	${SYSTEMCTL} daemon-reload
	${SYSTEMCTL} enable --now smokeping-fcgi.service

	# cron configuration (requires after systemd configuration to be in place)
	${INSTALL} -g root -o root -m 0644 smokeping /etc/cron.d/
	${INSTALL} -g root -o root -m 0755 smokeping-cron /usr/sbin/
	/usr/sbin/smokeping-cron || true
