#!/bin/bash

INSTALL_DIR=${pwd}
V2RAY_INSTALL_PACK_URL='https://raw.githubusercontent.com/v2fly/fhs-install-v2ray/master/install-release.sh'

#install v2ray
bash <(curl -L ${V2RAY_INSTALL_PACK_URL})

#configure v2ray
PORT=XXXX
CLIENT_ID=$(cat /proc/sys/kernel/random/uuid)

echo "please set port as ${PORT}"
echo "please set client id as ${CLIENT_ID}"

CONFIG_FILE="${INSTALL_DIR}/config/config.json"
vim "${CONFIG_FILE}"

cp -f ${CONFIG_FILE} /usr/local/etc/v2ray/config.json 

#enable the tcp port for v2ray service
${INSTALL_DIR}/enable_tcp_port.sh $PORT

#start v2ray
systemctl enable v2ray
systemctl start v2ray
systemctl status v2ray&

