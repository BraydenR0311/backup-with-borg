#!/usr/bin/env bash

set -e

sudo cp -v ./backup.sh $HOME/.local/bin/
sudo chmod u+x $HOME/.local/bin/backup.sh

sudo cp -v ./backup.service $HOME/.config/systemd/user/
sudo cp -v ./backup.timer $HOME/.config/systemd/user/

sudo systemctl daemon-reload
systemctl --user enable backup.timer
systemctl --user start backup.timer
