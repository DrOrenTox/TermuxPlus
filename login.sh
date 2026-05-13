#!/data/data/com.termux/files/usr/bin/bash
clear
echo "========================================="
echo "         Welcome to termuxPLUS           "
echo "========================================="
echo ""
CURRENT_TIME=$(date +"%H:%M")
echo "Security Check: Verify your system time."
echo "What time is it? (Use HH:MM format, current system says: $CURRENT_TIME)"
echo "-----------------------------------------"
read -p "Enter time: " USER_INPUT

if [ "$USER_INPUT" = "$CURRENT_TIME" ]; then
    echo ""
    echo -e "\e[32mLogin Successful! Happy Touching :]\e[0m"
    echo ""
else
    echo ""
    echo -e "\e[31m[!] Login Failed. Closing session...\e[0m"
    sleep 2
    kill -9 $PPID
fi
