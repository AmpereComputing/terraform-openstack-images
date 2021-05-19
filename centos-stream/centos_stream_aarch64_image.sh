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

echo -n "Downloading and extracting inline:"
wget -c https://cloud.centos.org/centos/8-stream/aarch64/images/CentOS-Stream-GenericCloud-8-20210210.0.aarch64.qcow2 -O CentOS-Stream-GenericCloud-8-20210210.0.aarch64.qcow2
echo -n "Converting images."
qemu-img convert -f qcow2 -O raw CentOS-Stream-GenericCloud-8-20210210.0.aarch64.qcow2 CentOS-Stream-GenericCloud-8-20210210.0.aarch64.raw
cd ${PROJECT_DIR}
