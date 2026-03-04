---
layout: myth
moduleType: myth
moduleNo: 1
moduleTitle: "Patchen kann warten"
context: talk
transition: fade
---

# „Patchen kann warten"

<div class="mt-6 text-2xl italic text-gray-400 border-l-4 border-red-500 pl-6">
„Unsere Systeme laufen stabil. Ein Update bricht nur etwas."
</div>

<div class="mt-8 text-gray-500 text-sm">
Beliebt in: Produktion, OT-Umgebungen, überall wo SLAs zählen
</div>

---
layout: myth
moduleType: myth
moduleNo: 1
moduleTitle: "Patchen kann warten"
context: talk
transition: fade
---

## Warum das gefährlich ist

<v-clicks>

- Zwischen CVE-Veröffentlichung und erstem Exploit: **Ø 12–15 Tage** <!-- Quelle: Qualys TRU 2023 -->
- Durchschnittliche Patch-Zeit in Unternehmen: **60–150 Tage** <!-- Quelle: Ponemon Institute 2023 -->
- Das Fenster liegt nicht beim Patchen – **es liegt dazwischen**
- Angreifer scannen aktiv nach bekannten CVEs, automatisiert, rund um die Uhr

</v-clicks>

<div v-click class="mt-6 p-4 bg-red-900 bg-opacity-30 rounded border border-red-700 text-red-300">
  Ein nicht eingespielter Patch ist kein Stillstand – er ist eine offene Einladung.
</div>

---
layout: myth
moduleType: myth
moduleNo: 1
moduleTitle: "Patchen kann warten"
context: talk
transition: fade
---

## Equifax 2017

<div class="grid grid-cols-2 gap-8 mt-4">

<div>

**Was passierte:**
- Apache Struts CVE-2017-5638
- Patch verfügbar: **März 2017**
- Breach entdeckt: **Juli 2017**
- 4 Monate ungepatcht, trotz bekannter Kritikalität

</div>

<div>

**Der Schaden:**
- **147 Mio.** Datensätze kompromittiert
- Sozialversicherungsnummern, Kreditdaten
- Vergleich: **~700 Mio. USD**
- CEO, CIO, CSO mussten zurücktreten

</div>

</div>

<!-- Quelle: FTC, Equifax Settlement 2019; Ponemon Post-Breach Report -->

---
layout: myth
moduleType: myth
moduleNo: 1
moduleTitle: "Patchen kann warten"
context: talk
transition: fade
---

## Takeaway

<div class="flex items-center justify-center h-full">
  <div class="text-center">
    <div class="text-4xl font-bold text-red-400 mb-6">
      Patchen ist kein Risiko.
    </div>
    <div class="text-3xl text-gray-300">
      <span class="line-through text-gray-600">Nicht</span> patchen ist es.
    </div>
    <div class="mt-10 text-gray-500 text-lg">
      → Risikoakzeptanz für Patches muss <strong>begründet und befristet</strong> sein,<br>
      nicht der Standardweg.
    </div>
  </div>
</div>
