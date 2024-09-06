#!/bin/bash

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Display the LykCloud header
clear
echo "#######################################################################################"
echo "#                                                                                     #"
echo "#                                  LykCloud                                            #"
echo "#                                                                                     #"
echo "#                           Copyright (C) 2024 LykCloud                                #"
echo "#                                                                                     #"
echo "#######################################################################################"
echo

# Display the menu options
echo "Select an option:"
echo "1) Install PufferPanel"
echo "2) Exit"
read -p "Enter option: " option

# Debugging output
echo "You entered option: $option" >&2

# Check the user's input
if [ "$option" -eq 1 ]; then
    clear
    echo -e "${RED}Downloading... Please Wait" >&2
    apt update && apt upgrade -y

    export SUDO_FORCE_REMOVE=yes
    apt remove sudo -y
    apt install curl wget git python3 -y

    curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh | bash
    apt update && apt upgrade -y

    curl -o /bin/systemctl https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl3.py
    chmod -R 777 /bin/systemctl

    apt install pufferpanel -y
    clear

    echo -e "${GREEN}PufferPanel installation completed!" >&2
    echo -e "${YELLOW}Enter PufferPanel Port" >&2
    read pufferPanelPort

    sed -i "s/\"host\": \"0.0.0.0:8080\"/\"host\": \"0.0.0.0:$pufferPanelPort\"/g" /etc/pufferpanel/config.json
    echo -e "${YELLOW}Enter the username for the admin user:" >&2
    read adminUsername
    echo -e "${YELLOW}Enter the password for the admin user:" >&2
    read adminPassword
    echo -e "${YELLOW}Enter the email for the admin user:" >&2
    read adminEmail

    pufferpanel user add --name "$adminUsername" --password "$adminPassword" --email "$adminEmail" --admin
    clear

    echo -e "${GREEN}Admin user $adminUsername added successfully!${NC}" >&2
    systemctl restart pufferpanel
    clear
    echo -e "${GREEN}PufferPanel Created & Started - PORT: ${NC}$pufferPanelPort${GREEN}" >&2

elif [ "$option" -eq 2 ]; then
    echo "Exiting..."
    exit 0

else
    echo -e "${RED}Invalid option. Please try again.${NC}" >&2
    exit 1
fi
