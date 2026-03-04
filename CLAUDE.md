# secIT 2026 – Risikomythen-Präsentation

Konferenz-Präsentation für die **secIT 2026** (heise) zum Thema IT-Sicherheits-Risikomythen und reale Fails.
Tool: **Slidev** (sli.dev) – Markdown-basierte Präsentation in Vue/Vite.

## Projektziel

Einzelne Risikomythen und Fails als abgeschlossene, eigenständige Slide-Module,
die über eine Master-Präsentation dynamisch eingebunden werden.

---

## Projektstruktur

```
secit26-riskmythen/
├── CLAUDE.md
├── package.json
├── slides.md               # Master-Präsentation (Einstiegspunkt)
├── vite.config.ts          # Optionale Vite-Konfiguration
├── myths/                  # Einzelne Mythos-Module
│   ├── myth-01-<slug>.md
│   ├── myth-02-<slug>.md
│   └── ...
├── fails/                  # Einzelne Fail-Module
│   ├── fail-01-<slug>.md
│   └── ...
├── components/             # Wiederverwendbare Vue-Komponenten
│   └── RiskBadge.vue
├── layouts/                # Eigene Slidev-Layouts
│   └── myth.vue
└── public/                 # Statische Assets (Bilder, Logos)
    ├── logo-secit.png
    └── assets/
```

---

## Technologie-Stack

- **Slidev** `^0.50` – Präsentations-Framework
- **Node.js** 18+ – bereits installiert (`v18.20.7`)
- **Vue 3** – für eigene Komponenten und Layouts
- **UnoCSS** – integriertes Styling (Utility-Classes, kein Tailwind nötig)
- **Markdown** mit Slidev-Erweiterungen (Frontmatter, Code-Blöcke, Animationen)

### Setup (einmalig)

```bash
npm init slidev@latest .   # Initialisierung falls noch nicht geschehen
# oder manuell:
npm install @slidev/cli @slidev/theme-default
```

### Entwicklung

```bash
npm run dev     # Startet Dev-Server auf http://localhost:3030
npm run build   # Baut statische HTML-Ausgabe
npm run export  # Exportiert als PDF
```

---

## Master-Präsentation (`slides.md`)

Die Datei `slides.md` ist der Einstiegspunkt. Sie enthält:
1. Titelfolie, Agenda, Einleitung
2. Einbindung der Mythos-/Fail-Module via `src:`
3. Abschluss-/Fazit-Folien

### Einbindung von Modulen via `src:`

```markdown
---
src: ./myths/myth-01-patching.md
---

---
src: ./fails/fail-01-ransomware.md
---
```

Der `src:`-Block ersetzt die Folie vollständig durch den Inhalt der Zieldatei.
Frontmatter aus der importierten Datei wird übernommen (Merging möglich).

### Beispiel-Struktur `slides.md`

```markdown
---
theme: default
title: "Risikomythen – secIT 2026"
author: "<Name>"
download: true
transition: slide-left
---

# Risikomythen in der IT-Sicherheit

Was wir falsch glauben – und was wirklich passiert.

---

## Agenda

<ul>
<li v-for="item in $slidev.nav.slides.filter(s => s.meta?.mythTitle)" :key="item.no">
  Mythos {{ item.meta.mythNo }}: {{ item.meta.mythTitle }}
</li>
</ul>

---
src: ./myths/myth-01-patching.md
---

---
src: ./myths/myth-02-firewall.md
---

---
src: ./fails/fail-01-ransomware.md
---

---

# Fazit

Risiken richtig einschätzen – statt Mythen glauben.
```

---

## Modul-Konventionen

### Dateinamen

- Mythen: `myths/myth-<NN>-<slug>.md` (z. B. `myth-03-mfa-reicht.md`)
- Fails: `fails/fail-<NN>-<slug>.md` (z. B. `fail-02-solarwinds.md`)
- `<NN>` zweistellig, `<slug>` lowercase-kebab-case, kurz und sprechend

### Modul-Frontmatter

Jedes Modul beginnt mit einem Frontmatter-Block mit diesen Pflichtfeldern:

```yaml
---
layout: myth          # Eigenes Layout (oder 'default', 'center', etc.)
mythNo: 1             # Laufende Nummer
mythTitle: "Patchen kann warten"   # Kurztitel für Agenda-Auto-Generierung
mythCategory: myth    # 'myth' oder 'fail'
transition: fade
---
```

