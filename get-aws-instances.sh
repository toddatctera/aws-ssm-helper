#!/bin/bash
# Print basic instance details in a given profile's region. 

get_profiles() {
	grep -e 'profile' ~/.aws/config | cut -d ' ' -f 2 | cut -d ']' -f 1
}

get_instances() {
	aws ec2 describe-instances \
	  --filters Name=tag-key,Values=Name \
	  --query 'Reservations[*].Instances[*].{Instance:InstanceId,Name:Tags[?Key==`Name`]|[0].Value}' \
	  --output text \
	  --profile $profilevar 
}

echo 'Configured profiles found in: ~/.aws/config'
get_profiles
read -p 'Please pick a profile: ' profilevar
echo "Getting instance details for '$profilevar'..."
if get_instances; then
	exit 0
else
	echo 'Oops. How about we log in and try again...'
	aws sso login --profile $profilevar
	instance_list=get_instances
fi

