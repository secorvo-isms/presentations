# Plan: Modulares Präsentations-Repository mit GitHub-Pages-Deployment

**Basis:** REVIEW.md (Strukturanalyse etka25sec) + WUENSCHE.md
**Ziel:** Ein Repository, das mehrere Präsentationen aus einem gemeinsamen Modul-Fundus zusammenstellt und per GitHub Actions auf GitHub Pages veröffentlicht.

---

## 1. Repository-Struktur

```
presentations/                     ← Repo-Root
├── CLAUDE.md
├── package.json                   ← Workspace-Root (npm workspaces)
├── index.html                     ← Hauptindex (Liste aller Präsentationen)
│
├── modules/                       ← Gemeinsamer Modul-Fundus
│   └── <thema>/                   ← Beliebige Tiefe, z. B. risk/
│       ├── <untertyp>/            ← z. B. myth/ oder fail/
│       │   ├── <slug>.md          ← Ein Modul = eine thematische Einheit
│       │   └── ...
│       └── ...
│
├── public/                        ← Globale statische Assets
│   └── assets/
│       └── <thema>/
│           └── <untertyp>/
│               └── <bild>.*       ← Spiegelt modules/-Struktur
│
├── components/                    ← Gemeinsame Vue-Komponenten
│   └── RiskBadge.vue
│
├── layouts/                       ← Gemeinsame Slidev-Layouts
│   └── myth.vue
│
├── presentations/                 ← Einzelne Präsentationen
│   ├── secit26-riskmythen/
│   │   ├── package.json           ← Slidev-Abhängigkeiten
│   │   ├── slides.md              ← Einzige Konfigurationsquelle
│   │   └── vite.config.ts         ← Nur wenn nötig
│   └── <weitere-präsentation>/
│       ├── package.json
│       └── slides.md
│
└── .github/
    └── workflows/
        └── deploy.yml             ← Build + Deploy aller Präsentationen
```

**Kernentscheidung: Relativer Modul-Pfad**
`slides.md` referenziert Module per `src:` mit relativem Pfad nach oben:
```yaml
---
src: ../../modules/risk/myth/patching.md
---
```
Slidev löst `src:`-Pfade relativ zur `slides.md` auf – das funktioniert auch über Verzeichnisgrenzen hinweg.

---

## 2. Modul-Konventionen (aus REVIEW abgeleitet)

### 2.1 Dateiname und Frontmatter

- **Kein Positions-Prefix im Dateinamen** – Reihenfolge bestimmt `slides.md`, nicht der Dateiname.
- Dateiname: `<slug>.md` (lowercase-kebab-case, inhaltsbeschreibend)
- Beispiel: `modules/risk/myth/patching.md`, `modules/risk/fail/equifax.md`

### 2.2 Modul-Frontmatter

```yaml
---
layout: myth          # Eigenes Layout – kein globales Konfigurationsrauschen
moduleType: myth      # 'myth' | 'fail' | 'intro' | 'takeaway'
moduleNo: 1           # Laufende Nummer (kontext-relativ, in slides.md vergeben)
moduleTitle: "Patchen kann warten"
context: talk         # 'talk' | 'workshop' | 'both'  ← deklarativer Kontext
transition: fade
---
```

**Kein theme, fonts, colorSchema** – das kommt ausschließlich aus der `slides.md` der jeweiligen Präsentation.

### 2.3 Granularität

- **1 thematische Einheit = 1 Datei** (keine Monodateien)
- Empfehlung: 3–5 Folien pro Modul (Einstieg → Realität → Fail → Takeaway)
- Eine Foliengruppe darf in einer Datei bleiben, wenn sie untrennbar zusammengehört

### 2.4 Styling

- Keine Inline-Styles mit Ad-hoc-Maßen (`font-size: 300%`)
- Semantische UnoCSS-Klassen definieren: `slide-title`, `slide-quote`, `slide-body`, `slide-takeaway`, `spacer-sm/md/lg`
- Klassen in `layouts/` oder einer globalen CSS-Datei definieren, die in `slides.md` eingebunden wird

---

## 3. Asset-Organisation

Analog zu den Modulen – gleiche Verzeichnisstruktur unter `public/assets/`:

```
public/assets/risk/myth/patching-timeline.png
public/assets/risk/fail/equifax-breach.png
```

Referenzierung in Modulen immer als absolute URL:
```markdown
![Timeline](/assets/risk/myth/patching-timeline.png)
```

**Regel:** Alle Assets unter `public/assets/`. Vite-Bundle-Assets (`assets/`) nur wenn Vite-Verarbeitung explizit nötig und dokumentiert.

---

## 4. `slides.md` einer Präsentation

```yaml
---
# Einzige Konfigurationsquelle – wird nicht in Modulen wiederholt
theme: default
title: "Risikomythen – secIT 2026"
colorSchema: dark
fonts:
  sans: Acme
  mono: JetBrains Mono
transition: slide-left
mdc: true
---
```

