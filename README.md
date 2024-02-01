# Monitoring User

- Author : Florian DJERBI
- Object : Monitoring user in server (cpu & ram)
- Creation Date : 19/04/2023
- Modification Date : 02/01/2024


## Informations
Importer le template **vhost_ram-cpu_template.xml** sur votre Zabbix.

Le template à 2 valeurs macro pour la consommation CPU:
- {$CPU.AVERAGE} = 2
- {$CPU.HIGH} = 5

Je conseille de mettre des alertes lié aux valeurs

*PS: il est possible de faire de même avec la consommation de la ram*

## Scripts
Importer sur le serveur en question les différents scripts:
``` bash
cp -p scripts/* /etc/zabbix/scripts/
```

``` conf
# /etc/zabbix/zabbix_agentd.d/vhost_monitoring.conf
UserParameter=Vhost.users,/bin/bash /etc/zabbix/scripts/monitoring_user.sh
UserParameter=Vhost.users.cpu[*],/bin/bash /etc/zabbix/scripts/monitoring_user-cpu.sh $1
UserParameter=Vhost.users.ram[*],/bin/bash /etc/zabbix/scripts/monitoring_user-ram.sh $1
```
