#!/bin/bash
set -e

BACKUP_DIR="/var/backups/postgres"
DATE=$(date +%F_%H-%M)

mkdir -p "$BACKUP_DIR"
pg_dumpall -U {{ pg_user }} | gzip > "$BACKUP_DIR/postgres_backup_$DATE.sql.gz"

#TODO: Add something that rsync's this to a remote server

# Also add something that deletes backups more than a few days old