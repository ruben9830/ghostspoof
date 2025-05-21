#!/bin/bash
clear
cat ascii/ghostspoof.txt
echo -e "\n📛 Spoofability Verdict Engine"

read -rp "Enter a domain to analyze: " domain

echo -e "\n🔍 Checking SPF..."
spf_record=$(dig TXT "$domain" +short | grep "v=spf1")
if [[ -z "$spf_record" ]]; then
  echo "❌ No SPF record found."
else
  echo "✅ SPF: $spf_record"
  [[ "$spf_record" == *"-all"* ]] && echo "✔️ Hard fail (-all) set" || echo "⚠️ No hard fail (-all) – spoofable"
fi

echo -e "\n🔍 Checking DMARC..."
dmarc_record=$(dig TXT _dmarc."$domain" +short | tr -d '"')
if [[ -z "$dmarc_record" ]]; then
  echo "❌ No DMARC record found."
else
  echo "✅ DMARC: $dmarc_record"
  if [[ "$dmarc_record" == *"p=reject"* ]]; then
    echo "✔️ Reject policy – strong protection"
  elif [[ "$dmarc_record" == *"p=quarantine"* ]]; then
    echo "⚠️ Quarantine policy – may allow spoof"
  else
    echo "❌ None or permissive policy – spoofable"
  fi
fi

echo -e "\n🔍 Checking DKIM (default._domainkey)..."
dkim_record=$(dig TXT default._domainkey."$domain" +short)
if [[ -z "$dkim_record" ]]; then
  echo "❌ No DKIM record found at default._domainkey"
else
  echo "✅ DKIM record found"
fi

echo -e "\n🎯 Verdict:"
if [[ -z "$spf_record" || "$spf_record" != *"-all"* || "$dmarc_record" != *"p=reject"* ]]; then
  echo "⚠️  $domain is SPOOFABLE under many conditions."
else
  echo "✅ $domain is well-protected against spoofing."
fi
