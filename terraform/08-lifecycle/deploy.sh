#!/bin/bash
set -e
terraform init -reconfigure -backend-config=backend.tfvars
terraform fmt --recursive
if [[ $1 == "destroy" ]]
then
     terraform destroy -var-file=dev.tfvars
else
    terraform plan -var-file=dev.tfvars -out=build.plan
    if [[ $? -eq 0 ]]
    then
        terraform apply build.plan
        rm -f build.plan
    else
        echo "ERROR: Unable to proceed due to plan failure"
    fi
fi