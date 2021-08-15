#!/bin/bash
iUser="$(whoami)"
iGroup="$(id -gn)"
iHome="$HOME"
curl https://raw.githubusercontent.com/anvme/zyx-testnet/main/zyx-test.service -o zyx-test.service -s
eval "cat <<EOF
$(<zyx-test.service)
EOF
" > zyx-test.service
sed -i 's/QUIT/QUIT $MAINPID/g' zyx-test.service
sudo mv -f zyx-test.service /etc/systemd/system/zyx-test.service
sudo systemctl daemon-reload
sudo systemctl stop zyx-test
sudo systemctl start zyx-test
