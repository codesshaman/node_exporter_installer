#!/bin/bash


sudo systemctl stop node_exporter
sudo systemctl disable node_exporter
sudo rm /etc/systemd/system/node_exporter.service
sudo rm -rf /usr/local/lib/node_exporter
