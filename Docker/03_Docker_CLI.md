# Docker CLI

## 터미널 여는 방법
1. Windows
   - 시작 메뉴에서 "cmd" 또는 "Command Prompt" 검색 후 실행.
   - 또는, `Win + R` 키를 누르고 `cmd` 입력 후 Enter.

2. macOS
   - `Cmd + Space` 키를 눌러 Spotlight 검색을 열고 `Terminal` 입력 후 Enter.
   - 또는, "응용 프로그램" 폴더에서 "유틸리티"로 이동한 후 "Terminal" 실행.

3. Linux (Ubuntu 기준)
   - `Ctrl + Alt + T` 키를 누릅니다.
   - 또는, 애플리케이션 메뉴에서 "Terminal" 검색 후 실행.


## 명령어

### 1. 버전 확인
- 버전 확인
    ```sh
    docker --version
    ```

### 2. pull
#### 공식 레포지토리 이미지
- pull : Docker Hub에서 **공식 레포지토리 이미지**를 다운로드합니다. 
    ```sh
    docker pull [이미지 이름]:[태그]
    ```
    - 태그는 버전을 의미합니다.
- 예 : python 3.9.5 버전 다운로드
    ```sh
    docker pull python:3.9.5
    ```
- tag 생략시, 최신 버전 태그(latest) 이미지를 다운로드 합니다. 
    ```sh
    docker pull [이미지 이름]
    ```
- 예 : `nginx` 이미지의 최신버전 다운로드 (`nginx:latest`)
    ```sh
    docker pull nginx
    ```
#### 일반 레포지토리 이미지
- Docker Hub에는 공식 레포지토리 외에도 다양한 사용자 및 조직이 제공하는 이미지가 있습니다. 
- pull : Docker Hub에서 **일반 레포지토리 이미지**를 다운로드합니다. 
    ```sh
    docker pull [사용자 이름]/[이미지 이름]:[태그]
    ```
    - 태그는 버전을 의미합니다.
- 예 : `aicastledev` 사용자의 `ros2school` 이미지의 `01` 태그를 다운로드
    ```sh
    docker pull aicastledev/ros2school:01
    ```
- tag 생략시, 최신 버전 태그(latest) 이미지를 다운로드 합니다. 
    ```sh
    docker pull [사용자 이름]/[이미지 이름]
    ```
- 예 : `aicastledev` 사용자의 `ros2school` 이미지의 최신버전 (`latest`)을 다운로드
    ```sh
    docker pull aicastledev/ros2school
    ```

### 3. images
- 로컬에 저장된 Docker 이미지 목록을 확인합니다.
    ```sh
    docker images
    ```

### 4. run
- Docker 이미지를 기반으로 컨테이너를 실행합니다.
    - 이미지의 최신버전 (`latest`)으로 컨테이너 실행
        ```sh
        docker run [이미지 이름]
        ```
    - 이미지 이름과 태그명으로 컨테이너 실행
        ```sh
        docker run [이미지 이름]:[태그]
        ```
    - 특정 사용자의 이미지의 태그명으로 컨테이너 실행
        ```sh
        docker run [사용자 이름]/[이미지 이름]:[태그]
        ```
    - 로컬에 이미지가 없을 경우 레포지토리에서 탐색하여 pull 작업을 먼저 수행하게 됩니다.
- 예 : `python:3.9.5` 이미지
 예를 들어, `nginx` 이미지를 사용하여 컨테이너를 실행하려면 다음과 같이 입력합니다.
```sh
docker run -d -p 80:80 nginx
```
- `-d`: 백그라운드에서 실행
- `-p`: 호스트와 컨테이너의 포트를 매핑

### 6. 실행 중인 컨테이너 목록 확인
```sh
docker ps
```
현재 실행 중인 컨테이너 목록을 확인합니다.

### 7. 모든 컨테이너 목록 확인
```sh
docker ps -a
```
실행 중이거나 중지된 모든 컨테이너 목록을 확인합니다.

### 8. 컨테이너 중지
```sh
docker stop [컨테이너 ID 또는 이름]
```
실행 중인 컨테이너를 중지합니다.

### 9. 컨테이너 삭제
```sh
docker rm [컨테이너 ID 또는 이름]
```
중지된 컨테이너를 삭제합니다.

### 10. 이미지 삭제
```sh
docker rmi [이미지 ID 또는 이름]
```
로컬에 저장된 이미지를 삭제합니다.

## GUI

Docker는 명령어 기반의 CLI 도구 외에도 GUI 도구를 제공합니다. 대표적인 GUI 도구로는 Docker Desktop과 Portainer가 있습니다.

### 1. Docker Desktop
Docker Desktop은 Windows와 macOS에서 사용할 수 있는 Docker의 공식 GUI 도구입니다. Docker Desktop을 사용하면 Docker 엔진을 쉽게 관리하고, 컨테이너와 이미지를 시각적으로 관리할 수 있습니다.

#### 설치 방법
1. [Docker 공식 웹사이트](https://www.docker.com/products/docker-desktop)에서 Docker Desktop을 다운로드합니다.
2. 다운로드한 설치 파일을 실행하고 설치 과정을 완료합니다.
3. 설치가 완료되면 Docker Desktop을 실행합니다.

### 2. Portainer
Portainer는 Docker 환경을 관리하기 위한 웹 기반의 GUI 도구입니다. Portainer를 사용하면 브라우저를 통해 Docker 컨테이너, 이미지, 네트워크 등을 관리할 수 있습니다.

#### 설치 방법
1. Portainer 이미지를 다운로드합니다.
```sh
docker pull portainer/portainer-ce
```
2. Portainer 컨테이너를 실행합니다.
```sh
docker run -d -p 9000:9000 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
```
3. 브라우저에서 `http://localhost:9000`으로 접속하여 Portainer 웹 UI에 접근합니다.

이제 Docker의 기본 명령어와 GUI 도구를 사용하여 Docker 환경을 관리할 수 있습니다. Docker를 활용하여 다양한 애플리케이션을 컨테이너화하고 효율적으로 배포해보세요.