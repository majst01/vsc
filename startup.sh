#!/bin/bash

locale-gen $LANG

groupadd -g $HOSTGROUPID $HOSTGROUP
useradd $HOSTUSER -u $HOSTUSERID -g $HOSTGROUP -G video -M -d /devhome
chown -R $HOSTUSER:$HOSTGROUP /devhome

if [ ! -d "/config/vscode" ]; then
  gosu $HOSTUSER bash -c "mkdir -p /config/vscode/.config/Code/User /config/vscode/.vscode/extensions"
fi

ln -s /config/vscode/.config /devhome/.config
ln -s /config/vscode/.vscode /devhome/.vscode

gosu $HOSTUSER /usr/local/bin/code.sh "$@"
