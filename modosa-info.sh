#!/bin/bash

curl --silent -kL -u peter@swiftserve.com:my_qa_test_script https://provisioning.qa.swiftserve.com/api/agent/v1/status| python -m json.tool | grep job|tr -s ' '}
echo -----
curl --silent -kL -u peter@swiftserve.com:my_qa_test_script https://provisioning.qa.swiftserve.com/api/prefetch/v1/status| python -m json.tool | grep alive |tr -s ' '}
