#!/usr/bin/env bash
IMAGE_CACHE=$HOME/.terraform/image_cache
FEDORA_VERSION=( 29 30 31 32 33)

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

for i in "${FEDORA_VERSION[@]}"
do
  echo "Fedora Version: "$i
  echo
  if [ ${i} == '31' ]
  then
    PT=9
  elif [ ${i} == '32' ]
  then
    PT=6
  else
    PT=2
  fi
  if [ -e Fedora-Server-${i}-1.${PT}.aarch64.raw ]
  then
    echo "Fedora-Server-${i}-1.${PT}.aarch64.raw image found.  Removing image."
    rm -rf Fedora-Server-${i}-1.${PT}.aarch64.*
  else
    echo "No previous Fedora-Server image found."
  fi
  wget https://download-ib01.fedoraproject.org/pub/fedora/linux/releases/${i}/Server/aarch64/images/Fedora-Server-${i}-1.${PT}.aarch64.raw.xz -O Fedora-Server-${i}-1.${PT}.aarch64.raw.xz
  unxz -v Fedora-Server-${i}-1.${PT}.aarch64.raw.xz
done
cd $PROJECT_DIR
