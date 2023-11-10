#!/bin/bash

echo "start"

content=`cat sfdx-project.json`
          # the following lines are only required for multi line json
          content="${content//'%'/'%25'}"
          content="${content//$'\n'/'%0A'}"
          content="${content//$'\r'/'%0D'}"
          # end of optional handling for multi line json
          echo "::set-output name=packageJson::$content"