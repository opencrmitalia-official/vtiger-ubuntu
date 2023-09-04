#!make


#container os
create-os:
	cd os && docker compose up
start-os:
	cd os && docker compose start
stop-os:
	cd os && docker compose stop
rm-os:
	cd os && docker compose down
test-os:
	cd os && docker compose exec os bash -c "echo -e '<?php\nphpinfo();' > /var/www/html/info.php"