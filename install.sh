#!/usr/bin/env bash

set -e

BACKUP_DIR=$HOME/.backups/

if [[ ! -d $BACKUP_DIR ]]; then
	mkdir $HOME/.backups
fi

sudo cp -v ./backup.sh $HOME/.local/bin/
sudo chmod u+x $HOME/.local/bin/backup.sh

sudo cp -v ./backup.service $HOME/.config/systemd/user/
sudo cp -v ./backup.timer $HOME/.config/systemd/user/

sudo systemctl daemon-reload
systemctl --user enable backup.timer
systemctl --user start backup.timer

borg init -e repokey $BACKUP_DIR
