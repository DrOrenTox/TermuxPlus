#!/data/data/com.termux/files/usr/bin/bash
REPO_URL="https://github.com"
show_menu() {
    clear
    echo "========================================="
    echo "          TermuxPlus Settings            "
    echo "========================================="
    echo "1) Find latest Version of this Update"
    echo "2) Go to Latest version (Force Update Now)"
    echo "3) Exit Settings"
    echo "========================================="
    read -p "Select an option [1-3]: " choice
    case $choice in
        1)
            echo "[+] Current local version is: v1.0.2"
            read -p "Press enter to return to menu..." -r
            show_menu ;;
        2)
            echo "[*] Re-downloading from repository..."
            cd "$HOME" && rm -rf TermuxPlus
            git clone "$REPO_URL.git"
            cd TermuxPlus && chmod +x install.sh && ./install.sh
            exit 0 ;;
        3) exit 0 ;;
        *) show_menu ;;
    esac
}
show_menu
