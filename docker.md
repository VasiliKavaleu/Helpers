
##### Pull an image
`docker pull <image>:<tag>`

##### Start a container
`docker run --name <container_name> -e <environment_variable> -p <host_ports:container_ports> -d <image>:<tag>`

##### Run command in container
`docker exec -it <container_name_or_id> <command>[args]`

##### View container logs
`docker logs <container_name_or_id>`

##### Networks

Networks - for communication between containers

Create network

`docker network create <network-name>`

Connect to network

`docker network connect <network-name> <container-name>`

Inspect network

`docker network inspect <network-name>`

Inspect networks of container

`docker container inspect <container-name>`

###### Command example

`docker run --name project-db -p 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword -e POSTGRES_USER=root -d postgres` # create container

`docker exec -it project-db psql -U root`  # enter to container

`docker logs project-db` # view logs of container

`docker exec -it project-db createdb --username=root --owner=root simple_bank` # execute command in container (create DB)

`docker exec -it project-db psql -U root simple_bank`

  
