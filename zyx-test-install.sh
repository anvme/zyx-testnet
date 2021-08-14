#!/bin/bash
clear >$(tty)
iUser="$(whoami)"
iGroup="$(id -gn)"
iHome="$HOME"
# Install 
sudo apt update
sudo apt-get install git build-essential -y
# Install latest Go version
sudo rm -rf /usr/local/go
GOLatestVer="https://golang.org/dl/$(curl -s https://golang.org/VERSION?m=text).linux-amd64.tar.gz" #go1.16.7
wget $GOLatestVer -O - | sudo tar -C /usr/local -xz
bash -c 'cat >> /$HOME/.profile' << EOF
# set PATH for Go
export PATH=\$PATH:/usr/local/go/bin
EOF
source /$HOME/.profile
# Install ZYX
cd $HOME && git clone -v https://github.com/ZYXnetwork/ZYX-20.git zyx && cd ./zyx
clear >$(tty)
echo -e '================================================\nStarting build. Wait 5-15 min\n================================================' && sleep 5
make
# /etc/systemd/system/zyx.service
sudo bash -c 'cat > /etc/systemd/system/zyx-test.service' << EOF
[Unit]
Description=ZYX Minerva Testnet
After=network.target syslog.target
StartLimitIntervalSec=0
[Service]
Type=simple
Restart=always
RestartSec=1
User=$iUser
Group=$iGroup
ExecStart=$iHome/zyx/build/bin/geth --minerva
ExecStop=/bin/kill -s QUIT $MAINPID
StandardOutput=file:$iHome/zyx-test.log
[Install]
WantedBy=multi-user.target
EOF
# /etc/systemd/system/zyx.service
sudo systemctl daemon-reload
sudo systemctl enable zyx-test
sudo systemctl start zyx-test
echo -e '================================================\n ZYX Test Installed \n================================================' && sleep 1
echo -e 'Enter command below, to check the status:\nsystemctl status zyx-test\nTo run the go, just type export PATH=$PATH:/usr/local/go/bin or restart the terminal'
