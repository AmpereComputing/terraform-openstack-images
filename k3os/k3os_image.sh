#!/usr/bin/env bash

IMAGE_CACHE=$HOME/.terraform/image_cache

if [ ! -d $IMAGE_CACHE ]; then
  mkdir -p $IMAGE_CACHE
fi

K3OS_RELEASE=$1
ARCH=$2

PROJECT_DIR=`pwd`

echo "Image Cache Location: "
echo $IMAGE_CACHE
echo
echo "Project Directory: "
echo $PROJECT_DIR
echo

cd $IMAGE_CACHE

if [ -z "$1" ]
then
  echo "!! ---------------------------------------------------------------- !!
!! ERROR: No K3OS_RELEASE argument supplied to script. Please       !!
!! supply the release number wanted ass an option to the script.    !!
!!                                                                  !!
!! USAGE: ./k3s_image.sh 0.3.0 arm64                                !!
!! ---------------------------------------------------------------- !!"
  cd $PROJECT_DIR
  exit
fi

if [ -z "$2" ]
then
  echo "!! ---------------------------------------------------------------- !!
!! ERROR: No K3OS_RELEASE argument supplied to script. Please       !!
!! supply the release number wanted ass an option to the script.    !!
!!                                                                  !!
!! USAGE: ./k3s_image.sh 0.3.0 arm64                                !!
!! ---------------------------------------------------------------- !!"
  cd $PROJECT_DIR
  exit
fi

if [ -e k30s-$K3OS_RELEASE-$ARCH.iso ]
then
  echo "k3os-$K3OS_RELEASE-$ARCH.iso image found.  Removing image."
  rm -rf k3os-$K3OS_RELEASE-$ARCH.*
else
  echo "No previous K3OS image found."
fi
wget https://github.com/rancher/k3os/releases/download/v$K3OS_RELEASE/k3os-$ARCH.iso -O k3os-$K3OS_RELEASE-$ARCH.raw
echo "Converting raw image to qcow2"
qemu-img convert -f raw -O qcow2 k3os-$K3OS_RELEASE-$ARCH.raw k3os-$K3OS_RELEASE-$ARCH.qcow2
cd $PROJECT_DIR
