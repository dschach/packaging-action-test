#!/bin/bash

echo "start"

defaultpath=$(jq -r '.packageDirectories.[] | select(.default==true) | .path' sfdx-project.json)
echo $defaultpath
mynamespace=$(jq -r '.namespace' sfdx-project.json)
echo $mynamespace
defaultPackage=$(jq -r '.packageDirectories.[] | select(.default==true)' sfdx-project.json)
echo $defaultPackage
mypath=$(echo $defaultPackage | jq -r '.path')
echo $mypath
echo "parse version"
version=$(jq '.packageDirectories.[] | select(.default==true) | .versionNumber' sfdx-project2.json)
echo "version "$version

versionArray=$(jq '.packageDirectories.[] | select(.default==true) .versionNumber | split(".")' sfdx-project2.json)
echo $versionArray

major=1
minor=2
patch=3
versionNumber=$(echo $major'.'$minor'.'$patch'.0')
echo $versionNumber
