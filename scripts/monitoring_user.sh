# /etc/zabbix/scripts/monitoring_user.sh
json="["
for user in $(perl -n -e '@user = split /:/ ; print "@user[0]\n" if @user[2] > "1000" and @user[2] < "65000";' < /etc/passwd); do
    json="${json}{\"User\": \"$user\"},"
done
json=${json::-1}
json="${json}]"
echo $json

