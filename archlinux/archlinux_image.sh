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

if [ -e arch-openstack-LATEST-image-bootstrap.qcow2 ]
then
  echo "arch-openstack-LATEST-image-bootstrap.qcow2 image found.  Removing image."
  rm -rf arch-openstack-LATEST-image-bootstrap.*
else
  echo "No previous Archlinux image found."
fi
wget https://linuximages.de/openstack/arch/arch-openstack-LATEST-image-bootstrap.qcow2 
echo "Converting qcow image to raw"
qemu-img convert -f qcow2 -O raw arch-openstack-LATEST-image-bootstrap.qcow2 arch-openstack-LATEST-image-bootstrap.raw
cd $PROJECT_DIR
