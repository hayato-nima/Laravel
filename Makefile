define bash-c
	docker-compose exec --user docker app bash -c
endef

up:
	docker-compose up -d
ps:
	docker-compose ps
down:
	docker-compose down
bash:
	docker-compose exec --user docker app bash
migrate-seed:
	$(bash-c) 'composer dump-autoload'
	$(bash-c) 'php artisan migrate:fresh --seed'
init:
	echo DOCKER_UID=`id -u` > .env
	docker-compose build --no-cache
	docker-compose up -d
	$(bash-c) 'composer install'
	$(bash-c) 'chmod 777 -R storage bootstrap/cache'
create-test-db:
	docker-compose exec db bash -c 'echo create database docker_test_db | mysql -u root -proot'
	docker-compose exec db bash -c "echo 'GRANT ALL PRIVILEGES ON docker_test_db.* TO docker_db_user' | mysql -u root -proot"
phpunit:
	$(bash-c) 'vendor/bin/phpunit'
mysql:
	docker-compose exec db bash -c 'mysql -u root -proot'
