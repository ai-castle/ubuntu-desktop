docker build -t aicastleedu/ubuntu22.04.ko-desktop .
docker tag aicastleedu/ubuntu22.04.ko-desktop aicastleedu/ubuntu22.04.ko-desktop:0
docker push aicastleedu/ubuntu22.04.ko-desktop:0
docker push aicastleedu/ubuntu22.04.ko-desktop:latest