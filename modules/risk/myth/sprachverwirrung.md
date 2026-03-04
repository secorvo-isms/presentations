<!--
  FOLIE 1 – ZWEI VERSIONEN ZUR AUSWAHL
  Version A: Split-Layout mit Bild (Tower of Babel o. ä.)
  Version B: Pure Editorial-Typographie ohne Bild
  → Eine Version löschen, bevor die Präsentation eingesetzt wird
-->

---
layout: myth
moduleType: myth
moduleTitle: "Wir reden alle über Risiken"
context: talk
transition: fade
---

<!-- ─── VERSION A: MIT BILD ─────────────────────────────────────────────── -->
<!-- Bild: public/assets/risk/myth/babel.png                                 -->

<div class="grid grid-cols-[1fr_1.2fr] h-full gap-8 items-center">

  <!-- Bild-Spalte -->
  <div class="relative h-full rounded-xl overflow-hidden">
    <img src="/assets/risk/myth/babel.png"
         class="absolute inset-0 w-full h-full object-cover opacity-70" />
    <div class="absolute inset-0 bg-gradient-to-r from-transparent to-[#1a1a2e]"></div>
  </div>

  <!-- Text-Spalte -->
  <div class="flex flex-col justify-center gap-5">
    <div>
      <div class="text-7xl font-black tracking-tight text-white leading-none">RISIKO</div>
      <div class="text-gray-600 text-xs mt-2 tracking-widest uppercase">
        /ˈriːzikoː/ · Subst. · Neutrum
      </div>
    </div>
    <div class="space-y-2 mt-2">
      <div class="text-xl text-gray-200">① Eintrittswahrscheinlichkeit</div>
      <div class="text-xl text-gray-200">② Schadenshöhe</div>
      <div class="text-xl text-gray-200">③ Produkt aus beidem</div>
      <div class="text-xl text-gray-200">④ Auswirkung auf Ziele</div>
      <div class="text-xl text-gray-200 italic">⑤ Was auch immer</div>
    </div>
    <div class="text-red-400 italic text-lg border-t border-red-900 pt-4">
      — je nachdem, wen man fragt
    </div>
  </div>

</div>

---
layout: myth
moduleType: myth
moduleTitle: "Wir reden alle über Risiken"
context: talk
transition: fade
---

<!-- ─── VERSION B: PURE EDITORIAL-TYPOGRAPHIE ──────────────────────────── -->

<div class="relative h-full flex flex-col justify-between overflow-hidden">

  <!-- Ghost-Buchstabe im Hintergrund -->
  <div class="absolute -right-6 top-1/2 -translate-y-[55%]
              text-[20rem] font-black leading-none select-none pointer-events-none
              text-white/[0.025] tracking-tighter">
    R
  </div>

  <!-- Hero -->
  <div>
    <div class="text-[6.5rem] font-black tracking-tighter text-white leading-none">
      RISIKO
    </div>
    <div class="flex gap-3 mt-2 text-[0.65rem] text-gray-700 tracking-widest uppercase">
      <span>/ˈriːzikoː/</span><span>·</span>
      <span>Substantiv</span><span>·</span>
      <span>Neutrum</span><span>·</span>
      <span class="text-red-900">Anti-Pattern</span>
    </div>
  </div>

  <!-- Definitionen als Magazin-Spalten -->
  <div class="grid grid-cols-5 gap-3">
    <div class="border-t-2 border-red-400 pt-3">
      <div class="text-3xl font-black text-red-400">①</div>
      <div class="text-sm text-gray-300 mt-2 leading-snug">
        Eintrittswahr-<br>scheinlichkeit
      </div>
    </div>
    <div class="border-t-2 border-red-500/70 pt-3">
      <div class="text-3xl font-black text-red-500/70">②</div>
      <div class="text-sm text-gray-400 mt-2 leading-snug">Schadenshöhe</div>
    </div>
    <div class="border-t-2 border-red-600/50 pt-3">
      <div class="text-3xl font-black text-red-600/50">③</div>
      <div class="text-sm text-gray-500 mt-2 leading-snug">
        Produkt<br>aus beidem
      </div>
    </div>
    <div class="border-t-2 border-red-700/30 pt-3">
      <div class="text-3xl font-black text-red-700/30">④</div>
      <div class="text-sm text-gray-600 mt-2 leading-snug">
        Auswirkung<br>auf Ziele
      </div>
    </div>
    <div class="border-t-2 border-gray-800 pt-3">
      <div class="text-3xl font-black text-gray-700">⑤</div>
      <div class="text-sm text-gray-700 mt-2 leading-snug italic">
        Was auch<br>immer
      </div>
    </div>
  </div>

  <!-- Punchline -->
  <div class="text-right text-red-400 italic text-lg">
    — je nachdem, wen man fragt
  </div>

</div>

<!-- ─── FOLIEN 2–5: GEMEINSAMER INHALT ────────────────────────────────── -->

---
layout: myth
moduleType: myth
moduleTitle: "Wir reden alle über Risiken"
context: talk
transition: fade
---

## Ein Workshop. Zehn Leute.

<div class="grid grid-cols-3 gap-6 mt-10">

  <div class="text-center">
    <div class="text-8xl font-black text-red-400 leading-none">3</div>
    <div class="text-gray-400 mt-3 text-base">meinen „Risiko"<br>= <strong class="text-gray-200">Wahrscheinlichkeit</strong></div>
  </div>

  <div class="text-center">
    <div class="text-8xl font-black text-red-600 leading-none">2</div>
    <div class="text-gray-400 mt-3 text-base">meinen „Risiko"<br>= <strong class="text-gray-200">Schaden</strong></div>
  </div>

  <div class="text-center">
    <div class="text-8xl font-black text-gray-600 leading-none">5</div>
    <div class="text-gray-500 mt-3 text-base">meinen „Risiko"<br>= <em>irgendwas dazwischen</em></div>
  </div>

