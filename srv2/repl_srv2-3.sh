#!/bin/bash
unison /var/www ssh://10.0.0.12//var/www -owner -group
new_crontab="* * * * * unison -batch /var/www ssh://10.0.0.12//var/www &> /dev/null"
current_crontab=$(crontab -l 2>/dev/null)
echo "$current_crontab" > temp_crontab
echo "$new_crontab" >> temp_crontab
crontab temp_crontab
rm temp_crontab
