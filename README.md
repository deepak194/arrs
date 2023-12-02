# Quick and Easy all the Arrs setup - bazarr homarr lidarr prowlarr qbittorrent radarr readarr sabnzbd sonarr

This repo is for quick and easy installation of all the arr's for everyone on ubuntu server.

Wrote this basic bash script to install all of these for a friend to replicate my exact setup.

This is based on multiple sources - Credits to Trashguides, wiki.Servarr, awesomeopensource and ibracorp yt channels.

## Requirements and assumptions

### Requirements:

1. Server/Old PC with storage and Ubuntu installed on it.
2. Usenet Indexer + News provider (optional and can be replaced with torrents)

Assuming you have ubuntu server installed and your home directory is called mediaadmin(username) and your pwd looks like
/home/mediaadmin/ 

## Installation

This script does multiple things

1. Creates folders for docker containers " /home/mediaadmin/dockerdata/ "

2. Creates folders for storing media " /home/mediaadmin/arrmedia/ "

3. Updates and Upgrades Ubuntu Server to latest

4. Installs Docker, Docker Compose and Tree (to check the folder structure)

5. Installs Portainer + all the Arrs - bazarr homarr lidarr prowlarr qbittorrent radarr readarr sabnzbd sonarr

Download install.sh and docker-compose.yml files to /home/mediaadmin/

```bash
#Changes permissions on file to be executable
chmod +x install.sh
# Starts installing
sudo ./install.sh
```

## Usage

```bash

```

## Contributing

Pull requests are welcome. For major changes, please open an issue first
to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
