# otus_project
## Схема сети

![image](network.jpg)


## otus_srv1 (10.0.0.10)
**Frontend, Nginx**
- Frontend веб-сервер с использованием Nginx. Используется для трансляции запросов к Backend серверам.

## otus_srv2 (10.0.0.11)
**Backend, Apache, WordPress, MySQL Source**
- Backend веб-сервер 1 с использованием Apache, хостит WordPress с MySQL в качестве базы данных.
- Настроена CMS система WordPress с использованием СУБД MySQL.
- MySQL Source. Настроена репликация MySQL с сервером otus_srv3.
- Файлы WordPress синхронизированы с сервером otus_srv3 с использованием утилиты unison.

## otus_srv3 (10.0.0.12)
**Backend, Apache, WordPress, MySQL Replica**
- Backend веб-сервер 2 с использованием Apache, хостит WordPress с MySQL в качестве базы данных.
- Настроена CMS система WordPress с использованием СУБД MySQL.
- MySQL Replica. Настроена репликация MySQL с сервером otus_srv2.
- Файлы WordPress синхронизированы с сервером otus_srv2 с использованием утилиты unison.

## otus_srv4 (10.0.0.13)
**Prometheus, Grafana**
- Установлены Prometheus для мониторинга и Grafana для визуализации.

## otus_srv5 (10.0.0.14)
**ELK**
- Настроен стек ELK (Elasticsearch, Logstash, Kibana) для анализа логов Frontend веб спервера.  
## Ссылки
>**MySQL DB:** wordpress_db  
>**Пользователь MySQL:** wordpress  
>**Консоль администратора:** [http://10.0.0.11/wp-admin/](http://10.0.0.11/wp-admin/)  
>**FrontEnd:** [http://10.0.0.10/](http://10.0.0.10/)  
>**BackEnd 1:** [http://10.0.0.11/](http://10.0.0.11/)  
>**BackEnd 2:** [http://10.0.0.12/](http://10.0.0.12/)  
>**Grafana:** [http://10.0.0.13:3000/](http://10.0.0.13:3000/)  
>**Kibana:** [http://10.0.0.14:5601/](http://10.0.0.14:5601/)  

## Disaster Recovery Plan
Целью DRP является максимально быстрое восстановление всей серверной инфраструктуры из резервных копий, автоматизированное с помощью скриптов.
### Порядок восстановления
- Настроить сеть на серверах в соответствии со схемой. [Yaml файлы для netplan](https://github.com/nikitinya89/otus_project/tree/main/netplan/)
- Запустить на каждом сервере соответствующий скрипт pre_srv*.sh. Все скрепты запускаются под учетной записью root
- Скопировать публичный ssh ключ сервера otus_srv2 /root/.ssh/id_rsa.pub и добавить его на сервер otus_srv3 в /root/.ssh/authorized_keys
- Скопировать публичный ssh ключ сервера otus_srv3 /root/.ssh/id_rsa.pub и добавить его на сервер otus_srv2 в /root/.ssh/authorized_keys
- Поочередно запустить на каждом сервере скрипт srv*.sh. Все скрепты запускаются под учетной записью root. Дождаться завершения работы скрипта и запустить на следующем сервере. Необходимо, чтобы скрипт srv2.sh на сервере otus_srv2 отработал раньше, чем будет запущен скрипт srv2.sh на сервере otus_srv3
- Проверить работоспособность всех сервисов

## Описание работы скриптов
### pre_srv1.sh
>- Устанавливаются пакеты git, nginx, prometheus-node-exporter
>- Генерируется SSH ключ
>- Клонируется этот репозиторий
>- Скачивается и устанавливается deb пакет filebeat

### pre_srv2.sh и pre_srv3.sh
>- Устанавливаются пакеты git, apache2, prometheus-node-exporter, mysql-server-8.0, php8.1, php8.1-mysql, libapache2-mod-php8.1, php8.1-cli, php8.1-cgi, php8.1-gd, unison
>- Генерируется SSH ключ
>- Клонируется этот репозиторий

### pre_srv4.sh
>- Устанавливаются пакеты git, prometheus, prometheus-node-exporter
>- Генерируется SSH ключ
>- Клонируется этот репозиторий
>- Скачивается и устанавливается deb пакет grafana

### pre_srv5.sh
>- Устанавливаются пакеты git, prometheus-node-exporter
>- Генерируется SSH ключ
>- Клонируется этот репозиторий
>- Скачивается и устанавливается deb пакеты elasricsearch, kibana, logstash

### srv1.sh
>- Копируются конфигурационные файлы nginx
>- Создается символическая ссылка в каталоге sites-enabled
>- Копируются конфигурационный файл filebeat
>- Активируется модуль nginx для filebeat

### srv2.sh
>- Копируется каталог wordpress
>- Устанавливаются необходимые права для пользователя www-data
>- Копируются конфигурационные файлы apache и mysql
>- Восстанавливается база данных wordpress_db
>- Создается пользователи wordpress и repl в mysql и назначаются необходимые права
>- С помощью утилиты unison копируется каталог wordpress на сервер otus_srv3
>- Добавляется задача в crontab на ежеминутный запуск unison

### srv3.sh
>- Копируются конфигурационные файлы apache и mysql
>- Восстанавливается база данных wordpress_db
>- Настраивается репликация mysql с сервером otus_srv2
>- Копируется скрипт создания резервной копии mysql и добавляется на выполнение в crontab каждую субботу в 23:00

### srv4.sh
>- Копируются конфигурационные файлы prometheus и grafana
>- Копируется база данных, которую использует grafana

### srv5.sh
>- Копируются конфигурационные файлы elasticsearch, kibana и logstash
>- Импортируется json файл настроек kibana
