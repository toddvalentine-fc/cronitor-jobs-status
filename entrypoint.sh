#!/bin/bash
echo "checking tasks..."

if [ "${GITHUB_EVENT_NAME}" != "push" ]; then
    echo "This action only runs on push"
    echo "Found: ${GITHUB_EVENT_NAME}"
    exit 1
fi

RESULT=$(curl https://cronitor.io/api/monitors -u ${INPUT_CRONITOR_KEY}: | jq -c -r '.monitors[] | [.name, .running] | "\(.[0]) \(.[1])"')
while read -r -a arr; do 
    echo "task: ${arr[0]} | status: ${arr[1]}"
    if [[ "${arr[1]}" == "true" ]]; then
        echo "exiting deployment due to running task in AWS environment. check cronitor for details"
        exit 1
    fi    
done  <<< "$RESULT"
 

