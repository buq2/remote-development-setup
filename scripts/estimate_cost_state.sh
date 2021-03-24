#!/bin/bash

# See: https://github.com/antonbabenko/terraform-cost-estimation
curl -sLO https://raw.githubusercontent.com/antonbabenko/terraform-cost-estimation/master/terraform.jq
terraform state pull | jq -cf terraform.jq | curl -s -X POST -H "Content-Type: application/json" -d @- https://cost.modules.tf/
