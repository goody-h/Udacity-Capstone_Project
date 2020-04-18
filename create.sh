#!/bin/bash

cd "$2"

aws cloudformation create-stack --stack-name "$1"-"$2"  --template-body file://"$2".yml --parameters file://"$2"-parameters.json --capabilities CAPABILITY_IAM --region=us-west-2
