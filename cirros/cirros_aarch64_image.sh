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

if [ -e cirros-0.5.1-aarch64-disk.raw ]
then
  echo "cirros-0.5.1-aarch64-disk.raw image found.  Removing image."
  rm -rf cirros-0.5.1-aarch64-disk.*
else
  echo "No previous Cirros image found."
fi
wget https://download.cirros-cloud.net/0.5.1/cirros-0.5.1-aarch64-disk.img 
echo "Converting qcow image to raw"
qemu-img convert -f qcow2 -O raw cirros-0.5.1-aarch64-disk.img cirros-0.5.1-aarch64-disk.raw
cd $PROJECT_DIR
