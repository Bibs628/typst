#!/bin/bash

if [ $# -eq 0 ]; then
    echo "❌ Bitte gib eine .typ-Datei an, z.B.: ./typst-build.sh beispiel.typ"
    exit 1
fi

INPUT="$1"

if [ ! -f "$INPUT" ]; then
    echo "❌ Datei '$INPUT' nicht gefunden."
    exit 1
fi

# Pfad und Basisname der Eingabedatei
INPUT_DIR=$(dirname "$INPUT")
BASENAME=$(basename "$INPUT" .typ)

# Format-Auswahl
echo "📦 In welches Format soll exportiert werden?"
echo "1) PDF"
echo "2) PNG"
echo "3) SVG"
echo "4) HTML (experimentell)"
read -p "🔢 Bitte Nummer eingeben (1-4): " FORMAT_CHOICE

case "$FORMAT_CHOICE" in
    1)
        EXT="pdf"
        OUTPUT="${INPUT_DIR}/${BASENAME}.${EXT}"
        CMD=(typst compile "$INPUT" "$OUTPUT")
        ;;
    2)
        EXT="png"
        OUTDIR="${INPUT_DIR}/${BASENAME}_png"
        mkdir -p "$OUTDIR"
        OUTPUT="${OUTDIR}/page-{p}.png"
        CMD=(typst compile "$INPUT" "$OUTPUT")
        ;;
    3)
        EXT="svg"
        OUTDIR="${INPUT_DIR}/${BASENAME}_svg"
        mkdir -p "$OUTDIR"
        OUTPUT="${OUTDIR}/page-{p}.svg"
        CMD=(typst compile "$INPUT" "$OUTPUT")
        ;;
    4)
        EXT="html"
        OUTPUT="${INPUT_DIR}/${BASENAME}.${EXT}"
        CMD=(typst compile --features html "$INPUT" "$OUTPUT")
        ;;
    *)
        echo "❌ Ungültige Eingabe. Abbruch."
        exit 1
        ;;
esac

# Prüfen ob typst installiert ist
if ! command -v typst &> /dev/null; then
    echo "❌ Fehler: typst ist nicht installiert."
    echo "Installiere es mit: sudo pacman -S typst"
    exit 1
fi

# Kompilieren
echo "📄 Konvertiere '$INPUT' zu '$OUTPUT'..."
"${CMD[@]}"

# Ergebnis prüfen
if [ $? -eq 0 ]; then
    echo "✅ Erfolgreich: Ausgabe wurde erstellt."
    if [[ "$EXT" == "svg" || "$EXT" == "png" ]]; then
        echo "📁 Dateien gespeichert in: ${OUTDIR}/"
    else
        echo "📄 Datei: $OUTPUT"
    fi
else
    echo "❌ Fehler beim Kompilieren von '$INPUT'."
fi
