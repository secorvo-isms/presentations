# Review: Struktur und Aufbau von input/slidev_etka25sec

**Quelle:** `input/slidev_etka25sec/`
**Ziel:** Strukturelle Muster bewerten, Erkenntnisse für modulare secIT-2026-Präsentation ableiten

---

## 1. Ist-Struktur

```
slides.md                          ← globaler Einstiegspunkt
pages/
  <sektion>/
    master.md                      ← Sektions-Reihenfolge
    inc/
      <folie>.md                   ← atomare Folie / Foliengruppe
assets/
  <sektion>/
    <bild>.*
public/
  img/
    <sektion>/
      <bild>.*
components/
  *.vue
snippets/
  *.ts
```

**Einbindungstiefe:** 3 Ebenen — `slides.md` → `master.md` → `inc/*.md`

---

## 2. Was funktioniert gut

### 2.1 Drei-Ebenen-Hierarchie

Die Trennung von globalem Einstieg, Sektions-Aggregation und atomaren Folien ist konzeptionell richtig. Sie ermöglicht:
- Sektionen einzeln zu aktivieren/deaktivieren (in `slides.md` via `hide: true`)
- Folien innerhalb einer Sektion umzusortieren (in `master.md`)
- Einzelne Folien ohne Kontextverlust auszutauschen

### 2.2 Threat-Modeling-Sektion als Vorbild

Diese Sektion zeigt die Granularität, die für Wiederverwendbarkeit nötig ist: **eine Folie = eine Datei**, sprechend benannt nach Inhalt, nicht nach Position. 21 `inc/`-Dateien für 21 thematische Einheiten.

Gegenbeispiel: Die Hacking- und Fixing-Sektionen haben jeweils **eine** `inc/`-Datei für 15–35 Folien – eine Monodatei, die keine selektive Einbindung erlaubt.

### 2.3 Sektionen sind einzeln startbar

Durch den `master.md`-Ansatz könnte jede Sektion theoretisch als eigenständige Präsentation verwendet werden – das ist der richtige Architekturgedanke.

---

## 3. Strukturelle Probleme

### 3.1 Frontmatter-Redundanz: 6× dasselbe Konfigurationsblock

Jede `master.md` wiederholt das vollständige globale Frontmatter (`theme`, `fonts`, `colorSchema`, `drawings`, `transition`, `mdc`) – identisch zu `slides.md`:

```yaml
# Steht in slides.md UND in jeder der 6 master.md-Dateien:
theme: default
colorSchema: dark
transition: slide-left
mdc: true
fonts:
  sans: Acme
  mono: JetBrains Mono
```

**Das Problem:** In einer per `src:` eingebundenen Datei hat das globale Konfigurationsfrontmatter **keine Wirkung** – es wird von Slidev ignoriert. Die Konfiguration kommt ausschließlich aus `slides.md`. Der Frontmatter-Block in allen `master.md`-Dateien ist toter Code.

**Konsequenz:** Wer `master.md` standalone startet (`slidev master.md`), bekommt das gewünschte Aussehen. Wer sie über `slides.md` einbindet, auch – aber nicht weil das Frontmatter in `master.md` wirkt, sondern weil `slides.md` es vorgibt. Die scheinbare Konsistenz trügt über die tatsächliche Wirkungslosigkeit hinweg.

**Für secIT 2026:** Globale Konfiguration gehört ausschließlich in `slides.md`. Module (`master.md`, `inc/*.md`) enthalten **nur** folienbezogenes Frontmatter (`layout`, `transition`, `class`, eigene Metafelder).

### 3.2 Keine Trennung von Kontext und Inhalt

Es gibt keine strukturelle Unterscheidung zwischen:
- Folien, die **kontextunabhängig** wiederverwendbar sind (konzeptionelle Inhalte)
- Folien, die **kontextgebunden** sind (spezifischer Event, spezifisches Publikum, Übungsaufgaben, URLs)

Beide Typen liegen nebeneinander im gleichen `inc/`-Verzeichnis, ohne Kennzeichnung. Für einen neuen Kontext muss man die Dateien inhaltlich lesen und manuell selektieren.

**Für secIT 2026:** Kontext als Frontmatter-Metafeld (`context: talk | workshop | both`) ermöglicht spätere Filterung und macht die Eignung einer Folie deklarativ sichtbar.

### 3.3 Keine einheitliche Granularität

Die Granularität schwankt zwischen Sektionen erheblich:

| Sektion | inc/-Dateien | Folien (geschätzt) | Verhältnis |
|---|---|---|---|
| einstieg | 7 | ~8 | ~1:1 ✓ |
| threat_modeling | 21 | ~21 | 1:1 ✓ |
| hacking | 2 | ~16 | 1:8 ✗ |
| fixing | 2 | ~35 | 1:17 ✗ |
| austausch | 2 | ~2 | 1:1 ✓ |
| wrap_up | 3 | ~3 | 1:1 ✓ |

