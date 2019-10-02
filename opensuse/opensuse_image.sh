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
  echo "!! --------------------------------------------------------------- !!
!! ERROR: No OPENSUSE_RELEASE argument supplied to script. Please  !!
!! supply '15.0 or 15.1' as an option to the script.               !!
!!                                                                 !!
!! USAGE: ./opensuse_images.sh (15.0|15.1)                         !!
!! --------------------------------------------------------------- !!"
  cd $PROJECT_DIR
  exit
fi
OPENSUSE_RELEASE=$1


if [ -e openSUSE-Leap-$OPENSUSE_RELEASE-OpenStack.x86_64.qcow2 ]
then
  echo "openSUSE-Leap-$OPENSUSE_RELEASE-OpenStack.x86_64.qcow2 image found.  Removing image."
  rm -rf openSUSE-Leap-$OPENSUSE_RELEASE-OpenStack.x86_64.*
else
  echo "No previous OpenSuSE image found."
fi
wget https://download.opensuse.org/repositories/Cloud:/Images:/Leap_$OPENSUSE_RELEASE/images/openSUSE-Leap-$OPENSUSE_RELEASE-OpenStack.x86_64.qcow2 -O openSUSE-Leap-$OPENSUSE_RELEASE-OpenStack.x86_64.qcow2
echo "Converting qcow image to raw"
qemu-img convert -f qcow2 -O raw openSUSE-Leap-$OPENSUSE_RELEASE-OpenStack.x86_64.qcow2 openSUSE-Leap-$OPENSUSE_RELEASE-OpenStack.x86_64.raw
cd $PROJECT_DIR
