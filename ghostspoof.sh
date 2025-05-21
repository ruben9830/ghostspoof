#!/bin/bash

# GhostSpoof CLI Launchpad
while true; do
  clear
  cat ascii/ghostspoof.txt
  echo -e "\n🎛️  GhostSpoof Toolkit Menu"
  echo "=============================="
  echo "1) Launch MailHog (Spoof Inbox)"
  echo "2) Send Spoofed Email (Manual)"
  echo "3) Analyze Headers (Paste/Inspect)"
  echo "4) Phishing Simulator (Random)"
  echo "5) Check Domain Spoofability"
  echo "0) Exit"
  echo "------------------------------"
  read -rp "Select an option: " opt
  echo ""

  case "$opt" in
    1) bash mailhog_launcher.sh ;;
    2) bash spoof_send.sh ;;
    3) bash header_analyzer.sh ;;
    4) bash phish_simulator.sh ;;
    5) bash spoof_verdict.sh ;;
    0) echo "👻 Exiting GhostSpoof..."; exit 0 ;;
    *) echo "❌ Invalid choice. Try again."; sleep 1 ;;
  esac
done
