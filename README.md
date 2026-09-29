## 📡 pingac

**A tiny interactive Bash script that ping-sweeps a range of IP addresses on your LAN and lists the hosts that respond.**

[![Bash](https://img.shields.io/badge/bash-3.2%2B-4EAA25?logo=gnubash&logoColor=white)](ping.sh)
[![ICMP](https://img.shields.io/badge/ping-ICMP-blue)](ping.sh)
[![Version](https://img.shields.io/badge/version-11-blue)](ping.sh)

One script, no dependencies, no config files.

## ✨ Features

- **Interactive prompts** with sensible defaults (`192.168.0.` / `2` / `254`).
- **Live progress bar** with the current address and a percentage.
- **Custom ranges**: sweep any `/24`-style span, e.g. `192.168.1.1` to `192.168.1.254`.
- **Input validation**: start and end must be numbers and start must not exceed end.
- **Saved results**: active hosts are written to `active_ips.txt`.
- **Clear summary**: responding IPs are listed once the scan finishes.

## 📦 Prerequisites

| Need | For |
|------|-----|
| Bash | Running the script (Linux, macOS) |
| `ping` | Probing hosts (standard on most systems) |

> **Note**: the script uses `ping -W1`, a 1-second timeout on Linux. macOS interprets `-W` as milliseconds, so slower hosts may be missed there.

## 🚀 Quick start

```bash
git clone https://github.com/usrnmhcs5he/pingac.git
cd pingac
chmod +x ping.sh
./ping.sh
```

The guided flow:

```
base IP prefix → start of range → end of range → scan → summary
```

Example session:

```
Base IP prefix (e.g., 192.168.0.): 192.168.1.
Start range (e.g., 2): 1
End range (e.g., 254): 100
Pinging 192.168.1.100: [##################################################] 100%
Scan complete. Active IPs saved to active_ips.txt.
Responding IPs:
192.168.1.1
192.168.1.23
```

Press Enter at any prompt to accept its default.

## 📁 Output

`active_ips.txt` is created in the current directory and **overwritten on every run**. It contains one line per responding host:

```
192.168.1.1 is active
192.168.1.23 is active
```

## 🔧 How it works

Each address in the range is pinged once (`ping -c1 -W1`). Hosts that answer are appended to `active_ips.txt` and collected for the final summary, while a 50-character progress bar tracks the sweep.

A silent host is not necessarily offline: some devices and firewalls drop ICMP echo requests.

## ⚠️ Legal notice

Unauthorized network scanning may be illegal. Use this tool only on networks you own or have explicit permission to scan.

## 🕘 Changelog

| Version | Changes |
|---------|---------|
| **11** | Improved progress bar, better input validation, cleaner output, more user-friendly defaults. |

## 📄 License

MIT License
