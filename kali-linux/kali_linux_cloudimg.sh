#!/usr/bin/env bash
IMAGE_CACHE=$HOME/.terraform/image_cache

PROJECT_DIR=`pwd`

echo "Image Cache Location: "
echo $IMAGE_CACHE
echo
echo "Project Directory: "
echo $PROJECT_DIR
echo

cd $IMAGE_CACHE

if [ -e kali-linux-2019.1-vbox-amd64.ova ]
then
  echo "Kali-Linux Artifacts found.  Removing all artifacts"
  rm -rf kali-linux-vm.*
  rm -rf Kali-Linux-2019.1-vbox-amd64-*
else
  echo "No previous Kali-Linux image found."
fi
wget https://images.offensive-security.com/virtual-images/kali-linux-2019.1-vbox-amd64.ova -O - | tar -xv
qemu-img convert -f vmdk -O raw Kali-Linux-2019.1-vbox-amd64-disk001.vmdk kali-linux-2019.1-amd64.raw

cd $PROJECT_DIR
