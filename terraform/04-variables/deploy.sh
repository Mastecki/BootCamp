#!/bin/bash
set -e
terraform init -reconfigure -backend-config=backend.tfvars
terraform fmt --recursive
terraform plan -out=build.plan
if [[ $? -eq 0 ]]
then
    terraform apply build.plan
else
    echo "ERROR: Unable to proceed due to plan failure"
fi