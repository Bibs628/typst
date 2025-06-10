#!/bin/bash

TEMPLATE_DIR="templates"

# Schritt 1: Templates auslesen (Dateien + Ordner)
TEMPLATES=()
LABELS=()

for entry in "$TEMPLATE_DIR"/*; do
    if [[ -f "$entry" && "$entry" == *.typ ]]; then
        TEMPLATES+=("$entry")
        LABELS+=("$(basename "$entry" .typ)")
    elif [[ -d "$entry" && -f "$entry/main.typ" ]]; then
        TEMPLATES+=("$entry")
        LABELS+=("$(basename "$entry")")
    fi
done

if [ ${#TEMPLATES[@]} -eq 0 ]; then
    echo "❌ Keine Templates im Ordner '$TEMPLATE_DIR' gefunden."
    exit 1
fi

# Schritt 2: Auswahl anzeigen
echo "📁 Verfügbare Typst-Templates:"
for i in "${!TEMPLATES[@]}"; do
    echo "$((i+1))) ${LABELS[$i]}"
done

# Schritt 3: Auswahl treffen
read -p "🔢 Bitte Nummer des gewünschten Templates eingeben: " CHOICE
INDEX=$((CHOICE-1))

if [[ -z "${TEMPLATES[$INDEX]}" ]]; then
    echo "❌ Ungültige Auswahl."
    exit 1
fi

TEMPLATE="${TEMPLATES[$INDEX]}"
TEMPLATE_NAME="${LABELS[$INDEX]}"

# Schritt 4: Projektname eingeben oder automatisch generieren
read -p "📝 Wie soll der neue Ordner heißen (z. B. 10_Name)? [leer = automatisch]: " PROJECT_NAME

if [[ -z "$PROJECT_NAME" ]]; then
    DATE=$(date +"%y%m%d")
    BASE_NAME="10_${DATE}"
    COUNT=1
    while true; do
        PROJECT_NAME="${BASE_NAME}_$(printf "%02d" $COUNT)"
        if [ ! -d "$PROJECT_NAME" ]; then
            break
        fi
        ((COUNT++))
    done
    echo "📂 Automatisch erzeugter Ordnername: $PROJECT_NAME"
fi

# Schritt 5: Ordner erstellen
mkdir "$PROJECT_NAME"

# Schritt 6: Datei(en) kopieren
if [[ -d "$TEMPLATE" ]]; then
    echo "📄 Verwende Template-Ordner: $TEMPLATE"
    cp -r "$TEMPLATE/"* "$PROJECT_NAME/"
    echo "✅ Neues Multi-File Typst-Projekt '$PROJECT_NAME' mit Template '$TEMPLATE_NAME' erstellt."
else
    echo "📄 Verwende Template-Datei: $TEMPLATE"
    cat "$TEMPLATE" > "$PROJECT_NAME/main.typ"
    echo "✅ Neues Typst-Projekt '$PROJECT_NAME' mit Template '$TEMPLATE_NAME' erstellt."
    echo "📄 Datei: $PROJECT_NAME/main.typ"
fi


# Optional: Öffnen mit Editor (Standard = Nein)
read -p "🖊 Projekt jetzt in nano öffnen? (j/N): " OPEN
if [[ "$OPEN" =~ ^[jJ]$ ]]; then
    nano "$PROJECT_NAME/main.typ"
fi

