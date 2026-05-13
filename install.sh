#!/data/data/com.termux/files/usr/bin/bash
BIN_PATH="/data/data/com.termux/files/usr/bin"
BASHRC_FILE="$HOME/.bashrc"

echo "[*] Installing termuxPLUS tools..."
cp csds.sh "$BIN_PATH/csds"
cp settings.sh "$BIN_PATH/settings"
cp login.sh "$BIN_PATH/login"

chmod +x "$BIN_PATH/csds"
chmod +x "$BIN_PATH/settings"
chmod +x "$BIN_PATH/login"

if ! grep -q "login" "$BASHRC_FILE" 2>/dev/null; then
    echo "" >> "$BASHRC_FILE"
    echo "# Automatically launch termuxPLUS login on app startup" >> "$BASHRC_FILE"
    echo "login" >> "$BASHRC_FILE"
fi
echo "[+] Installation complete!"
