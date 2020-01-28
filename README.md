# ft_server
## Summary
The aim of this project is to discover the Docker technology and set up a web server.
## Instructions
* The web server must be set up with Nginx in only one docker container.
* The container OS must be Debian Buster.
* The web server must be able to run several services at the same time. The services are a WordPress website, phpMyAdmin and MySQL.
* Make sure that the SQL database works with WordPress and phpMyAdmin.
* The server should be able to use the SSL Protocol.
* Make sure that the server redirects to the correct website depending on the url.
* Make sure that the server is running with an index that can be disabled.
## Usage
Start Docker.
To build an image from the Dockerfile use command line:
```
docker build -t [name] .
```
To run a container from the image built:
```
docker run -it -p 80:80 -p 443:443 [name]
```