
##### Pull an image
`docker pull <image>:<tag>`

##### Start a container
`docker run --name <container_name> -e <environment_variable> -p <host_ports:container_ports> -d <image>:<tag>`

##### Run command in container
`docker exec -it <container_name_or_id> <command>[args]`

##### View container logs
`docker logs <container_name_or_id>`

####### Command example

`docker run --name project-db -p 5432:5432 -e POSTGRES_PASSWORD=mysecretpassword -e POSTGRES_USER=root -d postgres`
`docker exec -it project-db psql -U root`
`docker logs project-db`

  
