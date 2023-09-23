#!/usr/bin/env bash

set -e

echo "Going to (re)install system.d units..."

LOBBY_USERNAME="de-lobby"
LOBBY_UNIT_PATH="/etc/systemd/system/de-lobby.service"

CONNECTOR_USERNAME="de-connector"
CONNECTOR_UNIT_PATH="/etc/systemd/system/de-connector.service"

# Check if the user already exists
if id "${LOBBY_USERNAME}" &>/dev/null; then
    echo "User ${LOBBY_USERNAME} already exists. Skipping user creation."
else
    sudo useradd -r -s /usr/sbin/nologin -M "${LOBBY_USERNAME}"
    echo "User ${LOBBY_USERNAME} created."
fi

sudo cp de-lobby.service "${LOBBY_UNIT_PATH}"
sudo chown root:root "${LOBBY_UNIT_PATH}"
sudo chmod 644 "${LOBBY_UNIT_PATH}"


if id "${CONNECTOR_USERNAME}" &>/dev/null; then
    echo "User ${CONNECTOR_USERNAME} already exists. Skipping user creation."
else
    sudo useradd -r -s /usr/sbin/nologin -M "${CONNECTOR_USERNAME}"
    echo "User ${CONNECTOR_USERNAME} created."
fi

sudo cp de-connector.service "${CONNECTOR_UNIT_PATH}"
sudo chown root:root "${CONNECTOR_UNIT_PATH}"
sudo chmod 644 "${CONNECTOR_UNIT_PATH}"

sudo systemctl daemon-reload

echo "System.d units (re)installed."
