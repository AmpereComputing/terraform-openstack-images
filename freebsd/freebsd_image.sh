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

if [ -e FreeBSD-12.0-RELEASE-amd64.raw.xz ]
then
  echo "FreeBSD-12.0-RELEASE-amd64.raw.xz image found.  Removing image."
  rm -rf FreeBSD-12.0-RELEASE-amd64.*
else
  echo "No previous FreeBSD-12.0 Image Found."
fi
wget https://download.freebsd.org/ftp/releases/VM-IMAGES/12.0-RELEASE/amd64/Latest/FreeBSD-12.0-RELEASE-amd64.raw.xz
unxz -v FreeBSD-12.0-RELEASE-amd64.raw.xz
cd $PROJECT_DIR
