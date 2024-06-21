docker build -t aicastleedu/ubuntu22.04-desktop .
docker tag aicastleedu/ubuntu22.04-desktop aicastleedu/ubuntu22.04-desktop:0
docker push aicastleedu/ubuntu22.04-desktop:0
docker push aicastleedu/ubuntu22.04-desktop:latest