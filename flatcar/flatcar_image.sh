#!/usr/bin/env bash
IMAGE_CACHE=$HOME/.terraform/image_cache

PROJECT_DIR=`pwd`
STABLE='2023.5.0'
BETA='2079.1.0'
ALPHA='2093.0.0'

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
if [ $FLATCAR_RELEASE == 'stable' ]
then
  FLATCAR_VERSION=$STABLE
fi
if [ $FLATCAR_RELEASE == 'beta' ]
then
  FLATCAR_VERSION=$BETA
fi
if [ $FLATCAR_RELEASE == 'alpha' ]
then
  FLATCAR_VERSION=$ALPHA
fi

if [ -e flatcar_production_openstack_image.img ]
  echo "Flatcar image found.  Removing image."
  rm -rf flatcar_production_openstack_image.*
then
  echo "Proceeding to downloading Flatcar $1 images."
  echo
fi
echo -n "Downloading:"
wget -c https://$FLATCAR_RELEASE.release.flatcar-linux.net/amd64-usr/$FLATCAR_VERSION/flatcar_production_openstack_image.img.bz2
echo -n "Extracting:"
bunzip2 -v -d flatcar_production_openstack_image.img.bz2
cd $PROJECT_DIR
