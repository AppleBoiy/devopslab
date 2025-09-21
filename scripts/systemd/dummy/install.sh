#!/bin/bash

sudo cp dummy.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable dummy
sudo systemctl start dummy

echo "Dummy service installed and started successfully."