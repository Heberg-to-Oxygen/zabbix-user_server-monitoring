# /etc/zabbix/scripts/monitoring_user-ram.sh
ram=$(top -b -n 1 -u $1 | awk 'NR>7 {sum += $10;} END {print sum}')
if [ -z ${ram} ]; then
    ram=0
fi
echo "${ram}"

