# S3 sync application
Dockerized application that can be run under Marathon management to dynamically sync objects between two S3 buckets.

## Building the Docker container

How to build the container:
```
docker build .
docker tag <tagid> <repository>/s3sync:latest
docker push <repository>/s3sync:latest
```

