#!/usr/bin/env bash

set -x
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

if [ -e FreeBSD-13.0-RELEASE-arm64-aarch64.qcow2.xz ]
then
  echo "FreeBSD-13.0-RELEASE-arm64-aarch64.qcow2.xz image found.  Removing image."
  rm -rf FreeBSD-13.0-RELEASE-arm64*
else
  echo "No previous FreeBSD-13.0 Image Found."
fi
wget https://download.freebsd.org/ftp/releases/VM-IMAGES/13.0-RELEASE/aarch64/Latest/FreeBSD-13.0-RELEASE-arm64-aarch64.qcow2.xz -O FreeBSD-13.0-RELEASE-arm64-aarch64.qcow2.xz
unxz -v FreeBSD-13.0-RELEASE-arm64-aarch64.qcow2.xz
qemu-img convert -f qcow2 -O raw FreeBSD-13.0-RELEASE-arm64-aarch64.qcow2 FreeBSD-13.0-RC1-arm64-aarch64.raw
cd $PROJECT_DIR
