# docker-postgresql-orafce

https://hub.docker.com/repository/docker/snzip/pg-orafce


### Usage

- docker run  -p 5432:5432 -v data:/var/lib/postgresql/data -d snzip/pg-orafce:11
- default user/password:  postgres:postgres


 docker build -t snzip/pg-orafce:11  --build-arg http_proxy=http://15.122.46.30:8080 --build-arg https_proxy=http://15.122.46.30:8080  -f Dockerfile .