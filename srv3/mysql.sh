#!/bin/bash

for db in `mysql -N -e "SHOW DATABASES"`
	do
		if [[ $db != *_schema ]] && [[ $db != sys ]]
			then
				for tbl in `mysql -N -e "SHOW TABLES IN $db"`
					do
						mkdir -p "/root/mysql_backup/$db/$tbl"
						mysqldump --add-drop-table --add-locks --create-options --disable-keys --extended-insert --single-transaction --quick --set-charset --events --routines --triggers --set-gtid-purged=OFF -u root $db $tbl > /root/mysql_backup/$db/$tbl/$tbl.sql
					done
		fi
	done
