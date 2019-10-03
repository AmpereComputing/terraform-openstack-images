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

if [ -e devuan_ascii_2.0.0_amd64_qemu.qcow2.xz ]
then
  echo "Devuan Artifacts found.  Removing all artifacts"
  rm -rf devuan_ascii_2.0.0_amd64_qemu.*
else
  echo "No previous Devuan image found."
fi
wget https://mirror.leaseweb.com/devuan/devuan_ascii/virtual/devuan_ascii_2.0.0_amd64_qemu.qcow2.xz -O devuan_ascii_2.0.0_amd64_qemu.qcow2.xz
unxz -v devuan_ascii_2.0.0_amd64_qemu.qcow2.xz

echo "Converting QCOW2 to RAW Image"
qemu-img convert -f qcow2 -O raw devuan_ascii_2.0.0_amd64_qemu.qcow2 devuan_ascii_2.0.0_amd64_qemu.raw

cd $PROJECT_DIR
