# Docker Desktop 설치

## [1] Windows 에 Docker Desktop 설치

- [설치 가이드 공식 문서](https://docs.docker.com/desktop/install/windows-install/)
- 시스템 요구사항
    - OS : Windows 10 또는 Windows 11
    - processor : 64-bit
    - RAM : 4GM 이상


### 1. wsl 설치

#### (방법 1) 자동 설치 (wsl 명령어가 있는 경우)
- [자동 설치 가이드 공식 문서](https://learn.microsoft.com/ko-kr/windows/wsl/install)
- **관리자 권한**으로 PowerShell 을 실행
- 아래 명령어 입력
    ```powershell
    wsl --install
    ```

#### (방법 2) 수동 설치 (wsl가 없는 명령어가 없는 경우)
- [자동 설치 가이드 공식 문서](https://learn.microsoft.com/ko-kr/windows/wsl/install)

- Linux용 Windows 하위 시스템 사용
    - **관리자 권한**으로 PowerShell 을 실행
        ```powershell
        dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart
        ```
    - 컴퓨터 재부팅
- Virtual Machine 기능 사용
    - **관리자 권한**으로 PowerShell 을 실행
        ```powershell
        dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart
        ```
    - 컴퓨터 재부팅
- WSL2 Linux 커널 업데이트
    - 다운로드 : [링크](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi)
    - 파일명 : `wsl_update_x64.msi`
    - 다운로드한 파일을 관리자 권한으로 실행
    - 컴퓨터 재부팅


### 2. WSL 버전 2로 변경 및 업데이트
- 버전 변경
    ```powershell
    wsl --set-default-version 2
    ```
- 업데이트
    ```powershell
    wsl --update
    ```


### 3. WSL에 리눅스 배포판 Ubuntu 설치

#### (방법 1) Microsoft Store 를 통한 설치
- Microsoft Store 열기
- Ubuntu 검색 후 설치
    
#### (방법 2) 리눅스 배포판 이미지 파일로 설치
- [배포판 다운로드](https://learn.microsoft.com/ko-kr/windows/wsl/install-manual#downloading-distributions) 홈페이지에 가서 Ubuntu 다운로드
    - 파일명 :`Ubuntu2204-221101.AppxBundle`
- **관리자 권한**으로 PowerShell 을 실행
- .appx 파일 설치 (파일 경로 부분 직접 수정해야 함)
    ```powershell
    Add-AppxPackage -Path "C:\Downloads\Ubuntu2204-221101.AppxBundle"
    ```

### 4. Ubuntu 초기 설정
- 설치가 완료되면 Start 메뉴에서 "Ubuntu"를 검색하여 실행
- 사용자 이름과 비밀번호를 설정

### 5. Docker Desktop 설치 파일 다운로드
- [docker desktop](https://www.docker.com/products/docker-desktop/) 홈페이지에서 설치 파일 다운로드
    - 파일명 : `Docker Desktop Installer.exe`


### 6. Docker Desktop 설치
- 설치 파일을 실행하고 설치 마법사의 지시에 따릅니다.
- 설치 중에 "Use the WSL 2 based engine" 옵션을 선택합니다.
- Docker Desktop을 실행하고 초기 설정을 완료합니다.


### 7. Docker 작동 확인
- Docker 버전 확인:
    ```sh
    docker --version
    ```
- Docker 테스트:
    ```sh
    docker run hello-world
    ```


## [2] Mac 에 Docker Desktop 설치

- [설치 가이드 공식 문서](https://docs.docker.com/desktop/install/mac-install/)
- 시스템 요구사항
    - macOS 10.15 (Catalina) 이상
    - RAM : 4GM 이상


### 1. Docker Desktop 설치 파일 다운로드
- [docker desktop](https://www.docker.com/products/docker-desktop/) 홈페이지에서 설치 파일 다운로드
    - 파일명 : `Docker.dmg`


### 2. Docker Desktop 설치
- 다운로드한 DMG 파일을 열고 Docker 아이콘을 애플리케이션 폴더로 드래그합니다.
- 애플리케이션 폴더에서 Docker를 실행합니다.
- 초기 설정 마법사에 따라 설정을 완료합니다.


### 3. Docker 작동 확인
- Docker 버전 확인:
    ```sh
    docker --version
    ```
- Docker 테스트:
    ```sh
    docker run hello-world
    ```


## [3] Ubuntu 에 Docker Desktop 설치

- [설치 가이드 공식 문서](https://docs.docker.com/desktop/install/ubuntu/)
- 시스템 요구사항
    - Ubuntu 20.04 LTS, 22.04 LTS
    - 64-bit 프로세서
    - RAM: 4GB 이상


### 1. Docker Desktop 설치 파일 다운로드
- [docker desktop](https://www.docker.com/products/docker-desktop/) 홈페이지에서 설치 파일 다운로드
    - 파일명 : `docker-desktop-4.30.0-amd64.deb`


### 2. Docker Desktop 설치
- 패키지 업데이트:
    ```sh
    sudo apt-get update
    ```
- Docker Desktop 설치:
    ```sh
    cd <file_path>
    sudo apt-get install ./docker-desktop-4.30.0-amd64.deb
    ```


### 3. Docker 권한 설정
- 현재 사용자를 `docker` 그룹에 추가:
    ```sh
    sudo usermod -aG docker $USER
    ```
- 변경 사항을 적용하기 위해 로그아웃한 후 다시 로그인.


### 4. Docker Desktop 실행 및 초기 설정
- Docker Desktop을 시작:
    ```sh
    systemctl --user start docker-desktop
    systemctl --user enable docker-desktop
    ```


### 5. Docker 작동 확인
- Docker 버전 확인:
    ```sh
    docker --version
    ```
- Docker 테스트:
    ```sh
    docker run hello-world
    ```

