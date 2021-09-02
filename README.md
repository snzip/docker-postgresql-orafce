# docker-postgresql-orafce

https://hub.docker.com/repository/docker/snzip/pg-orafce

This allows you to install Postgresql with the extension pg-orafce in Docker.

### Usage

- docker run  -p 5432:5432 -v data:/var/lib/postgresql/data -d snzip/pg-orafce:11
- default user/password:  postgres:postgres


 docker build -t snzip/pg-orafce:11  --build-arg http_proxy=http://15.122.46.30:8080 --build-arg https_proxy=http://15.122.46.30:8080  -f Dockerfile .
 
 After running the first script, the app will launch automaticly. For the local port you could choose whatever port you want and the related container/postgres default port is 5432. 
 Here is the example:
 docker run  -p 5433:5432 -v data:/var/lib/postgresql/data -d snzip/pg-orafce:11
 
 For the detail installation, please go to 11/Dockerfile to see how it installed.
