# Präsentations-Repository – lokale Befehle
# Voraussetzung: just (https://github.com/casey/just), Node.js >= 20 (via nvm)

set shell := ["bash", "-c"]

# nvm laden und Node-Version aus .nvmrc aktivieren
export NVM_DIR := env_var_or_default("NVM_DIR", env_var("HOME") + "/.nvm")
nvm_init := '. "$NVM_DIR/nvm.sh" && nvm use --silent'

# Standardpräsentation
default_presentation := "secit26-riskmythen"

# Dev-Server für eine Präsentation starten
# Verwendung: just dev [name]
dev name=default_presentation:
    {{nvm_init}} && cd presentations/{{name}} && npm install && npm run dev

# Eine Präsentation bauen
# Verwendung: just build [name]
build name=default_presentation:
    {{nvm_init}} && cd presentations/{{name}} && npm install && \
    npx slidev build slides.md \
        --base /presentations/{{name}}/ \
        --out ../../dist/presentations/{{name}}

# Alle Präsentationen bauen
build-all:
    #!/usr/bin/env bash
    set -euo pipefail
    . "$NVM_DIR/nvm.sh" && nvm use --silent
    for dir in presentations/*/; do
        name=$(basename "$dir")
        echo "▶ Building $name..."
        just build "$name"
    done

# dist/index.html generieren
index:
    {{nvm_init}} && node scripts/generate-index.js

# Vollständigen Build inkl. Index ausführen
release: build-all index

# Als PDF exportieren
# Verwendung: just export [name]
export name=default_presentation:
    {{nvm_init}} && cd presentations/{{name}} && npm install && npm run export:pdf

# Abhängigkeiten einer Präsentation installieren
# Verwendung: just install [name]
install name=default_presentation:
    {{nvm_init}} && cd presentations/{{name}} && npm install

# Alle Abhängigkeiten installieren
install-all:
    #!/usr/bin/env bash
    set -euo pipefail
    . "$NVM_DIR/nvm.sh" && nvm use --silent
    for dir in presentations/*/; do
        name=$(basename "$dir")
        echo "▶ Installing $name..."
        just install "$name"
    done
