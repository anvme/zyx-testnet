# zyx-testnet
ZYX Testnet installation script for Ubuntu

## Installation in 1 simple step (1 minute, and your ZYX Test node is ready)

 1. Run the command below. Paste it into the terminal window on your server
```sh
wget -O - https://raw.githubusercontent.com/anvme/zyx-testnet/main/zyx-test-install.sh | bash
```
 
Our node is ready




## Helpfull commands
To check the logs, run command below (Ubuntu 20)
```sh
less $HOME/zyx-test.log
```
Ubuntu 18
```sh
# Logs from the start
journalctl -u zyx-test
# Latest logs
journalctl -u zyx-test -e
```
To check the ZYX state
```sh
systemctl status zyx-test
```
