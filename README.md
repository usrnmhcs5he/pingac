# Bash LAN IP Scanner

A fast, lightweight Bash script to scan a range of IP addresses on a local network and identify active hosts using ICMP ping.

Version 11

---

Features
- Interactive prompts with sensible defaults
- Real-time visual progress bar with percentage
- Scans any custom IP range (e.g. 192.168.1.1 – 192.168.1.254)
- Saves all active IPs to active_ips.txt
- Clean final summary with list of responding devices
- No external dependencies

---

Requirements
- Linux or macOS with Bash
- ping command (standard on most systems)

⚠️ Legal Notice: Unauthorized network scanning may be illegal. Use this tool responsibly and only on networks you own or have explicit permission to scan.

---

Installation

1. Clone the repository:
   git clone https://github.com/yourusername/bash-ip-scanner.git
   cd bash-ip-scanner

2. Make the script executable:
   chmod +x ip_scanner.sh

3. Run the script:
   ./ip_scanner.sh

---

Usage

Simply execute the script and answer the three prompts:

   ./ip_scanner.sh

Example input:
- Base IP prefix (e.g., 192.168.0.): 192.168.1.
- Start range (e.g., 2): 1
- End range (e.g., 254): 100

The script will display a live progress bar while scanning.

---

Output

- Active IPs are saved to active_ips.txt (file is overwritten on each run)
- Terminal shows a progress bar, scan completion message, and final list of responding IPs

---

How It Works

The script prompts for a base IP prefix and numeric range, then pings each address once with a 1-second timeout. It displays a real-time ASCII progress bar and collects all hosts that respond.

---

Version

Version 11 – Improved progress bar, better input validation, cleaner output, and more user-friendly defaults.

---

License

MIT License

---

Disclaimer

This tool is provided for educational and legitimate network troubleshooting purposes only. The author is not responsible for any misuse or damage caused by this script.

---
