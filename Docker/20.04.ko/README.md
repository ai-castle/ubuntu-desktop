# Unbuntu 20.04.ko

## info
- user name : user
- user pwd  : 1234
- rdp port : 3390

## RUN
```bash
docker run -d -p 3390:3389 --name ubuntu-desktop aicastleedu/ubuntu20.04.ko-desktop:latest
```

## Version Histroy

### version : 1
- skip : connet your online accounts
- don't upgrade to 22.04
- 한글 설정
    - settings > Regioni & Language > Input Sources > + > Korean (Hangul) 추가 > 상단으로 올리기
    - 우측 상단 EN > KO > Setup > Hangul Toggle Key > Add > 한/영 키 (Alt_R) 누르기 > OK
- 서울 시간대 설정
    ```bash
    sudo su
    ```
    ```bash
    ln -fs /usr/share/zoneinfo/Asia/Seoul /etc/localtime && dpkg-reconfigure --frontend noninteractive tzdata
    ```

### version : 2
- vscode 설치
    - vscode 홈페이지에서 파일 다운로드
    - 설치
        ```bash
        sudo dpkg -i code_1.90.2-1718751586_amd64.deb
        ```
    - 다운로드 파일 삭제
    - 즐겨찾기에 추가
