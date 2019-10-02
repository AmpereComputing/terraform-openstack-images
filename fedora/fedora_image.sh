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

if [ -z "$1" ]
then
  echo "!! ------------------------------------------------------------- !!
!! ERROR: No FEDORA_RELEASE argument supplied to script. Please  !!
!! supply '29 or 30' as an option to the script.                 !!
!!                                                               !!
!! USAGE: ./fedora_images.sh (29|30)                             !!
!! ------------------------------------------------------------- !!"
  cd $PROJECT_DIR
  exit
fi
FEDORA_RELEASE=$1


if [ -e Fedora-Cloud-Base-$FEDORA_RELEASE-1.2.x86_64.raw.xz ]
then
  echo "Fedora-Cloud-Base-$FEDORA_RELEASE-1.2.x86_64.raw.xz image found.  Removing image."
  rm -rf Fedora-Cloud-Base-FEDORA_RELEASE-1.2.x86_64.*
else
  echo "No previous Fedora-AtomicHost image found."
fi
wget http://repo.ialab.dsu.edu/fedora/linux/releases/$FEDORA_RELEASE/Cloud/x86_64/images/Fedora-Cloud-Base-$FEDORA_RELEASE-1.2.x86_64.raw.xz -O Fedora-Cloud-Base-$FEDORA_RELEASE-1.2.x86_64.raw.xz
unxz -v Fedora-Cloud-Base-$FEDORA_RELEASE-1.2.x86_64.raw.xz
qemu-img convert -f raw -O qcow2 Fedora-Cloud-Base-$FEDORA_RELEASE-1.2.x86_64.raw Fedora-Cloud-Base-$FEDORA_RELEASE-1.2.x86_64.qcow2
cd $PROJECT_DIR
