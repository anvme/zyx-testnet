# zyx-testnet
ZYX Testnet installation script for Ubuntu

## Installation in 2 simple steps (1 minute, and your ZYX Test node is ready)

 1. Run command below
```sh
cd $HOME && wget https://raw.githubusercontent.com/anvme/zyx-testnet/main/zyx-test-install.sh && chmod +x ./zyx-test-install.sh
```
 2. Run 
 ```sh
/bin/bash ./zyx-test-install.sh
```
Our node is ready




## Helpfull commands
To check the logs, run command below (Ubuntu 20)
```sh
less $HOME/zyx-test.log
```
Ubuntu 18
```sh
# Logs froom the start
journalctl -u zyx-test
# Latest logs
journalctl -u zyx-test -e
```
To check the ZYX state
```sh
systemctl status zyx-test
```
