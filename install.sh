#!/usr/bin/env bash

set -e

echo "Going to (re)install DE Lobby and DE Connector..."

DOWNLOAD_URL="https://download.de-game.org/x86_64-unknown-linux-gnu/nightly.zip"
TARGET_DIR="/usr/local/bin/"
TMP_DIR=$(mktemp -d /tmp/de.XXXXXX)
ZIP_FILE="${TMP_DIR}/package.zip"

LOBBY_FILE_REL="DigitalExtinction/de-lobby"
CONNECTOR_FILE_REL="DigitalExtinction/de-connector"
LOBBY_FILE="${TMP_DIR}/${LOBBY_FILE_REL}"
CONNECTOR_FILE="${TMP_DIR}/${CONNECTOR_FILE_REL}"

echo "Going to download ${DOWNLOAD_URL} to ${TMP_DIR}"
if ! curl -o "${ZIP_FILE}" "${DOWNLOAD_URL}"; then
    echo "Failed to download ZIP from $URL"
    exit 1
fi

unzip "${ZIP_FILE}" -d "${TMP_DIR}" "${LOBBY_FILE_REL}" "${CONNECTOR_FILE_REL}"

if [[ ! -f "${LOBBY_FILE}" || ! -f "${CONNECTOR_FILE}" ]]; then
    echo "Failed to extract the required files."
    exit 1
fi

chmod 555 "${LOBBY_FILE}" "${CONNECTOR_FILE}"
sudo chown root:root "${LOBBY_FILE}" "${CONNECTOR_FILE}"
sudo mv "${LOBBY_FILE}" "${CONNECTOR_FILE}" "${TARGET_DIR}"
rm -rf "${TMP_DIR}"

echo "Successfully (re)installed DE Lobby and DE Connector into ${TARGET_DIR}"
