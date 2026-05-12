#!/data/data/com.termux/files/usr/bin/bash

# --- Termux+ 1.0.0 Release ---
clear
echo -e "\e[1;34m####################################"
echo -e "#          Termux+ Plus            #"
echo -e "#      v1.0.0 - S6 Lite Edition    #"
echo -e "####################################\e[0m"

echo "Updating packages..."
pkg update && pkg upgrade -y
pkg install golang git clang python curl nano -y

echo "Installing Flagship: Subfinder..."
go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

# Add commands to bashrc
cat << 'INNER_EOF' >> ~/.bashrc

# --- Termux+ 1.0.0 Toolset ---
export PATH=$PATH:$HOME/go/bin

# 1. SubFinder
alias subfind='subfinder -d'

# 2. Edit Files
alias editf='nano'

# 3. Ls All
alias lsa='ls -la'

# 4. Nano Save/Load (Helper)
alias nload='nano'

# 5. Co Pkg Install (With Size Display)
copkg() {
    echo -e "\e[1;33mChecking package size...\e[0m"
    apt show "$1" 2>/dev/null | grep -E "Size|Description"
    read -p "Install $1? (y/n): " ch
    if [ "$ch" == "y" ]; then pkg install "$1" -y; fi
}

# 6. Scan Storage
alias scan-storage='du -sh /sdcard/* 2>/dev/null | sort -h'

# 7. Search Bar
alias search='history | grep'

# 8. On/Off Toggle
plus-toggle() {
    read -p "Termux+ Features (on/off): " t
    if [ "$t" == "on" ]; then echo "Enabled."; else echo "Disabled."; fi
}

# 9. Disable Tool (Red/Cyan Warning)
tp-disable() {
    echo -e "\e[1;31mDISABLE TOOL\e[0m"
    echo -e "\e[0;31mDELETE TOOL\e[0m"
    echo -ne "\e[1;31mAre you sure? (y/n): \e[0m"
    read confirm
    if [ "$confirm" == "y" ]; then
        echo -e "\e[1;36mgo back to GitHub & get the command to use it again!\e[0m"
    else
        echo "Action cancelled."
    fi
}
INNER_EOF

source ~/.bashrc
echo -e "\e[1;32m[+] Termux+ 1.0.0 Installed Successfully!\e[0m"
