#!/bin/bash


sudo systemctl stop dummy
sudo systemctl disable dummy
sudo rm /etc/systemd/system/dummy.service
sudo systemctl daemon-reload

echo "Dummy service uninstalled successfully."