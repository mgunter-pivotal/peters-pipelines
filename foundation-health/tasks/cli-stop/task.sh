#!/bin/bash

set -xu

sysdomain=$(echo $CF_API_URL | sed 's~http[s]*://api.~~g')
output=$(curl -k hw-data-access.$sysdomain/v1/cfapi-stop | jq ".status")
echo $output

if [ "$output" -eq "1" ]
then
    exit 0
fi

echo "Cannot stop an app to the platform!!"
exit 1