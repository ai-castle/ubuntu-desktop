# get version
if [ -f ".version" ]; then
    version=$(cat .version)
    version=$((version + 1))  # version up
else
    version=1  # version init
fi

# versiono save
echo $version > .version

# stop
docker stop ubuntu-desktop

# commit
docker commit ubuntu-desktop aicastleedu/ubuntu22.04.ko-desktop

# push : latest
docker push aicastleedu/ubuntu22.04.ko-desktop:latest

# push : version
docker tag aicastleedu/ubuntu22.04.ko-desktop aicastleedu/ubuntu22.04.ko-desktop:$version
docker push aicastleedu/ubuntu22.04.ko-desktop:$version

# start
docker start ubuntu-desktop