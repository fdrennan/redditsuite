# Getting started

Take the following and insert into `./postgres/.env`

```
POSTGRES_USER=unicorn_user
POSTGRES_PASSWORD=magical_password
POSTGRES_DB=rainbow_database
```

Start the docker container
`docker-compose up -d`

Stop the docker container 
`docker-compose down`

Follow the docker log
`docker-compose logs`

# Destroying Stuff
## Stop all containers
### `docker stop $(docker ps -aq)`

## Remove all containers
### `docker rm $(docker ps -aq)`

## Remove all images
### `docker rmi $(docker images -q)`

## More Danger Commands
### [How to Remove Docker Stuff](https://www.digitalocean.com/community/tutorials/how-to-remove-docker-images-containers-and-volumes) 

# Helpful Links
### [Docker Compose Restart Policies](https://docs.docker.com/config/containers/start-containers-automatically/)
