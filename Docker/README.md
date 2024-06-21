# README

- user name : user
- user pwd  : 1234
- rdp port : 3390

## RUN Example
- 22.04
  ```bash
  docker run -d -p 3390:3389 --name ubuntu-desktop aicastleedu/ubuntu22.04-desktop
  ```
- 22.04.ko
  ```bash
  docker run -d -p 3390:3389 --name ubuntu-desktop aicastleedu/ubuntu22.04.ko-desktop
  ```
- 20.04
  ```bash
  docker run -d -p 3390:3389 --name ubuntu-desktop aicastleedu/ubuntu20.04-desktop
  ```
- 20.04.ko
  ```bash
  docker run -d -p 3390:3389 --name ubuntu-desktop aicastleedu/ubuntu20.04.ko-desktop
  ```

## GPU

### Windows
- host (WSL)
    ```bash
    curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
    distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
    curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
    sudo apt-get update
    sudo apt-get install -y nvidia-docker2
    sudo systemctl restart docker
    ```
- run
    ```shell
    docker run --gpus all <image>
    ```

### Mac
- 지원 안됨

### Linux
- host
    ```shell
    distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
    curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
    curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
    sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
    sudo systemctl restart docker
    ```
- run
    ```shell
    docker run --gpus all <image>
    ```

## Docker in Docker

### Window & Mac
- host
    - Docker Desktop -> Settings -> General -> Expose daemon on tcp://localhost:2375 without TLS 옵션 활성화
    - 옵션 활성화 후에 반드시 도커 데스크탑을 수동으로 종료 후 재시작 해야함!
    ```shell
    docker run -itd -p 3390:3389 --restart unless-stopped --privileged --name ubuntu22.04-desktop-dind ubuntu22.04-desktop:latest
    ```
- container
    - 아래 명령 실행 후, 로그 아웃 후 재접속
    ```
    echo 'export DOCKER_HOST=tcp://host.docker.internal:2375' >> ~/.bashrc
    sudo apt update
    sudo apt install -y docker.io
    ```

### Linux
- host
    ```shell
    docker run -itd -p 3390:3389 --restart unless-stopped --privileged -v /var/run/docker.sock:/var/run/docker.sock --name <container> <image>:<tag>
    ```
- container
    - 아래 명령 실행 후, 로그 아웃 후 재접속
    ```
    sudo apt update
    sudo apt install -y docker.io
    ```