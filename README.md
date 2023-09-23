# DE Deployment

This repository contains configuration and various ops tools for the main
deployment of DE Lobby and DE Connector.

## Setup

The following installation steps work on most Linux distributions.

1. Clone this repository: `git clone https://github.com/DigitalExtinction/Deployment.git de-deployment`
1. `cd de-deployment`
1. Install DE Lobby and DE Connector: `./install.sh`
1. Setup Systemd: `./setup-systemd.sh`
1. Start enable the Systemd service: `systemctl enable --now de-lobby`
