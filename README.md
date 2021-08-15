# zyx-testnet
ZYX Testnet installation script for Ubuntu

## Installation in 1 simple step (1 minute, and your ZYX Test node is ready)

 1. Run the command below. Paste it into the terminal window on your server
```sh
wget -O - https://raw.githubusercontent.com/anvme/zyx-testnet/main/zyx-test-install.sh | bash
```
 
Our node is ready
## Video for fun (Click on the gif)
[![Vimeo | ZYX Testnet Minerva Installation](https://videoapi-muybridge.vimeocdn.com/animated-thumbnails/image/5833dc4f-8ade-4d0e-8224-8015df4fca09.gif?ClientID=vimeo-core-prod&Date=1628987308&Signature=cbf1699a3581ea10a71d8c2002bc6b682d05ff44)](https://vimeo.com/587303965)




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
