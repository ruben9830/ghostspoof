# 👻 GhostSpoof

**GhostSpoof** is a local email spoofing and phishing simulation lab built for red teamers, defenders, and researchers. Send spoofed emails, analyze headers, test domain security, and train—all inside a sandboxed lab using MailHog.

![Bash](https://img.shields.io/badge/Bash-CLI-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![GhostOps](https://img.shields.io/badge/GhostOps-Addon-lightgrey)

---

## 🧰 Toolkit Overview

| Script | Description |
|--------|-------------|
| `ghostspoof.sh`        | Main launcher (menu-based) |
| `spoof_send.sh`        | Interactive spoof mail sender (`swaks`) |
| `spoof_verdict.sh`     | Spoofability scanner (SPF, DMARC, DKIM) |
| `header_analyzer.sh`   | Parses raw email headers for forensics |
| `mailhog_launcher.sh`  | Starts a local MailHog lab (SMTP & web UI) |
| `phish_simulator.sh`   | Simulates phishing payloads / templates |
| `ascii/`               | Banner art for spooky CLI branding |

---

## 🚀 Quick Start

### ⚙️ 1. Launch MailHog locally
```bash
docker run -d --name spooflab -p 1025:1025 -p 8025:8025 mailhog/mailhog
```

### 👻 2. Launch the toolkit
```bash
./ghostspoof.sh
```

You’ll be prompted to spoof emails, test domain security, or simulate phishing.

📬 All spoofed messages appear in: [http://localhost:8025](http://localhost:8025)

---

## 🔬 Use Cases

- 🔎 Email header forensics & inspection
- 🧪 Red team domain spoof tests (SPF/DMARC validation)
- 🛡️ Blue team phishing defense training
- ⚠️ Secure sandbox for proof-of-concept demonstrations

---

## 🛡️ Warning

This toolkit is for **educational and testing use only**.  
Never use GhostSpoof to send spoofed messages over the public internet.

---

## 🧠 Credits

Created by [@ruben9830](https://github.com/ruben9830) as a standalone **GhostOps** extension.

🕸️ GhostOps | 🧪 GhostSpoof | 🎯 MailHunter (coming soon)

---

📅 Updated: May 21, 2025
