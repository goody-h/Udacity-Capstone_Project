#!/bin/bash

cd "$2"

aws cloudformation update-stack --stack-name "$1"-"$2"-stack  --template-body file://"$2".yml --parameters file://"$2"-parameters.json --region=us-west-2