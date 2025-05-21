#!/bin/bash
clear
cat ascii/ghostspoof.txt
echo -e "\n👻 GhostSpoof Mail Sender"

read -rp "From (spoofed address): " spoof_from
read -rp "To (real recipient): " spoof_to
read -rp "Subject: " subject
read -rp "Message Body: " body

SMTP_SERVER="127.0.0.1"
SMTP_PORT="1025"
logfile=logs/spoof_send_$(date +%Y%m%d_%H%M%S).txt
mkdir -p logs

echo -e "\n🚀 Sending spoofed email..."
{
  echo "FROM: $spoof_from"
  echo "TO:   $spoof_to"
  echo "SUBJ: $subject"
  echo "BODY: $body"
  echo "------------------------------------"

  swaks --to "$spoof_to" \
        --from "$spoof_from" \
        --server "$SMTP_SERVER" \
        --port "$SMTP_PORT" \
        --h-Subject: "$subject" \
        --body "$body"
} 2>&1 | tee "$logfile"

echo -e "\n✅ Log saved to $logfile"
xdg-open http://localhost:8025 &>/dev/null &
