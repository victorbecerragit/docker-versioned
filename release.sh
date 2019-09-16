set -x
# SET THE FOLLOWING VARIABLES
# docker hub username
USERNAME=victorbecerra
# image name
IMAGE=docker-images
# ensure we're up to date
git pull
# bump version
#docker run --rm -v "$PWD":/ $USERNAME/$IMAGE
#version=`cat VERSION`
container=`docker ps -q --filter ancestor=victorbecerra/helloworld:latest`
version=`docker exec -it $container cat /VERSION`

echo "version: $version"
# run build
#./build.sh
# tag it
git add -A
git commit -m "version $version"
#git tag -a "$version" -m "version $version"
git tag -a `cat VERSION` -m "version $version"
git push
git push --tags
docker tag $USERNAME/$IMAGE:latest $USERNAME/$IMAGE:$version
# push it
docker push $USERNAME/$IMAGE:latest
docker push $USERNAME/$IMAGE:$version
