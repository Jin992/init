sudo cat /etc/passwd | awk -F : '{print $1"\t"$3"\t"$6}'