### Modul-Aufbau (empfohlen: 3–5 Folien pro Modul)

```markdown
---
layout: myth
mythNo: 1
mythTitle: "Patchen kann warten"
mythCategory: myth
---

# Mythos 1: „Patchen kann warten"

> „Unsere Systeme sind stabil – ein Update bricht nur was."

---

## Warum das falsch ist

- CVE-Exploits erscheinen im Schnitt **15 Tage** nach Patch-Veröffentlichung
- Unternehmen patchen im Schnitt nach **60–90 Tagen**
- Das Fenster ist das Problem, nicht das Patchen selbst

---

## Real-World-Fail

**Equifax 2017** – Apache Struts, Patch verfügbar seit März, Breach im Mai.
143 Millionen Datensätze.

---

## Takeaway

<v-click>

Patchen ist kein Risiko – **nicht** Patchen ist es.

</v-click>
```

---

## Layout `layouts/myth.vue`

Eigenes Layout für einheitliches Erscheinungsbild aller Mythos-/Fail-Folien:

```vue
<template>
  <div class="myth-layout">
    <div class="myth-badge" v-if="$frontmatter.mythCategory === 'myth'">
      MYTHOS {{ $frontmatter.mythNo }}
    </div>
    <div class="myth-badge fail" v-else>
      FAIL {{ $frontmatter.mythNo }}
    </div>
    <slot />
  </div>
</template>

<style scoped>
.myth-layout { /* ... */ }
.myth-badge { background: #e63946; color: white; /* ... */ }
.myth-badge.fail { background: #f4a261; }
</style>
```

---

## Inhaltliche Struktur eines Moduls

Jedes Modul soll in sich abgeschlossen sein und folgendem Muster folgen:

| Folie | Inhalt |
|-------|--------|
| 1 | **Einstieg**: Mythos-Behauptung als Zitat / provokante These |
| 2 | **Realität**: Daten, Studien, CVEs, Zeitlinien |
| 3 | **Konkreter Fail**: Reales Beispiel mit Impact (Kosten, Datensätze, Downtime) |
| 4 | **Takeaway**: 1 Satz, der bleibt |
| (5) | Optional: Handlungsempfehlung / Quick-Win |

---

## Coding-Konventionen

- **Sprache der Präsentation**: Deutsch
- **Sprache im Code**: Englisch (Variablen, Kommentare, Layouts)
- **Animationen**: Sparsam – `v-click` und `transition` nutzen, nicht überladen
- **Farben**: Konsistentes Farbschema über UnoCSS-Variablen definieren
- **Bilder**: Unter `public/assets/` ablegen, via `/assets/bild.png` referenzieren
- **Keine externen Bild-URLs** – alle Assets lokal speichern
- **Code-Blöcke**: Mit Syntax-Highlighting, Sprache immer angeben

## Stil-Richtlinien

- Folien sind **kein Fließtext** – max. 6 Bullet-Points pro Folie
- Bullet-Points max. eine Zeile
- Wichtige Zahlen/Fakten **fett** oder als eigene Folie hervorheben
- Jeder Mythos endet mit einem klaren, einprägsamen **Takeaway**
- Konferenz-Kontext: Publikum sind IT-Security-Professionals → Fachbegriffe ok, kein Basis-Erklärbär-Niveau

---

## Erweiterung: neue Mythen/Fails hinzufügen

1. Neue Datei in `myths/` oder `fails/` anlegen (Namenskonvention beachten)
2. Frontmatter mit `mythNo`, `mythTitle`, `mythCategory` befüllen
3. In `slides.md` an der gewünschten Position einbinden:
   ```markdown
   ---
   src: ./myths/myth-NN-slug.md
   ---
   ```
4. Reihenfolge der `src:`-Blöcke in `slides.md` bestimmt die Präsentationsreihenfolge

---

## Wichtige Hinweise für Claude

- Alle Folien-Inhalte auf **Deutsch**
- `slides.md` ist der einzige Einstiegspunkt – nie direkt ein Modul starten
- Bei neuen Modulen immer die Frontmatter-Pflichtfelder vollständig setzen
- Layouts und Komponenten nur erstellen wenn mehrfach benötigt
- **Keine Redundanz**: Jeder Mythos/Fail erscheint genau einmal
- Vor dem Bearbeiten von Modulen immer `slides.md` lesen, um Kontext zu verstehen
- Zahlen und Fakten mit Quellenangabe versehen (als Kommentar `<!-- Quelle: ... -->`)
