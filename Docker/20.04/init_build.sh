docker build -t aicastleedu/ubuntu20.04-desktop . 
docker tag aicastleedu/ubuntu20.04-desktop aicastleedu/ubuntu20.04-desktop:0
docker push aicastleedu/ubuntu20.04-desktop:0
docker push aicastleedu/ubuntu20.04-desktop:latest