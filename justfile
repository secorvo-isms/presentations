# Präsentations-Repository – lokale Befehle
# Voraussetzung: just (https://github.com/casey/just), Node.js >= 20 (via nvm)

set shell := ["bash", "-c"]

# nvm laden und Node-Version aus .nvmrc aktivieren
export NVM_DIR := env_var_or_default("NVM_DIR", env_var("HOME") + "/.nvm")
nvm_init := '. "$NVM_DIR/nvm.sh" && nvm use --silent'

# Standardpräsentation
default_presentation := "secit26-riskmythen"

# Alle benötigten Tools einrichten (einmalig nach dem Klonen)
setup:
    #!/usr/bin/env bash
    set -euo pipefail

    # nvm prüfen
    if [ ! -f "$NVM_DIR/nvm.sh" ]; then
        echo "✗ nvm nicht gefunden. Installation: https://github.com/nvm-sh/nvm#install--update-script"
        exit 1
    fi
    . "$NVM_DIR/nvm.sh"

    # Node-Version aus .nvmrc installieren und aktivieren
    echo "▶ Node-Version aus .nvmrc installieren..."
    nvm install
    nvm use

    # qrcode CLI global installieren (für QR-Code-Generierung)
    echo "▶ qrcode CLI installieren..."
    npm install -g qrcode

    # Abhängigkeiten aller Präsentationen installieren
    echo "▶ Abhängigkeiten installieren..."
    just install-all

    echo "✓ Setup abgeschlossen. Weiter mit: just dev"

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
