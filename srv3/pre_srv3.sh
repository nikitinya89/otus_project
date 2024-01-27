#!/bin/bash
apt update && apt upgrade -y

echo -e "if [ -f /etc/bash_completion ] && ! shopt -oq posix; then\n    . /etc/bash_completion\nfi" >> /root/.bashrc
exec bash --rcfile /root/.bashrc
