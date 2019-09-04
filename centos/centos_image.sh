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
!! supply '6 or 7' as an option to the script.                   !!
!!                                                               !!
!! USAGE: ./centos_images.sh (6|7)                !! 
!! ------------------------------------------------------------- !!"
  cd $PROJECT_DIR
  exit
fi
CENTOS_RELEASE=$1
CENTOS_VERSION='1901'

if [ -e CentOS-$CENTOS_RELEASE-x86_64-GenericCloud-$CENTOS_VERSION.raw ]
  echo "CentOS image found.  Removing image."
  rm -rf flatcar_production_openstack_image.*
then
  echo "Proceeding to downloading CentOS $1 images."
  echo
fi
echo -n "Downloading and extracting inline:"
wget -c http://cloud.centos.org/centos/7/images/CentOS-$CENTOS_RELEASE-x86_64-GenericCloud-$CENTOS_VERSION.raw.tar.gz -O - | tar -xv
cd $PROJECT_DIR
