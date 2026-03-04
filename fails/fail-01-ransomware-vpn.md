---
layout: myth
mythNo: 1
mythTitle: "Ransomware durch ungepatches VPN"
mythCategory: fail
transition: fade
---

# Fail: Ransomware durch ungepatches VPN

<div class="mt-6 text-xl text-orange-300 border-l-4 border-orange-500 pl-6">
Ein Unternehmen. Ein ungepatchtes VPN-Gateway.<br>
Drei Wochen bis zur Wiederherstellung.
</div>

<div class="mt-6 text-gray-500 text-sm">
Szenario: Mittelständisches Produktionsunternehmen, ~300 Mitarbeiter, DACH-Region
</div>

---
layout: myth
mythNo: 1
mythTitle: "Ransomware durch ungepatches VPN"
mythCategory: fail
transition: fade
---

## Die Ereigniskette

<div class="mt-4">

```
[Tag 0]   CVE-XXXX-XXXX veröffentlicht – Fortinet FortiGate RCE, CVSS 9.8
[+3 Tage] PoC-Exploit öffentlich verfügbar
[+7 Tage] Automatisiertes Scanning durch Bedrohungsakteur
[+8 Tage] Initialer Zugriff via VPN-Gateway
[+9–15]   Lateral Movement, AD-Kompromittierung, Daten-Exfil
[+16 Tage] Ransomware-Deployment – Produktion steht still
[+37 Tage] Systeme vollständig wiederhergestellt
```

</div>

<div class="mt-4 text-sm text-gray-500">
Patch-Stand des VPN-Gateways zum Zeitpunkt des Angriffs: <strong class="text-red-400">8 Monate veraltet</strong>
</div>

<!-- Quelle: Anonymisiertes Incident-Response-Szenario, basierend auf Fortinet-CVE-Welle 2023/2024 -->

---
layout: myth
mythNo: 1
mythTitle: "Ransomware durch ungepatches VPN"
mythCategory: fail
transition: fade
---

## Was es kostete

<div class="grid grid-cols-3 gap-6 mt-8 text-center">

<div class="p-4 bg-gray-800 rounded-lg">
  <div class="text-4xl font-bold text-orange-400">21</div>
  <div class="text-gray-400 mt-2">Tage Produktions-<br>ausfall</div>
</div>

<div class="p-4 bg-gray-800 rounded-lg">
  <div class="text-4xl font-bold text-orange-400">~1,2M€</div>
  <div class="text-gray-400 mt-2">Gesamtschaden<br>(geschätzt)</div>
</div>

<div class="p-4 bg-gray-800 rounded-lg">
  <div class="text-4xl font-bold text-orange-400">0€</div>
  <div class="text-gray-400 mt-2">Lösegeld gezahlt<br>(Backups vorhanden)</div>
</div>

</div>

<div class="mt-8 text-gray-400">
  Backup-Strategie hat funktioniert. Die <strong>Ursache</strong> wäre für ~2h Wartungsfenster behebbar gewesen.
</div>

---
layout: myth
mythNo: 1
mythTitle: "Ransomware durch ungepatches VPN"
mythCategory: fail
transition: fade
---

## Was hätte geholfen

<v-clicks>

- **Patch-Management-Prozess** mit definierten SLAs nach CVSS-Score
- **Asset-Inventar**: Wissen, welche exponierte Systeme existieren
- **Netz-Segmentierung**: VPN-Zone isoliert vom Produktionsnetz
- **EDR auf Endpunkten**: Lateral Movement früher erkennen
- **Backups offline/immutable**: Vorhanden ✓ – hat den Totalschaden verhindert

</v-clicks>

<div v-click class="mt-6 p-4 bg-orange-900 bg-opacity-30 rounded border border-orange-700 text-orange-300">
  Takeaway: Backups retten das Unternehmen. Patches retten den Monat.
</div>
