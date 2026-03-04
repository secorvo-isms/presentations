# Präsentations-Repository

Modulares Repository für [Slidev](https://sli.dev)-Präsentationen. Präsentationen werden aus einem gemeinsamen Modul-Fundus zusammengestellt und per GitHub Actions auf GitHub Pages veröffentlicht.

---

## Struktur

```
presentations/
├── modules/                       # Gemeinsamer Modul-Fundus
│   └── <thema>/                   # z. B. risk/
│       └── <untertyp>/            # z. B. myth/ oder fail/
│           └── <slug>.md          # Eine thematische Einheit = eine Datei
├── public/                        # Statische Assets
│   └── assets/
│       └── <thema>/<untertyp>/    # Spiegelt modules/-Struktur
├── components/                    # Gemeinsame Vue-Komponenten
├── layouts/                       # Gemeinsame Slidev-Layouts
├── presentations/                 # Einzelne Präsentationen
│   └── <name>/
│       ├── package.json           # Slidev-Abhängigkeiten
│       └── slides.md              # Einzige Konfigurationsquelle
├── scripts/
│   └── generate-index.js          # Generiert dist/index.html
└── .github/workflows/deploy.yml   # Build + Deploy bei Tags
```

---

## Kernprinzipien

| Prinzip | Bedeutung |
|---|---|
| Konfiguration gehört nach oben | `theme`, `fonts`, `colorSchema` nur in `slides.md` – nie in Modulen |
| 1 thematische Einheit = 1 Datei | Keine Monodateien, 3–5 Folien pro Modul |
| Deklarativer Kontext | `context: talk \| workshop \| both` im Modul-Frontmatter |
| Styling durch Klassen | UnoCSS-Klassen, keine Ad-hoc-Inline-Styles |

---

## Modul-Frontmatter

```yaml
---
layout: myth
moduleType: myth      # 'myth' | 'fail' | 'intro' | 'takeaway'
moduleNo: 1
moduleTitle: "Patchen kann warten"
context: talk         # 'talk' | 'workshop' | 'both'
transition: fade
---
```

---

## Neue Präsentation anlegen

1. Verzeichnis unter `presentations/<name>/` anlegen
2. `slides.md` mit globalem Frontmatter (theme, fonts usw.) erstellen
3. `package.json` anlegen (Slidev als Dependency)
4. Module via `src:` einbinden:

```markdown
---
src: ../../modules/risk/myth/patching.md
---
```

Slidev löst `src:`-Pfade relativ zur `slides.md` auf – funktioniert auch über Verzeichnisgrenzen.

5. In `package.json` (Root) Workspace ergänzen:

```json
"workspaces": ["presentations/*"]
```

---

## Neues Modul anlegen

1. Datei in `modules/<thema>/<untertyp>/<slug>.md` anlegen
2. Frontmatter mit Pflichtfeldern befüllen (s. o.)
3. In der gewünschten `slides.md` einbinden
4. Zugehörige Assets unter `public/assets/<thema>/<untertyp>/` ablegen

---

## Lokale Entwicklung

Voraussetzung: [just](https://github.com/casey/just) und Node.js ≥ 18

```bash
just dev secit26-riskmythen     # Dev-Server für eine Präsentation
just build secit26-riskmythen   # Einzel-Build
just build-all                  # Alle Präsentationen bauen
just index                      # dist/index.html generieren
```

Ohne `just`:

```bash
cd presentations/secit26-riskmythen
npm install
npm run dev
```

---

## Deployment

Deployment erfolgt automatisch beim Pushen eines Tags:

```bash
git tag v1.0.0
git push origin v1.0.0
```

GitHub Actions baut alle Präsentationen und veröffentlicht das Ergebnis auf GitHub Pages unter:

```
https://<org>.github.io/presentations/
└── /presentations/<name>/   # Einzelne Präsentation
```

Der Hauptindex (`/`) listet alle verfügbaren Präsentationen mit Links.

---

## Asset-Konventionen

- Alle Assets unter `public/assets/<thema>/<untertyp>/`
- Referenzierung in Modulen als absolute URL: `/assets/risk/myth/bild.png`
- Vite-Bundle-Assets (Bildoptimierung etc.) nur wenn explizit nötig und dokumentiert
