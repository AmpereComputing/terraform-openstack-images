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

if [ -e openEuler-20.03-LTS.x86_64.qcow2 ]
then
  echo "OpenEuler Artifacts found.  Removing all artifacts"
#  rm -rf openEuler-20.03-LTS.x86_64.*
else
  echo "No previous OpenEuler image found."
fi
wget -cv https://repo.openeuler.org/openEuler-20.03-LTS/virtual_machine_img/x86_64/openEuler-20.03-LTS.x86_64.qcow2.xz -O openEuler-20.03-LTS.x86_64.qcow2.xz
unxz -v openEuler-20.03-LTS.x86_64.qcow2.xz
echo "Converting QCOW2 to RAW Image"
qemu-img convert -f qcow2 -O raw openEuler-20.03-LTS.x86_64.qcow2 openEuler-20.03-LTS.x86_64.raw
sha256sum  openEuler-20.03-LTS.x86_64.* > SHA256.openEuler-20.03-LTS.x86_64

cd $PROJECT_DIR
