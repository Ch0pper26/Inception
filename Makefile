all:
	-mkdir -p ~/data ~/data/mariadb ~/data/wordpress
	docker compose -f srcs/docker-compose.yml up -d

re: fclean all

stop:
	-docker stop $$(docker ps -qa)

down:
	docker compose -f srcs/docker-compose.yml down
prune:
	docker system prune --force

fclean: stop down
	-docker rm -f $$(docker ps -a -q)
	-docker rmi -f $$(docker images -a -q)
	-docker volume rm $$(docker volume ls -q)
	-docker system prune --force --all
	-docker volume prune --force
	-docker network prune --force
	-sudo rm -rf ~/data

.PHONY: all re prune down fclean stop
