#!/bin/bash

echo "Set x2od org as dev hub"
npm run x2oddevhub

echo "Clearing namespace"
sed -i "" "s|\"namespace\": \"\"|\"namespace\": \"\"|" sfdx-project.json

echo "Cleaning previous scratch org..."
sf org delete scratch --no-prompt --target-org=ChangeMe

echo "Creating new scratch org"
sf org create scratch --definition-file config/project-scratch-def.json --duration-days 10 --alias ChangeMe --set-default

echo "Pushing metadata"
sf deploy metadata

#echo "Assigning Permissions"
#sf org assign permset --name PermSetName

echo "Adding sample data"
sf apex run --file ./data/data-plan.json

echo "opening org"
sf org open

echo "Org is set up"