#!/bin/bash

apt update
apt upgrade -y
apt install tmux curl wget git htop mc ufw -y

curl -fsSL https://tailscale.com/install.sh | sh
sudo tailscale up --ssh

ufw reset
ufw default deny incoming
ufw default allow outgoing
ufw allow in on tailscale0
ufw deny 22
ufw enable
ufw reload
ufw status verbose
