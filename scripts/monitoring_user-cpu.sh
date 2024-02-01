# /etc/zabbix/scripts/monitoring_user-cpu.sh
cpu=$(top -b -n 1 -u $1 | awk 'NR>7 {sum += $9;} END {print sum}')
if [ -z ${cpu} ]; then
    cpu=0
fi
echo "${cpu}"

