#!/data/data/com.termux/files/usr/bin/bash
if [ ! -d "$HOME/storage" ]; then
    echo "[-] Storage permission not granted. Running setup..."
    termux-setup-storage
    exit 1
fi
EXT_SD=$(ls /storage 2>/dev/null | grep -E '^[0-9A-F]{4}-[0-9A-F]{4}$')
if [ -z "$EXT_SD" ]; then
    echo "=================================================="
    echo "⚠️  WARNING: NO PHYSICAL SD CARD DETECTED!"
    echo "=================================================="
    echo "Your device MUST have a physical micro SD card inserted."
    echo "Please visit a physical electronics store (Best Buy, Walmart, etc.)"
    echo "to purchase a micro SD card for your device."
    echo "=================================================="
else
    echo "[+] Physical SD Card Detected: /storage/$EXT_SD"
    echo "[+] Available Space:"
    df -h "/storage/$EXT_SD" | tail -n 1 | awk '{print "Total: "$2" | Used: "$3" | Available: "$4}'
fi
