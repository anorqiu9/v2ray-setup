#!/bin/bash

PORT=$1

firewall-cmd --zone=public --list-ports
firewall-cmd --zone=public --add-port=${PORT}/tcp --permanent && firewall-cmd --reload && firewall-cmd --list-ports

