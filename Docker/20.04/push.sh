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
docker commit ubuntu-desktop aicastleedu/ubuntu20.04-desktop

# push : latest
docker push aicastleedu/ubuntu20.04-desktop:latest

# push : version
docker tag aicastleedu/ubuntu20.04-desktop aicastleedu/ubuntu20.04-desktop:$version
docker push aicastleedu/ubuntu20.04-desktop:$version

# start
docker start ubuntu-desktop