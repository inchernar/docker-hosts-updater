.SILENT:


install: docker-hosts-updater.sh docker-hosts-updater.service
	install -m 755 docker-hosts-updater.sh /usr/local/bin/docker-hosts-updater.sh
	install -m 755 docker-hosts-updater.service /etc/systemd/system/docker-hosts-updater.service
	systemctl daemon-reload
	systemctl enable docker-hosts-updater.service
	systemctl start docker-hosts-updater.service


uninstall:
	systemctl daemon-reload
	systemctl stop docker-hosts-updater.service || true
	systemctl disable docker-hosts-updater.service 2>/dev/null || true
	rm -f /etc/systemd/system/docker-hosts-updater.service
	rm -f /usr/local/bin/docker-hosts-updater.sh
	systemctl daemon-reload
