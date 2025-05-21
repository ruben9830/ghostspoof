#!/bin/bash
clear
cat ascii/ghostspoof.txt
echo -e "\n📦 Launching MailHog..."

if ! docker ps | grep -q mailhog; then
    docker run -d --name mailhog -p 1025:1025 -p 8025:8025 mailhog/mailhog
else
    echo "✔️  MailHog is already running."
fi

echo "🌐 MailHog Inbox: http://localhost:8025"
xdg-open http://localhost:8025 &>/dev/null &
