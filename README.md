"# docker-postgresql-orafce" 



### Usage

- docker run  -p 5432:5432 -v data:/var/lib/postgresql/data -d snzip/pg-orafce:11


 docker build -t snzip/pg-orafce:11  --build-arg http_proxy=http://15.122.46.30:8080 --build-arg https_proxy=http://15.122.46.30:8080  -f Dockerfile .