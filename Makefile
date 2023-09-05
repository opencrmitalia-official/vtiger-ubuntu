#!make


#container os
build-os:
	@docker build ./os -t os:22.04 
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

#container crm
build-crm: build-os
	@docker build --progress=plain --no-cache ./crm -t crm:7.1
create-crm: build-crm
	@cd crm && docker compose up -d
	@echo 'link to apache2 sample page: http://127.0.0.1:8081'
start-crm:
	@cd crm && docker compose start
stop-crm:
	@cd crm && docker compose stop
rm-crm:
	@cd crm && docker compose down
test-crm: stop-crm rm-crm
	@echo "START TESTING"
	@docker build --progress=plain ./crm -t crm:7.1
	@echo "step 1"
	@cd crm && docker compose up -d
	@echo "step 2"
	@cd crm && docker compose logs -f crm