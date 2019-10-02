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
!! ERROR: No FLATCAR_RELEASE argument supplied to script. Please !!
!! supply 'stable, beta or alpha' as an option to the script.    !!
!!                                                               !!
!! USAGE: ./flatcar_images.sh (stable|beta|alpha)                !! 
!! ------------------------------------------------------------- !!"
  cd $PROJECT_DIR
  exit
fi
FLATCAR_RELEASE=$1
if [ ! -d $IMAGE_CACHE/$FLATCAR_RELEASE ]; then
  mkdir -p $IMAGE_CACHE/$FLATCAR_RELEASE
fi



if [ -e $FLATCAR_RELEASE/flatcar_production_openstack_image.img ]
  echo "Flatcar image found.  Removing image."
  rm -rf $FLATCAR_RELEASE/flatcar_production_openstack_image.*
then
  echo "Proceeding to downloading Flatcar $1 images."
  echo
fi
cd $FLATCAR_RELEASE
echo -n "Downloading:"
wget -c https://$FLATCAR_RELEASE.release.flatcar-linux.net/amd64-usr/current/flatcar_production_openstack_image.img.bz2
echo -n "Extracting:"
bunzip2 -v -d flatcar_production_openstack_image.img.bz2
echo "Converting qcow image to raw"
qemu-img convert -f qcow2 -O raw flatcar_production_openstack_image.img flatcar_production_openstack_image.raw

cd $PROJECT_DIR
