# otus_project

## otus_srv1 (10.0.0.10)
**Frontend, Nginx**
- FrontEnd веб-сервер с использованием Nginx. Используется для трансляции запросов к BackEnd серверам.

## otus_srv2 (10.0.0.11)
**Backend, Apache, WordPress, MySQL Master**
- BackEnd веб-сервер 1 с использованием Apache, хостит WordPress с MySQL в качестве базы данных.
- Настроена CMS система WordPress с использованием СУБД MySQL.
- Настроена репликация MySQL с сервером otus_srv3 в роли Slave.
- Является Master сервером.
- Файлы WordPress синхронизированы с сервером otus_srv3 с использованием утилиты unison.

## otus_srv3 (10.0.0.12)
**Backend, Apache, WordPress, MySQL Slave**
- BackEnd веб-сервер 2 с использованием Apache, хостит WordPress с MySQL в качестве базы данных.
- Настроена CMS система WordPress с использованием СУБД MySQL.
- Настроена репликация MySQL с сервером otus_srv2 в роли Master.
- Является Slave сервером.
- Файлы WordPress синхронизированы с сервером otus_srv2 с использованием утилиты unison.

## otus_srv4 (10.0.0.13)
**Prometheus, Grafana**
- Сервер, на котором установлены Prometheus для мониторинга и Grafana для визуализации.

## otus_srv5 (10.0.0.14)
**ELK**
- Сервер, на котором настроен стек ELK (Elasticsearch, Logstash, Kibana) для анализа логов.

- **MySQL DB:** wordpress_db
- **Пользователь MySQL:** wordpress
- **Консоль администратора:** [http://10.0.0.11/wp-admin/](http://10.0.0.11/wp-admin/)
- **FrontEnd:** [http://10.0.0.10/](http://10.0.0.10/)
- **BackEnd 1:** [http://10.0.0.11/](http://10.0.0.11/)
- **BackEnd 2:** [http://10.0.0.12/](http://10.0.0.12/)
- **Grafana:** [http://10.0.0.13:3000/](http://10.0.0.13:3000/)
- **Kibana:** [http://10.0.0.14:5601/](http://10.0.0.14:5601/)

## Схема сети

![image](network.jpg)



восстановить Srv2:
копируется wordpress
восстанаваливается mysql

восстановить srv3:
восстанваливается mysql
настраивается резервное копирование mysql

настраивается unison на srv2 и репликация 2 и 3
