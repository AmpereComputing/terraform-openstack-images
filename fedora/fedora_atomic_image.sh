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

if [ -e Fedora-AtomicHost-29.raw ]
then
  echo "Fedora-AtomicHost-29.raw image found.  Removing image."
  rm -rf Fedora-AtomicHost-29.*
else
  echo "No previous Fedora-AtomicHost image found."
fi
wget https://download.fedoraproject.org/pub/alt/atomic/stable/Fedora-29-updates-20190318.0/AtomicHost/x86_64/images/Fedora-AtomicHost-29-20190318.0.x86_64.raw.xz -O Fedora-AtomicHost-29.raw.xz
unxz -v Fedora-AtomicHost-29.raw.xz
qemu-img convert -f raw -O qcow2 Fedora-AtomicHost-29.raw Fedora-AtomicHost-29.qcow2
cd $PROJECT_DIR
