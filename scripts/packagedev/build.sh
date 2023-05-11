npm run x2oddevhub

echo "set managed package"
sed -i "" "s|\"namespace\": \"\"|\"namespace\": \"TestNamespace\"|" sfdx-project.json

sf package version create --code-coverage --path force-app --installation-key-bypass --wait 20
#sfdx force:package:version:create --code-coverage --path sfdx-source/LabsActionPlans --installation-key-bypass --wait 20

echo "unset namespace"
sed -i "" "s|\"namespace\": \"TestNamespace\"|\"namespace\": \"\"|" sfdx-project.json