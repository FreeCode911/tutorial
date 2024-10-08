#!/bin/bash
clear
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
echo "
#######################################################################################
#
#                                     LykCloud
#
#                           Copyright (C) 2024 LykCloud
#
#
#######################################################################################"
echo "Select an option:"
echo "1) PufferPanel"
read option

if [ $option -eq 1 ]; then
    clear
    echo -e "${RED}Downloading... Please Wait"
    apt update && apt upgrade -y
    export SUDO_FORCE_REMOVE=yes
    apt remove sudo -y
    apt install curl wget git python3 -y
    curl -s https://packagecloud.io/install/repositories/pufferpanel/pufferpanel/script.deb.sh | bash
    apt update && apt upgrade -y
    curl -o /bin/systemctl https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl3.py
    chmod -R 777 /bin/systemctl
    apt install pufferpanel
    clear
    echo -e "${GREEN}PufferPanel installation completed!"
    echo -e "${YELLOW}Enter PufferPanel Port"
    read pufferPanelPort

    sed -i "s/\"host\": \"0.0.0.0:8080\"/\"host\": \"0.0.0.0:$pufferPanelPort\"/g" /etc/pufferpanel/config.json
    echo -e "${YELLOW}Enter the username for the admin user:"
    read adminUsername
    echo -e "${YELLOW}Enter the password for the admin user:"
    read adminPassword
    echo -e "${YELLOW}Enter the email for the admin user:"
    read adminEmail

    pufferpanel user add --name "$adminUsername" --password "$adminPassword" --email "$adminEmail" --admin
    clear
    echo -e "${GREEN}Admin user $adminUsername added successfully!${NC}"
    systemctl restart pufferpanel
    clear
    echo -e "${GREEN}PufferPanel Created & Started - PORT: ${NC}$pufferPanelPort${GREEN}"
    
else
    echo -e "${RED}Invalid option selected.${NC}"
fi