Hacking und Fixing sind Monodateien. Ohne Aufspaltung können einzelne Folien daraus nicht selektiv in andere Präsentationen eingebunden werden.

**Für secIT 2026:** Konsequent 1:1 – eine thematische Einheit = eine Datei.

### 3.4 Kein gemeinsames Styling-System: Inline-CSS ohne Skala

Layoutentscheidungen (Schriftgrößen, Abstände, Farben) sind als Inline-Styles direkt in jeder Folie kodiert:

```html
<div style="font-size: 300%;">…</div>
<div class="h-12"></div>
<div style="color: red;">…</div>
```

Die verwendeten Größen (`120%`, `125%`, `150%`, `175%`, `200%`, `250%`, `300%`, `350%`, `400%`) und Abstände (`h-3`, `h-6`, `h-9`, `h-12`, `h-15`, `h-16`, `h-21`, `h-24`, `h-34`, `h-70`) sind ad-hoc gewählt – es gibt kein erkennbares System.

**Konsequenz für Wiederverwendung:** Nimmt man eine Folie aus dem Kontext und setzt sie in eine andere Präsentation, bringt sie ihre eigenen Größen und Farben mit. Es gibt keine Abstraktionsschicht (CSS-Variablen, Theme-Klassen), die eine konsistente Darstellung über verschiedene Zusammenstellungen hinweg garantieren würde.

**Für secIT 2026:** Einen kleinen Satz semantischer CSS-Klassen definieren (`slide-title`, `slide-quote`, `slide-body`, `slide-takeaway`, `spacer-sm/md/lg`), der in allen Modulen verwendet wird. Das Layout entsteht durch die Klassen, nicht durch Inline-Maße.

### 3.5 Zweistufige Asset-Trennung ohne klare Regel

Assets liegen an zwei Orten:
- `assets/<sektion>/` – für Slidev-interne Verarbeitung (Vite-Bundle)
- `public/img/<sektion>/` – für statische Bereitstellung (direkte URL)

Es ist nicht dokumentiert, welches Asset wohin gehört und warum. In `inc/*.md` werden beide Pfade gemischt verwendet (`/assets/…` und `/img/…`). Beim Herauslösen einer Folie in einen anderen Kontext ist unklar, welches Asset-System sie voraussetzt.

**Für secIT 2026:** Alle Assets in `public/assets/<modul>/` – einheitlich, statisch, einfache URLs. Nur wenn Vite-Verarbeitung (z. B. Optimierung, Import) nötig ist, abweichen und das explizit dokumentieren.

### 3.6 Sektions-`master.md` ist selbst nicht atomar

Die `master.md`-Dateien aggregieren ihre `inc/`-Folien, sind aber selbst nicht als eigenständige Module nutzbar, weil sie:
- kein sauberes Frontmatter ohne den globalen Ballast haben (s. 3.1)
- keine Metadaten tragen, die beschreiben, was sie exportieren

**Für secIT 2026:** `master.md` ist reine Aggregation – ein Index ohne Konfigurationsrauschen. Sie trägt selbst keinen Inhalt.

---

## 4. Strukturelles Leitbild für secIT 2026

Aus der Analyse ergibt sich folgendes Modell:

```
slides.md              ← Einzige Konfigurationsquelle (theme, fonts, etc.)
                          Aggregiert Module per src:
myths/
  myth-NN-<slug>.md    ← Eigenständiges Modul: 1 Folie oder thematisch
                          zusammenhängende Foliengruppe (3–5 Folien)
                          Frontmatter: nur layout + eigene Metafelder
fails/
  fail-NN-<slug>.md    ← Dto.
public/assets/
  <modul>/             ← Alle Assets eines Moduls zusammen
```

**Kernprinzipien:**
1. **Konfiguration gehört nach oben** – Module sind konfigurationsagnostisch
2. **Eine thematische Einheit = eine Datei** – keine Monodateien
3. **Deklarativer Kontext** – Eignung einer Folie steht im Frontmatter, nicht im Kopf des Autors
4. **Styling durch Klassen, nicht Maße** – Folien sehen konsistent aus, egal in welcher Zusammenstellung

---

## 5. Fazit

Die ETKA25-Struktur ist ein **guter erster Schritt** zur Modularisierung. Der Threat-Modeling-Block zeigt, dass das Prinzip „eine Einheit, eine Datei" funktioniert und wartbar ist. Die zentralen Schwächen – Frontmatter-Duplikation, fehlende Kontext-Trennung, uneinheitliche Granularität, kein Styling-System – entstehen dort, wo das Prinzip nicht konsequent durchgehalten wurde.

Für secIT 2026 gilt: **Das Prinzip ist richtig, die Konsequenz muss höher sein.**
