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
!! ERROR: No UBUNTU_RELEASE argument supplied to script. Please  !!
!! supply 'stable, beta or alpha' as an option to the script.    !!
!!                                                               !!
!! USAGE: ./ubuntu_image.sh (bionic|xenial|trusty)               !! 
!! ------------------------------------------------------------- !!"
  cd $PROJECT_DIR
  exit
fi
UBUNTU_RELEASE=$1
if [ $UBUNTU_RELEASE == 'bionic' ]
then
  CLOUDIMG="$UBUNTU_RELEASE-server-cloudimg-arm64"
else
  CLOUDIMG="$UBUNTU_RELEASE-server-cloudimg-arm64-disk1"
fi

if [ -e $CLOUDIMG.img ]
  echo "Ubuntu image found.  Removing image."
  # rm -rf $UBUNTU_RELEASE-server-cloudimg-arm64-disk1.*
then
  echo "Proceeding to downloading Ubuntu $1 image."
  echo
fi
echo -n "Downloading $UBUNTU_RELEASE cloud image:"
wget -c https://cloud-images.ubuntu.com/daily/server/$UBUNTU_RELEASE/current/$CLOUDIMG.img
echo "Converting QCow2 image to RAW:"
qemu-img convert -f qcow2 -O raw $CLOUDIMG.img $CLOUDIMG.raw
cd $PROJECT_DIR
