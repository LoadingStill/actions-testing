name: WebGSM Docker Debian 11

on:
  push:
    branches:
      - main
  pull_request:
    branches:
      - main

jobs:
  Set_Up:
    runs-on: ubuntu-latest # Required by GitHub Actions, will use Debian container.

    container: # Use a Debian 11 container.
      image: debian:11

    steps:
      - name: Set up Debian 11 
        run: |
          apt-get update
          apt-get install -y wget zip unzip # wget used in WebGSM
          echo "Debian 11 setup complete."

      - name: Install WebGSM
        run: |
          wget -O WebGSM-Docker-Installer.sh https://raw.githubusercontent.com/LoadingStill/WebGSM/refs/heads/latest/WebGSM-Docker-Install.sh
          chmod +x WebGSM-Docker-Installer.sh

      - name: Run WebGSM
        run: |
          ./WebGSM-Docker-Installer.sh
