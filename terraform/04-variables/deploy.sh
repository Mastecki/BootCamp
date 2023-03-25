#!/bin/bash
set -e
terraform init -reconfigure -backend-config=backend.tfvars
terraform fmt --recursive
# terraform plan -var-file=env_vars/dev.tfvars -out=build.plan
terraform plan -out=build.plan
if [[ $? -eq 0 ]]
then
    terraform apply build.plan
    # terraform apply -var-file=env_vars/dev.tfvars
    rm -f build.plan
else
    echo "ERROR: Unable to proceed due to plan failure"
fi
