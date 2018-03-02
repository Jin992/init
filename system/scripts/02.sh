echo "0 4 * * 6 apt-get -y update && apt-get -y upgrade > sudo /var/log/update_script.log" > ./cron_log
crontab ./cron_log
rm ./cron_log
