#!/bin/bash

set -e

REPO_URL="https://github.com/baksanovev/shvirtd-example-python.git"
APP_DIR="/opt/shvirtd-example-python"

echo "=== Deploy shvirtd project ==="

if [ -d "$APP_DIR/.git" ]; then
    echo "Repository already exists. Updating..."
    git -C "$APP_DIR" pull --ff-only
else
    echo "Cloning repository..."
    git clone "$REPO_URL" "$APP_DIR"
fi

cd "$APP_DIR"

echo "Starting containers..."

docker compose up -d --build

echo "Containers:"
docker compose ps
