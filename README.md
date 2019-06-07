# build image
docker build -t ast_mongo .

# run
docker-compose up

# list containers, images, volumes and networks
docker container ls
docker image ls
docker volume ls
docker network ls

# info
docker info

# cleanup
docker system prune

# get ip address of container
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' ast-mongo-repset
