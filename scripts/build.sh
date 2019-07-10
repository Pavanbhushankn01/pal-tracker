#!/usr/bin/env bash
set -ex

echo "-----------"
echo $1 

DISABLE_AUTH=true 
echo `pwd`
dotnet test ./test/PalTrackerTests
artifacts_path=/tmp/artifacts

build_output="/tmp/build-output"
artifacts_path="./artifacts"
version=$1

mkdir -p $build_output
echo "-----------"
echo $1 
echo $build_output
echo $artifacts_path
echo "-----------"

mkdir -p $artifacts_path

cp manifest-*.yml $build_output

dotnet publish src/PalTracker --configuration Release \
    --output $build_output/src/PalTracker/bin/Release/netcoreapp2.2/publish

tar -C $build_output/ -cvzf $artifacts_path/pal-tracker-$version.tgz .
