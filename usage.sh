#!/bin/bash
#changes
##########################
# Author : Vajram Gajengi
# Date: 05/09/2023
# Version: V1
##########################
# This script will report the AWS resource the AWS usage
##########################
# List AWS EC2 Instance

set -x

echo -e "\e[32m Print List AWS EC2 Instances \e[0m"

aws ec2 describe-instances >usage.txt

echo "Print List AWS IAM users"

# List AWS IAM Users
aws iam list-users >>usage.txt

#First commit



#second commit


#Third commit
