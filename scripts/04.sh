crontab -l > cron_backup
echo "0 0 * * *\
	MD_1 = \"\$(md5sum /etc/crontab | awk {\print \$1'}\" && \
	MD_2 = \"\$(cat /etc/crontab.log 2>/dev/null)\" && \
	if [ '\$MD_1' != '\$MD_2' ] ; then \
		md5sum /etc/crontab | awk '{ print \$1 }' > /etc/crontab.log && \
		echo \"/etc/crontab was changed on  \$(date)\" | mail -s \"/etc/crontab changed \" root ; fi" >> cron_backup
crontab cron_backup
rm cron_backup