Danach: Titelfolie, Agenda, Module via `src:`, Abschluss.

```markdown
---
src: ../../modules/risk/myth/patching.md
---

---
src: ../../modules/risk/myth/firewall.md
---

---
src: ../../modules/risk/fail/equifax.md
---
```

---

## 5. Build & Deploy: GitHub Actions + GitHub Pages

### 5.1 Strategie

- **Branch `main`**: Quellcode
- **Branch `gh-pages`**: Nur Build-Artefakte, niemals händisch bearbeiten
- Jede Präsentation baut in ein Unterverzeichnis: `/presentations/<name>/`
- Hauptindex (`index.html`) listet alle Präsentationen

### 5.2 Build-Ablauf

Jede Präsentation wird separat gebaut:

```bash
# Beispiel für presentations/secit26-riskmythen/
cd presentations/secit26-riskmythen
npx slidev build --base /presentations/secit26-riskmythen/ --out ../../dist/presentations/secit26-riskmythen
```

Der `--base`-Parameter setzt den Pfad für alle Asset-URLs korrekt.

### 5.3 GitHub Actions Workflow (`.github/workflows/deploy.yml`)

```yaml
name: Build & Deploy Presentations

on:
  push:
    branches: [main]
  workflow_dispatch:

permissions:
  contents: write
  pages: write
  id-token: write

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4

      - uses: actions/setup-node@v4
        with:
          node-version: 20
          cache: npm

      - name: Install root dependencies
        run: npm ci

      # Für jede Präsentation: Dependencies installieren + bauen
      - name: Build secit26-riskmythen
        working-directory: presentations/secit26-riskmythen
        run: |
          npm ci
          npx slidev build \
            --base /presentations/secit26-riskmythen/ \
            --out ../../dist/presentations/secit26-riskmythen

      # Weitere Präsentationen analog...

      - name: Generate index page
        run: node scripts/generate-index.js

      - name: Deploy to GitHub Pages
        uses: peaceiris/actions-gh-pages@v4
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./dist
          publish_branch: gh-pages
          force_orphan: true   # gh-pages bleibt sauber, keine History
```

### 5.4 Index-Generierung (`scripts/generate-index.js`)

Ein einfaches Node-Skript liest alle `presentations/*/slides.md`, extrahiert `title` aus dem Frontmatter und generiert `dist/index.html` mit einer Linkliste.

```javascript
// Liest presentations/*/slides.md → extrahiert title aus Frontmatter
// Schreibt dist/index.html mit Links auf /presentations/<name>/
```

### 5.5 GitHub Pages Einstellungen

- Source: `gh-pages` Branch, Root `/`
- Custom Domain: optional
- HTTPS: erzwingen

---

## 6. npm Workspaces (package.json Root)

```json
{
  "name": "presentations",
  "private": true,
  "workspaces": ["presentations/*"],
  "scripts": {
    "dev": "npm run dev --workspace=presentations/secit26-riskmythen",
    "build:all": "node scripts/build-all.js",
    "index": "node scripts/generate-index.js"
  }
}
```

Jede Präsentation hat eine eigene `package.json` mit Slidev als Abhängigkeit. Das ermöglicht unterschiedliche Slidev-Versionen pro Präsentation falls nötig.

---

## 7. Umsetzungsreihenfolge

| Schritt | Was | Warum zuerst |
|---|---|---|
| 1 | Verzeichnisstruktur anlegen (`modules/`, `presentations/`, `scripts/`) | Fundament |
| 2 | Erste Präsentation `secit26-riskmythen` migrieren | Validiert das Konzept |
| 3 | 2–3 Module aus etka25sec extrahieren + anpassen | Zeigt Wiederverwendbarkeit |
| 4 | GitHub Actions Workflow (`deploy.yml`) | Automatisiert Deployment |
| 5 | Index-Generator-Skript | Vervollständigt die Pipeline |
| 6 | Weitere Module und Präsentationen ergänzen | Iterativ |

---

## 8. Offene Entscheidungen

| Frage | Optionen | Empfehlung |
|---|---|---|
| Slidev-Version: shared oder per Präsentation? | Root-`node_modules` vs. Workspaces | Workspaces – Präsentationen bleiben unabhängig |
| Modul-Pfade: relativ (`../../modules/`) oder Symlinks? | Relative Pfade | Relative Pfade – kein OS-Overhead |
| `context:`-Filterung: Build-Zeit oder Runtime? | Build-Script vs. Slidev-Addon | Build-Zeit – einfacher, kein Addon nötig |
| Neue Präsentation anlegen: manuell oder Scaffold-Script? | Manuell vs. `npm run new-presentation <name>` | Scaffold-Script sobald 2. Präsentation nötig |
