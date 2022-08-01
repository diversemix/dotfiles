#!/bin/bash 

SH="gnome-terminal  -- "
echo "**********************************************************"
echo socat TCP-LISTEN:5432,reuseaddr,fork TCP4:${PROD_RDS}:5432 
echo "**********************************************************"
${SH} aws --profile cpr --region eu-west-2 ssm start-session --target ${PROD_TARGET}

${SH} aws --profile cpr --region eu-west-2 ssm start-session --target ${PROD_TARGET} --document-name AWS-StartPortForwardingSession --parameters '{"portNumber":["5432"],"localPortNumber":["5434"]}'
