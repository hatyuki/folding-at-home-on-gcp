#!/bin/bash -eu
set -eux

apt update
apt upgrade -y
install -m 0700 -o root -g root -d /etc/fahclient

cat << CONFIG > /etc/fahclient/config.xml
<config>
  <user value='${username}'/>
  <team value='${team}'/>
  <passkey value='${passkey}' />
  <power value='${power}'/>
  <gpu value='false'/>
  <smp value='true'/>
</config>
CONFIG

wget -q -O fahclient_amd64.deb \
  https://download.foldingathome.org/releases/public/release/fahclient/debian-stable-64bit/v7.5/fahclient_7.5.1_amd64.deb

DEBIAN_FRONTEND=noninteractive dpkg -i fahclient_amd64.deb
