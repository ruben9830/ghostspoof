# 👻 GhostSpoof

GhostSpoof is a standalone spoofing and phishing lab built for security testing, header forensics, and training simulations — all safely contained using [MailHog](https://github.com/mailhog/MailHog).

---

## 💡 Features

- ✅ Send spoofed emails (from any fake address)
- 📬 View messages instantly in a web-based inbox
- 🧠 Analyze full headers for SPF/DKIM/DMARC verdicts
- 🔐 Test domain spoofability in seconds
- 🎯 Simulate phishing campaigns (bulk fake sender & subject)
- 🖼️ Terminal-based UI with ASCII branding

---

## 🚀 Quick Start

1. **Install Docker**
   ```bash
   sudo apt install docker.io -y
   sudo systemctl enable docker
   sudo usermod -aG docker $USER
