#!/usr/bin/env bash
set -euo pipefail

########################################
# CONFIG
########################################

# Name of the MySQL database you want to back up
DB_NAME="dyb_fishing"   # <-- change this

# Name of your MySQL container (service/container_name from docker-compose)
MYSQL_CONTAINER="docker-database-1"        # <-- change this if needed

# Path to the git repository on the server
GIT_REPO_DIR="/home/jbernard/backup-mysql-voyager"   # <-- change to your repo path

# Directory inside the repo where .sql files will be stored
BACKUP_SUBDIR="backups"              # e.g. "backups" or "."

########################################
# PREP
########################################

TIMESTAMP="$(date +"%Y-%m-%d_%H-%M-%S")"
BACKUP_DIR="${GIT_REPO_DIR}/${BACKUP_SUBDIR}"
BACKUP_FILE="${BACKUP_DIR}/backup_${DB_NAME}.sql"

echo "[$(date)] Starting backup of database '$DB_NAME' from container '$MYSQL_CONTAINER'..."

mkdir -p "$BACKUP_DIR"

########################################
# DUMP DATABASE FROM CONTAINER
########################################
# Assumes MYSQL_ROOT_PASSWORD is set in the container env
# If you use a different user, adjust -uroot / MYSQL_ROOT_PASSWORD.

docker exec "$MYSQL_CONTAINER" sh -c \
  'exec mysqldump -uroot -p"$MYSQL_ROOT_PASSWORD" "'"$DB_NAME"'"' > "$BACKUP_FILE"

# Basic sanity check
if [ ! -s "$BACKUP_FILE" ]; then
  echo "[$(date)] ERROR: Backup file '$BACKUP_FILE' is empty or missing."
  exit 1
fi

echo "[$(date)] Backup file created: $BACKUP_FILE"

########################################
# GIT COMMIT & PUSH
########################################

cd "$GIT_REPO_DIR"

# Stage the new backup file
git add "$BACKUP_FILE"

# Only commit if there is something new to commit
if git diff --cached --quiet; then
  echo "[$(date)] No changes to commit."
  exit 0
fi

COMMIT_MSG="Backup ${DB_NAME} ${TIMESTAMP}"
echo "[$(date)] Committing with message: '$COMMIT_MSG'"

git commit -m "$COMMIT_MSG"

echo "[$(date)] Pushing to remote..."
git push

echo "[$(date)] Backup, commit, and push completed successfully."
