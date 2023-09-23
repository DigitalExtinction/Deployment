#!/usr/bin/env bash

set -e

echo "Going to (re)install system.d units..."

USERNAME="de-lobby"
UNIT_PATH="/etc/systemd/system/de-lobby.service"

# Check if the user already exists
if id "${USERNAME}" &>/dev/null; then
    echo "User ${USERNAME} already exists. Skipping user creation."
else
    sudo useradd -r -s /usr/sbin/nologin -M "${USERNAME}"
    echo "User ${USERNAME} created."
fi

sudo cp de-lobby.service "${UNIT_PATH}"
sudo chown root:root "${UNIT_PATH}"
sudo chmod 644 "${UNIT_PATH}"
sudo systemctl daemon-reload

echo "System.d units (re)installed."
