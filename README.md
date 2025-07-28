
# 🔐 mac-auto-spoof.sh

This script automatically spoofs the MAC address of active network interfaces (`wlan0` or `eth0`) on system boot. Ideal for anonymity, privacy, and evading tracking.

> ⚠️ Made for ethical use. Do not use for malicious purposes.

---

## 📦 Requirements

Make sure `macchanger` is installed:

```bash
sudo apt update
sudo apt install macchanger
```

---

## 🛠️ Setup Instructions

### 1. Clone this repo

```bash
git clone https://github.com/0x4mn3sia-n0d3x008/mac-auto-spoof.git
cd mac-auto-spoof
```

### 2. Make the script executable

```bash
chmod +x mac-auto-spoof.sh
```

### 3. Move it to a system path (optional)

```bash
sudo mv mac-auto-spoof.sh /usr/local/bin/mac-auto-spoof.sh
```

---

## 🚀 Auto Run on Boot (via `cron`)

### 1. Open root crontab

```bash
sudo crontab -e
```

### 2. Add the following line at the end:

```cron
@reboot /usr/local/bin/mac-auto-spoof.sh
```

> This ensures the script runs automatically on every boot.

---

## 🔁 What This Script Does

- Checks if `wlan0` or `eth0` is active (UP)
- If active:
  - Disables the interface
  - Spoofs the MAC address using `macchanger`
  - Re-enables the interface
- Skips any interface that is not active

---

## 🧠 Notes

- Use `ip a` to check your active network interface names
- You can modify the interface list inside the script:
  ```bash
  INTERFACES=("wlan0" "eth0")
  ```
- To spoof with a specific vendor prefix, check `macchanger` docs:
  ```bash
  macchanger --help
  ```

---

## ⚠️ Disclaimer

This script is intended for educational and privacy-enhancing purposes only. Use responsibly.
