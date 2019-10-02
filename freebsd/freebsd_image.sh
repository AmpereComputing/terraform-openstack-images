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

if [ -e FreeBSD-12.0-RELEASE-amd64.qcow2.xz ]
then
  echo "FreeBSD-12.0-RELEASE-amd64.qcow2.xz image found.  Removing image."
  rm -rf FreeBSD-12.0-RELEASE-amd64.*
else
  echo "No previous FreeBSD-12.0 Image Found."
fi
wget https://download.freebsd.org/ftp/releases/VM-IMAGES/12.0-RELEASE/amd64/Latest/FreeBSD-12.0-RELEASE-amd64.qcow2.xz
unxz -v FreeBSD-12.0-RELEASE-amd64.qcow2.xz
qemu-img convert -f qcow2 -O raw FreeBSD-12.0-RELEASE-amd64.qcow2 FreeBSD-12.0-RELEASE-amd64.raw
cd $PROJECT_DIR
