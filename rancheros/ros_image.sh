#!/usr/bin/env bash

IMAGE_CACHE=$HOME/.terraform/image_cache

if [ ! -d $IMAGE_CACHE ]; then
  mkdir -p $IMAGE_CACHE
fi

RANCHEROS_RELEASE=$1

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
!! ERROR: No RANCHEROS_RELEASE argument supplied to script. Please  !!
!! supply the release number wanted ass an option to the script.    !!
!!                                                                  !!
!! USAGE: ./ros_image.sh 1.5.4                                      !!
!! ---------------------------------------------------------------- !!"
  cd $PROJECT_DIR
  exit
fi

if [ -e rancheros-openstack.img ]
then
  echo "rancheros-openstack.img image found.  Removing image."
  rm -rf rancheros-openstack.*
else
  echo "No previous RancherOS image found."
fi
wget https://github.com/rancher/os/releases/download/v$RANCHEROS_RELEASE/rancheros-openstack.img
echo "Converting qcow image to raw"
qemu-img convert -f qcow2 -O raw rancheros-openstack.img rancheros-$RANCHEROS_RELEASE-openstack.raw
cd $PROJECT_DIR
