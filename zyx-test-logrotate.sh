#!/bin/bash
iUser="$(whoami)"
iGroup="$(id -gn)"
iHome="$HOME"
mkdir "$iHome/zyx-logs"

# Daily logrotate time is $ grep daily /etc/crontab

printf "\n\nHow many logs you want to store? Daily logs. For example if you enter 30, you will have logs for last 30 days\n"
read -p 'Enter number: ' lrd
logrotatedays='^[0-9]{1}+$'
while [[ ! $lrd =~ $logrotatedays ]]
do
    printf "\nLog rotate supports only numbers.\n"
    read -p 'Enter number: ' lrd
done

sudo bash -c 'cat > /etc/logrotate.d/zyx-test' << EOF
$iHome/zyx-test.log {
    daily
    create 0644 $iUser $iGroup
    rotate $lrd
    missingok
    copytruncate
    compress
    delaycompress
    dateext
    dateformat .%Y-%m-%d
    notifempty
    postrotate
        mv $iHome/zyx-test.log.*.gz $iHome/zyx-logs/
    endscript
}
EOF
sudo systemctl restart logrotate
echo -e '\nLogrotate for ZYX installed'
