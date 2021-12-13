#!/bin/bash

profile='ccc'

tmux new -s $profile -d
tmux rename-window -t $profile sso
tmux send-keys -t sso "aws sso login --profile $profile; tmux wait-for -S aws-sso-login" C-m\; wait-for aws-sso-login
#tmux send-keys -t sso '~/get-aws-instances.sh' C-m

tmux new-window -t $profile
tmux rename-window -t $profile db1
tmux send-keys -t $profile "aws ssm start-session --profile $profile --target i-015661c7fd236d10f" C-m
tmux send-keys -t $profile "sudo -i" C-m
tmux send-keys -t $profile "portal-manage.sh status" C-m

tmux new-window -t $profile
tmux rename-window -t $profile db2
tmux send-keys -t $profile "aws ssm start-session --profile $profile --target i-0fab75c29e70ea746" C-m
tmux send-keys -t $profile "sudo -i" C-m
tmux send-keys -t $profile "portal-manage.sh status" C-m

tmux new-window -t $profile
tmux rename-window -t $profile app1
tmux send-keys -t $profile "aws ssm start-session --profile $profile --target i-0f8ab851ec2c9e0bf" C-m
tmux send-keys -t $profile "sudo -i" C-m
tmux send-keys -t $profile "portal-manage.sh status" C-m

tmux new-window -t $profile
tmux rename-window -t $profile app2
tmux send-keys -t $profile "aws ssm start-session --profile $profile --target i-047661a5f9883baed" C-m
tmux send-keys -t $profile "sudo -i" C-m
tmux send-keys -t $profile "portal-manage.sh status" C-m

tmux select-window -t 1
tmux attach -t $profile

