#!/bin/bash
apt update && apt upgrade -y
apt install bash-completion  nginx git -y
mkdir ~/repo && cd ~/repo && git init
git config --global user.name "Yuriy Nikitin"
git config --global user.email nikitinya89@gmail.com
git branch -m master main
git remote add origin git@github.com:nikitinya89/otus_project.git
git pull origin main
chmod +x ~/repo/*/*.sh
