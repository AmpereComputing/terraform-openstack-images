#!/usr/bin/env bash
IMAGE_CACHE=$HOME/.terraform/image_cache
IMAGE_NAME=openSUSE-Leap-15.2.aarch64-1.0.1-NoCloud-Build4.85
IMAGE_URL=https://download.opensuse.org/repositories/Cloud:/Images:/Leap_15.2/images/openSUSE-Leap-15.2.aarch64-1.0.1-NoCloud-Build4.85.qcow2

if [ ! -d $IMAGE_CACHE ]; then
  mkdir -p $IMAGE_CACHE
fi

PROJECT_DIR=`pwd`

echo "Image Cache Location: "
echo $IMAGE_CACHE
echo
echo "Project Directory: "
echo $PROJECT_DIR
echo

cd $IMAGE_CACHE

if [ -e ${IMAGE_NAME}.qcow2 ]
then
  echo ${IMAGE_NAME} " image found.  Removing image."
  rm -rf *.qcow2
else
  echo "No previous OpenSuSE image found."
fi
wget ${IMAGE_URL} -O ${IMAGE_NAME}.qcow2
echo "Converting qcow image to raw"
qemu-img convert -f qcow2 -O raw ${IMAGE_NAME}.qcow2 ${IMAGE_NAME}.raw
cd $PROJECT_DIR
