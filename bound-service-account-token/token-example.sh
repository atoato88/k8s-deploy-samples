#!/bin/bash

echo check TokenRequest and TokenReview

#ref: https://qiita.com/hiyosi/items/35c22507b2a85892c707
#ref: https://jpweber.io/blog/a-look-at-tokenrequest-api/

# check if "kubectl proxy" is ready
ENDPOINT="http://127.0.0.1:8001"

curl -v ${ENDPOINT}/api 2>&1 | grep -q "HTTP/1.1 200"
if [ $? != "0" ]
then
	echo "can't access to ${ENDPOINT}/api, this script suppose to run \"kubectl proxy\" on other terminal before run this."
	exit 1
fi

# do TokenRequest

DATA='{
  "kind": "TokenRequest",
  "apiVersion": "authentication.k8s.io/v1",
  "spec": {
    "audience": [
      "https://kubernetes.default.svc"
    ],
    "validityDuration": "24h"
  }
}'

RESPONSE=$(curl  -H "Content-Type: application/json" -X POST ${ENDPOINT}/api/v1/namespaces/default/serviceaccounts/default/token -d "${DATA}")
echo ${RESPONSE} | jq .

TOKEN=$(echo ${RESPONSE} | jq -r .status.token)

echo ${TOKEN}

# do TokenReview
echo

REVIEW_DATA="{
  \"kind\": \"TokenReview\",
  \"apiVersion\": \"authentication.k8s.io/v1\",
  \"spec\": {
    \"token\": \"${TOKEN}\"
  }
}"

curl  -H "Content-Type: application/json" -X POST ${ENDPOINT}/apis/authentication.k8s.io/v1/tokenreviews -d "${REVIEW_DATA}" | jq .
