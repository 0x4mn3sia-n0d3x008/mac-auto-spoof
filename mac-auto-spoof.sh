#!/bin/bash
# mac-auto-spoof.sh
# Automatically spoof MAC address for active interfaces (wlan0 or eth0) on boot
# Made by Brabim 😎

# Interfaces to spoof
INTERFACES=("wlan0" "eth0")

echo "[*] Starting MAC spoofing script..."

for IFACE in "${INTERFACES[@]}"; do
    # Check if interface exists and is up
    if ip link show "$IFACE" | grep -q "state UP"; then
        echo "[*] Interface $IFACE is up. Spoofing MAC..."

        # Bring interface down
        ip link set "$IFACE" down

        # Spoof MAC address
        macchanger -r "$IFACE"

        # Bring interface back up
        ip link set "$IFACE" up

        echo "[+] Spoofed MAC for $IFACE successfully!"
    else
        echo "[!] Interface $IFACE is down or not found. Skipping..."
    fi
done

echo "[✔] MAC spoofing completed."
