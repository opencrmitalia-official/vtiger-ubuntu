#!make


#container os
create-os:
	@cd os && docker compose up -d
	@echo 'link to apache2 sample page: http://127.0.0.1:8080'
start-os:
	@cd os && docker compose start
stop-os:
	@cd os && docker compose stop
rm-os:
	@cd os && docker compose down
test-os: create-os
	@cd os && docker compose exec os bash -c "echo -e '<?php\nphpinfo();' > /var/www/html/info.php"
	@echo 'link to php info page: http://127.0.0.1:8080/info.php'
version-os:
	@cd os && docker compose exec os bash -c "lsb_release -a && echo '' && php -v"
info-os:
	@cd os && docker compose exec os bash -c "php -i"