include ./srcs/.env
export

NAME = inception

SRCS	:= ./srcs/docker-compose.yml

FLAGS	:= -d --build


$(NAME):
	sudo mkdir -p /home/zkansoun/data/wp
	sudo mkdir -p /home/zkansoun/data/db
	docker-compose -f ./srcs/docker-compose.yml up -d --build

all:	$(NAME)

fclean:
	docker-compose -f $(SRCS) down
	docker system prune -a --force
	docker volume rm srcs_db
	docker volume rm srcs_wp

re:	fclean all
