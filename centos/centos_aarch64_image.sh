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
!! ERROR: No CENTOS_RELEASE argument supplied to script. Please  !!
!! supply '7  as the only option to the script.                  !!
!!                                                               !!
!! USAGE: ./centos_aarch64_images.sh 7                                   !! 
!! ------------------------------------------------------------- !!"
  cd $PROJECT_DIR
  exit
fi
CENTOS_RELEASE=$1

if [ -e CentOS-$CENTOS_RELEASE-aarch64-GenericCloud.raw ]
  echo "CentOS image found.  Removing image."
  rm -rf Centos-$CENTOS_RELEASE-aarch64-GenericCloud.*
then
  echo "Proceeding to downloading CentOS $1 images."
  echo
fi
echo -n "Downloading and extracting inline:"
wget -c http://cloud.centos.org/altarch/$CENTOS_RELEASE/images/aarch64/CentOS-$CENTOS_RELEASE-aarch64-GenericCloud-1708.qcow2.xz -O CentOS-$CENTOS_RELEASE-aarch64-GenericCloud-1708.qcow2.xz
unxz -v CentOS-$CENTOS_RELEASE-aarch64-GenericCloud-1708.qcow2.xz
qemu-img convert -f qcow2 -O raw CentOS-$CENTOS_RELEASE-aarch64-GenericCloud-1708.qcow2 CentOS-$CENTOS_RELEASE-aarch64-GenericCloud-1708.raw
cd $PROJECT_DIR

