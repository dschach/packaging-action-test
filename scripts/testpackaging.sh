#!/bin/bash

echo "start"

project=`cat sfdx-project2.json` | jq .
echo "project: $project"
echo "now show namespace"
namespace=$(echo $project | jq -r ."namespace")
#namespace=$($project | jq ".namespace")
echo "$namespace"

packagedirs=$(echo $project | jq ."packageDirectories")
echo $packagedirs
#echo $packagedirs | jq ".[0]"

defaultPath=$(echo $project | jq $packagedirs select(.default == true) | jq ."path")
echo "Default path "$defaultPath

echo "Now the path"
echo $project | jq -c ."packageDirectories" | jq ".[0]" | jq ."path"