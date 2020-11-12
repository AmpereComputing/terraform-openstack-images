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
!! supply '29,30,31,32' as an option to the script.              !!
!!                                                               !!
!! USAGE: ./fedora_images.sh (29|30|31|32|33)                       !!
!! ------------------------------------------------------------- !!"
  cd $PROJECT_DIR
  exit
fi
FEDORA_RELEASE=$1

echo "Fedora Version: "$i
echo

if [ ${FEDORA_RELEASE} == '31' ]
then
  PT=9
  URL=https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/${FEDORA_RELEASE}/Cloud/x86_64/images/Fedora-Cloud-Base-${FEDORA_RELEASE}-1.${PT}.x86_64.raw.xz
elif [ ${FEDORA_RELEASE} == '32' ]
then
  PT=6
  URL=https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/${FEDORA_RELEASE}/Cloud/x86_64/images/Fedora-Cloud-Base-${FEDORA_RELEASE}-1.${PT}.x86_64.raw.xz
elif [ ${FEDORA_RELEASE} == '33' ]
then
  PT=2
  URL=https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/${FEDORA_RELEASE}/Cloud/x86_64/images/Fedora-Cloud-Base-${FEDORA_RELEASE}-1.${PT}.x86_64.raw.xz
else
  PT=2
  URL=https://archives.fedoraproject.org/pub/archive/fedora/linux/releases/${FEDORA_RELEASE}/Cloud/x86_64/images/Fedora-Cloud-Base-${FEDORA_RELEASE}-1.${PT}.x86_64.raw.xz
fi



if [ -e Fedora-Cloud-Base-$FEDORA_RELEASE-1.${PT}.x86_64.raw.xz ]
then
  echo "Fedora-Cloud-Base-$FEDORA_RELEASE-1.${PT}.x86_64.raw.xz image found.  Removing image."
  rm -rf Fedora-Cloud-Base-FEDORA_RELEASE-1.${PT}.x86_64.*
else
  echo "No previous Fedora-AtomicHost image found."
fi
wget ${URL} -O Fedora-Cloud-Base-$FEDORA_RELEASE-1.${PT}.x86_64.raw.xz
unxz -v Fedora-Cloud-Base-$FEDORA_RELEASE-1.${PT}.x86_64.raw.xz
# qemu-img convert -f raw -O qcow2 Fedora-Cloud-Base-$FEDORA_RELEASE-1.${PT}.x86_64.raw Fedora-Cloud-Base-$FEDORA_RELEASE-1.${PT}.x86_64.qcow2
cd $PROJECT_DIR
