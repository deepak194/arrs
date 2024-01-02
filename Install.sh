#!/bin/bash

echo "This script does multiple things"
echo "1. Creates folders for docker containers"
echo "2. Creates folders for storing media"
echo "3. Updates and Upgrades Ubuntu Server to latest"
echo "4. Installs Docker, Docker Compose and Tree"
echo "5. Installs Portainer + all the Arrs - bazarr homarr lidarr prowlarr qbittorrent radarr readarr sabnzbd sonarr"

sleep 2


echo "1. Creating folders for docker containers"

main_folder="dockerdata"
arrs_folder="arrs"
data_folder="data"
subfolders=("bazarr" "deemix" "homarr" "lidarr" "prowlarr" "qbittorrent" "radarr" "readarr" "sabnzbd" "sonarr")

# Create main folder
mkdir -p "$main_folder"

# Create arrs folder
mkdir -p "$main_folder/$arrs_folder"

# Create data folder
mkdir -p "$main_folder/$arrs_folder/$data_folder"

# Create subfolders inside data folder
for subfolder in "${subfolders[@]}"; do
    mkdir -p "$main_folder/$arrs_folder/$data_folder/$subfolder"
done

echo "Folder structure created successfully!"

sleep 2

echo "2. Creating folders for storing media"

main_folder="arrmedia"
data_folder="data"
media_folder="media"
torrents_folder="torrents"
usenet_folder="usenet"
complete_folder="complete"
incomplete_folder="incomplete"
categories=("books" "movies" "music" "tv")

# Create main folder
mkdir -p "$main_folder"

# Create data folder
mkdir -p "$main_folder/$data_folder"

# Create media, torrents, and usenet folders inside data folder
for folder in "$media_folder" "$torrents_folder" "$usenet_folder"; do
    mkdir -p "$main_folder/$data_folder/$folder"
done

# Create category folders inside media and torrents folders
for folder in "$media_folder" "$torrents_folder"; do
    for category in "${categories[@]}"; do
        mkdir -p "$main_folder/$data_folder/$folder/$category"
    done
done

# Create Complete and incomplete folders inside usenet folder
mkdir -p "$main_folder/$data_folder/$usenet_folder/$complete_folder"
mkdir -p "$main_folder/$data_folder/$usenet_folder/$incomplete_folder"

# Create category folders inside the Complete folder
for category in "${categories[@]}"; do
    mkdir -p "$main_folder/$data_folder/$usenet_folder/$complete_folder/$category"
done

# Chmod all folders to be wrx by all users
chmod -R a+rwx "$main_folder"

echo "Folder structure created successfully!"
echo "Permissions set successfully!"

sleep 2

echo "3. Updating and Upgrading Ubuntu Server to latest"
echo "and"
echo "4. Installing Docker, Docker Compose and Tree"

# Check if the script is being run as root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root or with sudo."
    exit 1
fi

# Install Docker
echo "Installing Docker..."

# Update package index
sudo apt update && sudo apt upgrade -y

# Install prerequisites
sudo apt install apt-transport-https ca-certificates curl software-properties-common

# Add Docker GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Set up the stable Docker repository for Ubuntu 22.04
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
sudo apt update -y
sudo apt install docker-ce
sudo systemctl restart docker

echo "adding current user to docker group"
sleep 1

# Add the current user to the docker group to run Docker without sudo
sudo usermod -aG docker ${USER}

echo "Docker installed successfully."

# Install Docker Compose
echo "Installing Docker Compose..."

# Download Docker Compose binary
mkdir -p ~/.docker/cli-plugins/
curl -SL https://github.com/docker/compose/releases/download/v2.3.3/docker-compose-linux-x86_64 -o ~/.docker/cli-plugins/docker-compose

# Apply executable permissions
chmod +x ~/.docker/cli-plugins/docker-compose

echo "Docker Compose installed successfully."

# Display Docker and Docker Compose versions
#echo "Docker version:"
#docker --version
#echo "Docker Compose version:"
#docker-compose --version

echo "One last thing... Installing Portainer + Tree.."

#docker portainer install
docker pull portainer/portainer-ce:latest
docker run -d -p 9000:9000 --restart always -v /var/run/docker.sock:/var/run/docker.sock portainer/portainer-ce:latest

#Tree install
sudo apt install tree

# Prompt the user to log out and log back in to apply group changes
echo "Please log out and log back in to apply changes to user group memberships."

sleep 1


#pull and install all the arr's needs to have docker-compose.yml file in the same directory.
docker compose up -d
