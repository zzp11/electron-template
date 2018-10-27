#!/bin/bash

if [ $# != 1 ] ; then 
    echo "usage: ./publish.sh <打包应用目标地址>"
    exit
fi

rm -rf $1
mkdir $1

dist_path=$1

yarn dist
cp ./dist/app-1.0.0-x86_64.AppImage $dist_path/app.AppImage

cp -r ./src $dist_path/src
cp -r ./dependencies $dist_path/dependencies

cp ./scripts/install.sh $dist_path/install.sh
cp ./scripts/run.sh $dist_path/run.sh

