!#/bin/bash
MYSQL_COMMANDS="STOP REPLICA;
CHANGE REPLICATION SOURCE TO SOURCE_HOST='10.0.0.11', SOURCE_USER=$DB_USER, SOURCE_PASSWORD=$DB_PASSWORD, SOURCE_AUTO_POSITION = 1, GET_SOURCE_PUBLIC_KEY = 1;
START REPLICA;
mysql -e "$MYSQL_COMMANDS"