# docker-postgresql-orafce

https://hub.docker.com/repository/docker/snzip/pg-orafce

This allows you to install Postgresql with the extension pg-orafce in Docker.


## Supported version tag
- snzip/pg-orafce:11
- snzip/pg-orafce:13   (3.7)
- snzip/pg-orafce:14   (14.12)
- snzip/pg-orafce:15   (15.8)

## Build 

```

export HTTP_PROXY=http://web-proxy.jp.softwaregrp.net:8080/
export HTTPS_PROXY=http://web-proxy.jp.softwaregrp.net:8080/


docker build -t snzip/pg-orafce:13  --build-arg http_proxy=http://15.122.63.30:8080 --build-arg https_proxy=http://15.122.63.30:8080  -f Dockerfile .

cd 14
docker build -t snzip/pg-orafce:15  --build-arg http_proxy=http://15.122.63.30:8080 --build-arg https_proxy=http://15.122.63.30:8080  -f Dockerfile .


docker build -t snzip/pg-orafce:14  --build-arg http_proxy=http://172.27.96.1:7890 --build-arg https_proxy=http://172.27.96.1:7890  -f Dockerfile .
 
 ```


### Usage

- docker run  -p 5432:5432 -v data:/var/lib/postgresql/data -d snzip/pg-orafce:13
- default user/password:  postgres:postgres



 After running the first script, the app will launch automaticly. For the local port you could choose whatever port you want and the related container/postgres default port is 5432. 
 Here is the example:
 docker run  -p 5433:5432 -v data:/var/lib/postgresql/data -d snzip/pg-orafce:14
 
 For the detail installation, please go to 11/Dockerfile to see how it installed.


## History 

- 2024/07/16
  change to oraclelinux:9
  support 14/15
  