# Typst Linux Setup

## Was ist Typst?

Typst ist ein modernes Markup-basiertes Textsatzsystem, das als Alternative zu LaTeX entwickelt wurde. Es kombiniert die Leistungsfähigkeit von LaTeX mit einer einfacheren Syntax und schnellerer Kompilierung. Typst eignet sich besonders für:

- Wissenschaftliche Arbeiten und Dokumentationen
- Bücher und längere Texte
- Präsentationen
- Technische Dokumentation

## Installation

```bash
# Alle Skripte ausführbar machen
chmod +x *.sh

# Typst installieren (unterstützt apt, pacman, dnf)
./install-typst.sh
```

## Verfügbare Skripte

### 1. `install-typst.sh`
**Zweck:** Installiert Typst automatisch für verschiedene Linux-Distributionen
- Erkennt automatisch den Paketmanager (apt, pacman, dnf)
- Installiert die neueste verfügbare Typst-Version
- Zeigt Fehlermeldungen bei nicht unterstützten Systemen

### 2. `typst-template.sh`
**Zweck:** Erstellt neue Typst-Projekte basierend auf Vorlagen
- Zeigt verfügbare Templates aus dem `templates/` Ordner an
- Erstellt automatisch einen neuen Projektordner
- Kopiert Template-Dateien in das neue Projekt
- Bietet automatische Namensgenerierung (Format: `10_YYMMDD_XX`)

### 3. `typst-build.sh`
**Zweck:** Kompiliert Typst-Dateien in verschiedene Ausgabeformate
- Unterstützte Formate: PDF, PNG, SVG, HTML
- Interaktive Format-Auswahl
- Automatische Ordnererstellung für mehrseitige Ausgaben
- Fehlerbehandlung und Statusmeldungen

## Schnellstart

```bash
# 1. Neues Projekt erstellen
./typst-template.sh

# 2. Projekt kompilieren
./typst-build.sh mein-projekt/main.typ

# 3. PDF wird automatisch erstellt
```

## Ordnerstruktur

```
typst-linux-setup/
├── install-typst.sh       # Installation
├── typst-template.sh      # Projekt-Erstellung
├── typst-build.sh         # Kompilierung
├── templates/             # Vorlagen
│   └── book.typ
└── README.md             # Diese Datei
```

## Systemanforderungen

- Linux-Distribution mit apt, pacman oder dnf
- Bash-Shell
- Internetverbindung für Installation