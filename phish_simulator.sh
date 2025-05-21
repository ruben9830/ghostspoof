#!/bin/bash
clear
cat ascii/ghostspoof.txt
echo -e "\n🎯 GhostSpoof Phish Simulator"

read -rp "Target recipient (MailHog inbox): " target

subjects=("Your account is locked" "Invoice overdue" "Important: IT Policy Update" "Urgent payroll error" "CEO needs you ASAP")
senders=("it@corpsec.com" "hr@team.org" "admin@vpn.alert" "ceo@yourcompany.com" "helpdesk@support.tech")

mkdir -p logs

for i in {1..5}; do
  spoof_from="${senders[$((RANDOM % ${#senders[@]}))]}"
  subject="${subjects[$((RANDOM % ${#subjects[@]}))]}"
  body="This is a simulated phishing email for testing. Do NOT click any links."

  echo "📨 Sending: From <$spoof_from> → $target | Subject: $subject"

  swaks --to "$target" \
        --from "$spoof_from" \
        --server 127.0.0.1 \
        --port 1025 \
        --h-Subject: "$subject" \
        --body "$body" > "logs/phish_sim_$(date +%s).txt" 2>/dev/null

  sleep 1
done

echo -e "\n✅ Phishing simulation complete. Check MailHog inbox: http://localhost:8025"
