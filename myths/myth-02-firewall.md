---
layout: myth
mythNo: 2
mythTitle: "Die Firewall schützt uns"
mythCategory: myth
transition: fade
---

# „Die Firewall schützt uns"

<div class="mt-6 text-2xl italic text-gray-400 border-l-4 border-red-500 pl-6">
„Wir haben eine Next-Gen-Firewall. Die blockt alles Böse."
</div>

<div class="mt-8 text-gray-500 text-sm">
Beliebt in: KMU, Unternehmen mit IT-Budget-Diskussionen, Audit-Gesprächen
</div>

---
layout: myth
mythNo: 2
mythTitle: "Die Firewall schützt uns"
mythCategory: myth
transition: fade
---

## Was Firewalls nicht können

<v-clicks>

- **Port 443 ist immer offen** – C2-Traffic über HTTPS ist Standard
- Angreifer kommen heute meist **von innen**: Phishing, Insider, kompromittierte Geräte
- **Lateral Movement** findet im erlaubten Traffic statt
- SaaS, Cloud, Shadow IT schaffen Wege komplett **an der Firewall vorbei**
- Eine Firewall ist **keine Kompensation** für fehlende Segmentierung

</v-clicks>

<div v-click class="mt-6 p-4 bg-red-900 bg-opacity-30 rounded border border-red-700 text-red-300">
  Die Firewall schützt den Perimeter. Der Perimeter existiert nicht mehr.
</div>

---
layout: myth
mythNo: 2
mythTitle: "Die Firewall schützt uns"
mythCategory: myth
transition: fade
---

## SolarWinds 2020

<div class="grid grid-cols-2 gap-8 mt-4">

<div>

**Was passierte:**
- Supply-Chain-Angriff auf SolarWinds Orion
- Backdoor kam als **signiertes Software-Update**
- Traffic lief über Port 443, sah aus wie legitime Telemetrie
- Firewalls: vollständig umgangen

</div>

<div>

**Der Schaden:**
- **18.000+** Organisationen betroffen
- US-Behörden: Treasury, Commerce, Homeland Security
- Monatelang unentdeckt (Ø **287 Tage** Verweildauer)
- Geschätzter Schaden: **>100 Mrd. USD**

</div>

</div>

<!-- Quelle: SolarWinds SEC Filing; CISA Alert AA20-352A; FireEye Blog 2020 -->

---
layout: myth
mythNo: 2
mythTitle: "Die Firewall schützt uns"
mythCategory: myth
transition: fade
---

## Takeaway

<div class="flex items-center justify-center h-full">
  <div class="text-center">
    <div class="text-4xl font-bold text-red-400 mb-6">
      Perimeter-Security ist notwendig.
    </div>
    <div class="text-3xl text-gray-300">
      Sie ist nicht hinreichend.
    </div>
    <div class="mt-10 text-gray-500 text-lg">
      → Zero Trust, Netz-Segmentierung, Endpoint Detection –<br>
      der Angreifer ist bereits drin. Was dann?
    </div>
  </div>
</div>
