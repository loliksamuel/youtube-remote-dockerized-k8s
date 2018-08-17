#!/bin/bash

DOCKER_REGISTRY=localhost:5000


if [ -z YR_VERSION ]
then
	echo "YR_VERSION must be set!"
	exit 1
fi
echo "YR_VERSION=$YR_VERSION"

if [ -z WORKSPACE ]
then
	WORKSPACE=${PWD}
fi
echo "WORKSPACE=$WORKSPACE"

echo "Build ynginx image for version ${YR_VERSION}"
cd ${WORKSPACE}/ynginx
docker build -t ${DOCKER_REGISTRY}/yremote/ynginx:${YR_VERSION} .
#docker build -t localhost:5000/yremote/ynginx:2018 .
docker push ${DOCKER_REGISTRY}/yremote/ynginx:${YR_VERSION}
echo
echo "Build yremote image for version ${YR_VERSION}"
cd ${WORKSPACE}/yremote
docker build -t ${DOCKER_REGISTRY}/yremote/yremote:${YR_VERSION} .
#docker build -t localhost:5000/yremote/yremote:2018 .
#23
docker push ${DOCKER_REGISTRY}/yremote/yremote:${YR_VERSION}
