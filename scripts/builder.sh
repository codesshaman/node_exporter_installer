#!/bin/bash

set -Eeuo pipefail

# ============================================================
# Скачивание
# ============================================================
echo 
echo "============================================================" 
echo "Download node exporter" 
echo "============================================================"

VERSION=$(curl -s https://api.github.com/repos/prometheus/node_exporter/releases/latest \
    | grep '"tag_name":' \
    | cut -d'"' -f4)

wget "https://github.com/prometheus/node_exporter/releases/download/${VERSION}/node_exporter-${VERSION#v}.linux-amd64.tar.gz"

tar xvfz node_exporter-*.linux-amd64.tar.gz

cd node_exporter-*.*-amd64

cp node_exporter ..

cd ..

rm node_exporter-*.linux-amd64.tar.gz

rm -rf node_exporter-*

# ============================================================
# Добавление пользователя
# ============================================================
echo 
echo "============================================================" 
echo "Add user node_exporter" 
echo "============================================================"

sudo cp node_exporter /usr/bin

node_exporter --version

sudo useradd -r -M -s /bin/false node_exporter

sudo chown node_exporter:node_exporter /usr/bin/node_exporter

rm node_exporter