</div>

<div class="mt-10 p-4 bg-red-900/30 rounded border border-red-800 text-red-300 text-center">
  Alle nicken. Niemand hinterfragt es. Das Risk-Register ist schon geöffnet.
</div>

---
layout: myth
moduleType: myth
moduleTitle: "Wir reden alle über Risiken"
context: talk
transition: fade
---

## Drei Frameworks. Drei Sprachen. Null Konsens.

<div class="grid grid-cols-3 gap-5 mt-6">

  <div class="p-5 bg-slate-800/60 rounded-xl border border-slate-700 flex flex-col gap-3">
    <div class="text-xs text-gray-600 tracking-widest uppercase">ISO 31000:2018</div>
    <div class="text-red-400 font-black text-2xl leading-tight">Unsicherheit<br>über Ziele</div>
    <div class="text-gray-500 text-sm mt-auto">
      Risiko = kontextabhängige Zielverfehlung
    </div>
  </div>

  <div class="p-5 bg-slate-800/60 rounded-xl border border-slate-700 flex flex-col gap-3">
    <div class="text-xs text-gray-600 tracking-widest uppercase">NIST SP 800-30</div>
    <div class="text-red-400 font-black text-2xl leading-tight">Threat ×<br>Vuln × Impact</div>
    <div class="text-gray-500 text-sm mt-auto">
      Risiko = Bedrohungs-Expositions-Produkt
    </div>
  </div>

  <div class="p-5 bg-slate-800/60 rounded-xl border border-slate-700 flex flex-col gap-3">
    <div class="text-xs text-gray-600 tracking-widest uppercase">FAIR</div>
    <div class="text-red-400 font-black text-2xl leading-tight">LEF ×<br>LM</div>
    <div class="text-gray-500 text-sm mt-auto">
      Risiko = quantifizierbarer Erwartungswert
    </div>
  </div>

</div>

<div class="mt-6 text-gray-500 text-sm italic text-right">
  Alle Frameworks sind vertretbar. Zusammen im selben Workshop sind sie toxisch.
</div>

<!-- Quelle: ISO 31000:2018; NIST SP 800-30 Rev. 1; FAIR Institute openFAIR -->

---
layout: myth
moduleType: myth
moduleTitle: "Wir reden alle über Risiken"
context: talk
transition: fade
---

## Die Lösung ist unspektakulär.

<div class="mt-6 text-2xl text-gray-300 leading-relaxed">
  Ein verbindliches <strong class="text-white">Risiko-Glossar</strong>
  für die eigene Organisation.
</div>

<v-clicks>

<div class="mt-8 grid grid-cols-2 gap-3 text-sm">
  <div class="flex items-start gap-2 text-gray-400">
    <span class="text-red-500 mt-0.5">→</span>
    <span>Zehn Begriffe. Klar definiert. Von allen akzeptiert.</span>
  </div>
  <div class="flex items-start gap-2 text-gray-400">
    <span class="text-red-500 mt-0.5">→</span>
    <span>Gilt für alle: Management, IT, Audit, Fachbereiche.</span>
  </div>
  <div class="flex items-start gap-2 text-gray-400">
    <span class="text-red-500 mt-0.5">→</span>
    <span>Klären <strong class="text-gray-200">vor</strong> der Bewertung – nicht danach.</span>
  </div>
  <div class="flex items-start gap-2 text-gray-400">
    <span class="text-red-500 mt-0.5">→</span>
    <span>Kein Framework zwingen – eigene Sprache wählen.</span>
  </div>
</div>

</v-clicks>

<div v-click class="mt-8 p-4 bg-slate-800 rounded-xl border border-slate-600 text-sm leading-loose">
  <span class="text-gray-500 text-xs tracking-widest uppercase block mb-2">Minimalset</span>
  <span class="text-gray-300">
    Risiko · Bedrohung · Schwachstelle · Schadenshöhe · Eintrittswahrscheinlichkeit ·
    Risikoakzeptanz · Restrisiko · Kontrollziel · Maßnahme · Risikoeigner
  </span>
</div>

---
layout: myth
moduleType: myth
moduleTitle: "Wir reden alle über Risiken"
context: talk
transition: fade
---

<div class="relative h-full flex flex-col justify-center overflow-hidden">

  <!-- Ghost-Text Hintergrund -->
  <div class="absolute -left-4 top-1/2 -translate-y-1/2
              text-[14rem] font-black leading-none select-none pointer-events-none
              text-white/[0.025] tracking-tighter">
    BABEL
  </div>

  <div class="relative">
    <div class="text-xs text-gray-700 tracking-widest uppercase mb-6">Takeaway</div>

    <div class="text-5xl font-black text-white leading-tight mb-6">
      Bevor wir Risiken bewerten,<br>
      <span class="text-red-400">reden wir über Risiken.</span>
    </div>

    <div class="w-12 border-t-2 border-red-700 mb-6"></div>

    <div class="text-gray-500 text-lg">
      Ein Glossar kostet einen halben Tag.<br>
      Inkonsistente Risk-Register kosten Jahre.
    </div>
  </div>

</div>
