# 👻 GhostSpoof

A local phishing and spoofing simulation toolkit using `swaks` and `MailHog`. Built for red team practice, header forensics, and lab-safe email spoof testing — all without touching the internet.

![Bash](https://img.shields.io/badge/Bash-CLI-blue)
![License](https://img.shields.io/badge/License-MIT-green)
![GhostOps](https://img.shields.io/badge/GhostOps-Addon-lightgrey)

---

## 🧰 Features

- ✅ Send spoofed emails with fake headers and sender addresses
- ✅ Run everything locally with MailHog (no external delivery)
- ✅ Auto-launch web UI for email review (port `8025`)
- ✅ Use custom SMTP relays or test real domains
- ✅ Integrated with `GhostOps` or standalone

---

## 🧪 Included Tools

| Tool | Description |
|------|-------------|
| `ghost_spoof_send.sh` | Interactive spoof mail sender using `swaks` |
| `ghost_spoofhunt.sh` | Domain spoofability scanner (SPF, DMARC, DKIM) |
| 🧪 `MailHog` | Docker-based local SMTP capture service (`localhost:1025` / web UI on `localhost:8025`) |

---

## 🚀 Quick Start

### 1. Run MailHog locally
```bash
docker run -d --name spooflab -p 1025:1025 -p 8025:8025 mailhog/mailhog
