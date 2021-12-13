# AWS CLI and SSM Setup for Ubuntu/Debian Distros

More info [here](https://cteranet.atlassian.net/wiki/spaces/~todd/pages/1474068485/Use+AWS+Secure+Session+Manager+with+AWS+CLI)

```
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
unzip awscliv2.zip && \
sudo ./aws/install

curl "https://s3.amazonaws.com/session-manager-downloads/plugin/latest/ubuntu_64bit/session-manager-plugin.deb" -o "session-manager-plugin.deb" && \
sudo dpkg -i ./session-manager-plugin.deb && \
session-manager-plugin

aws configure sso
```
