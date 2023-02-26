#!/bin/bash
set -e
~/.tfenv/bin/terraform init
~/.tfenv/bin/terraform fmt --recursive
if [[ $1 == "destroy" ]]
then
     ~/.tfenv/bin/terraform destroy -var-file=dev.tfvars
     rm -f terraform.tfstate
     rm -f terraform.tfstate.backup
     rm -rf .terraform
     rm -f .terraform.lock.hcl
else
    ~/.tfenv/bin/terraform plan -var-file=dev.tfvars -out=build.plan
    if [[ $? -eq 0 ]]
    then
        ~/.tfenv/bin/terraform apply build.plan
        rm -f build.plan
    else
        echo "ERROR: Unable to proceed due to plan failure"
    fi
fi