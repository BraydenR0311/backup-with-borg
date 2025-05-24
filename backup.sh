#!/usr/bin/env bash

export BORG_PASSPHRASE="borger985"
ARCHIVE=$HOME/.backups
TO_BACKUP=($HOME/Documents $HOME/Projects $HOME/Pictures)

echo "Creating backups for ${TO_BACKUP[@]}"
borg create -v --stats  ${ARCHIVE}::$(date +%a) ${TO_BACKUP[@]}

echo "Pruning old backups..."
borg prune $ARCHIVE --keep-last=6 -v

echo "Compacting to free space after deleting old archives..."
borg compact $ARCHIVE
