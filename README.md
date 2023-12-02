# Install and setup directories for all the Arr's
setup all arr's from one single script, this is a basic script that does the following and created by my limited knowledge of bash scripting.

This script does multiple things

"1. Creates folders for docker containers" 

"2. Creates folders for storing media" 

"3. Updates and Upgrades Ubuntu Server to latest" 

"4. Installs Docker, Docker Compose and Tree" 

"5. Installs Portainer + all the Arrs - bazarr homarr lidarr prowlarr qbittorrent radarr readarr sabnzbd sonarr" 


Setup: 

Note: Change the user folder path name in docker-compose.yml file to your username home directory folder path

Ex: my user path is /home/mediaserver/ change it to /home/xxxx/ 

you can find that path by typing "pwd"


To use this, download install.sh and docker-compose.yml files and leave in home directory of your ubuntu install. 

example: /home/mediaserver/install.sh  /home/mediaserver/docker-compose.yml

run the following commands:

chmod +x install.sh

sudo ./install.sh
