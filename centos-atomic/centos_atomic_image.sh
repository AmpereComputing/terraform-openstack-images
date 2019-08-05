#!/usr/bin/env bash
IMAGE_CACHE=$HOME/.terraform/image_cache

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

if [ -e CentOS-Atomic-Host-GenericCloud.raw ]
then
  echo "CentOS-Atomic-Host-GenericCloud.raw image found.  Removing image."
  rm -rf CentOS-Atomic-Host-GenericCloud.*
else
  echo "No previous Centos-Atomic-Host image found."
fi
wget http://cloud.centos.org/centos/7/atomic/images/CentOS-Atomic-Host-GenericCloud.qcow2.xz -O CentOS-Atomic-Host-GenericCloud.qcow2.xz
echo "Extracting downloaded image"
unxz -v CentOS-Atomic-Host-GenericCloud.qcow2.xz
echo "Converting qcow image to raw"
qemu-img convert -f qcow2 -O raw CentOS-Atomic-Host-GenericCloud.qcow2 CentOS-Atomic-Host-GenericCloud.raw

cd $PROJECT_DIR
