docker build -t aicastleedu/ubuntu20.04.ko-desktop .
docker tag aicastleedu/ubuntu20.04.ko-desktop aicastleedu/ubuntu20.04.ko-desktop:0
docker push aicastleedu/ubuntu20.04.ko-desktop:0
docker push aicastleedu/ubuntu20.04.ko-desktop:latest