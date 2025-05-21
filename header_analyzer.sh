#!/bin/bash
clear
cat ascii/ghostspoof.txt
echo -e "\n🔍 GhostSpoof Header Analyzer"

echo -e "\nPaste full email headers (press Ctrl+D when done):"
headers=$(</dev/stdin)

echo -e "\n=== Analysis ==="

# SPF Check
if echo "$headers" | grep -qi "spf=pass"; then
  echo "✅ SPF: PASS"
elif echo "$headers" | grep -qi "spf=fail"; then
  echo "❌ SPF: FAIL"
else
  echo "⚠️ SPF: Not detected"
fi

# DKIM Check
if echo "$headers" | grep -qi "dkim=pass"; then
  echo "✅ DKIM: PASS"
elif echo "$headers" | grep -qi "dkim=fail"; then
  echo "❌ DKIM: FAIL"
else
  echo "⚠️ DKIM: Not detected"
fi

# DMARC Check
if echo "$headers" | grep -qi "dmarc=pass"; then
  echo "✅ DMARC: PASS"
elif echo "$headers" | grep -qi "dmarc=fail"; then
  echo "❌ DMARC: FAIL"
else
  echo "⚠️ DMARC: Not detected"
fi

# Received-From Chain
echo -e "\n📦 Received-From Chain:"
echo "$headers" | grep -i "Received:" | sed 's/^/  → /'

echo -e "\n🧠 Done. Analyze verdicts manually or save output if needed."
