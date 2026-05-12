#!/data/data/com.termux/files/usr/bin/bash

# Clear and show the logo
clear
echo -e "\e[1;34m####################################\e[0m"
echo -e "\e[1;34m#          Termux+ Plus            #\e[0m"
echo -e "\e[1;34m#      S6 Lite Recon Edition       #\e[0m"
echo -e "\e[1;34m####################################\e[0m"

# Update and Install Core Tools
echo "Updating packages..."
pkg update && pkg upgrade -y
pkg install golang git clang python curl -y

# Setup Flagship Feature: Subfinder
echo "Installing Subfinder..."
go install -v ://github.com
echo 'export PATH=$PATH:$HOME/go/bin' >> ~/.bashrc

# Apply your custom settings logic
mkdir -p ~/.termux
echo "allow-external-apps=true" >> ~/.termux/termux.properties

echo -e "\e[1;32m[+] Installation Complete!\e[0m"
echo -e "\e[1;32m[+] Type 'source ~/.bashrc' then 'subfinder' to start.\e[0m"
