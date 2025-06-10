// ============================
// Vollständiges Typst-Template
// ============================

// Metadaten
#let title = "Mein Titel"
#let subtitle = "Ein Untertitel"
#let author = "Max Mustermann"
#let date = "2025-06-10"
#let subject = "Fachgebiet"
#let keywords = ["Typst", "Metadaten", "Beispiel"]

#set text(font: "IBM Plex Sans")



// Dokumentformat
#set page(width: 21cm, height: 29.7cm, margin: 2.5cm)

#align(center)[
    #v(1cm)
      #text(size: 20pt)[#title]#linebreak()
      #text(size: 16pt)[#subtitle]

    #v(1.5cm)
      #text(size: 14pt)[#subject]#linebreak()
      #text(size: 12pt)[Schlagwörter:#linebreak() #(keywords)

    #v(2cm)
      #text(size: 12pt)[Autor: #author]#linebreak()
      #text(size: 12pt)[Datum: #date]
          ]
    ]

#pagebreak()

// Inhaltsverzeichnis
#pagebreak()
#outline()
#pagebreak()

// ----------------------------
// 1. Überschriften & Fließtext
// ----------------------------

= Kapitel 1: Einführung
== Unterkapitel 1.1: Zielsetzung
Dies ist ein Fließtext. Er besteht aus mehreren Sätzen.  

== Unterkapitel 1.2: Absatzbildung
Dies ist ein erster Absatz.

Dies ist ein zweiter Absatz nach einer Leerzeile.

// ----------------------------
// 2. Textausrichtung
// ----------------------------

#align(left)[Dies ist linksbündiger Text.]
#align(center)[Dies ist zentrierter Text.]
#align(right)[Dies ist rechtsbündiger Text.]


// ----------------------------
// 3. Formatierungen & Farben
// ----------------------------

// ----------------------------
// 3. Formatierungen & Farben
// ----------------------------

= Textformatierung & Schriftgestaltung

// **Einfaches Textstyling**
*Fetter Text*, _Kursiver Text_, `Monospace`, ~Durchgestrichen~, ^Hochgestellt^, ~Tiefgestellt~

// **Farbe und Hervorhebung**
#text(blue)[Blauer Text], #text(red)[Roter Text], #text(rgb(0, 128, 0))[Grüner RGB-Text]
#text(fill: cmyk(0%, 1%, 0%, 0%))[Magenta in CMYK]
#highlight[Standard-Highlight], #highlight(fill: yellow)[Gelb hervorgehoben]
#box(fill: yellow)[Gelber Hintergrund mit Text], #box(stroke: red)[Umrandeter Textkasten]

// **Schriftarten und Größen**
#text(font: "IBM Plex sans")[Andere Schriftart]
#text(size: 14pt)[Größerer Text], #text(size: 9pt)[Kleinerer Text]
#text(font: "Linux Libertine")[Serifenschrift]
#text(font: "Fira Code")[Monospace-Schrift]

// **Zeilen- und Zeichenabstände**
#text(spacing: 150%)[Erhöhter Zeilenabstand]
#text(tracking: 0.2em)[Mehr Zeichenabstand]

// **Ligaturen & Schriftfeatures**
#text(ligatures: true)[ff fi fl ffi]
#text(ligatures: false)[ff fi fl ffi ohne Ligaturen]

// **Textausrichtung**
#align(left)[Linksbündig]
#align(center)[Zentriert]
#align(right)[Rechtsbündig]

// **Zeilenumbrüche & harte Umbrüche**
Dies ist Text mit \
manuellem Zeilenumbruch (Backslash).
Dies ist Text mit einem `\n` in einem String: #"Zeile 1\nZeile 2"

// **Mehrzeiliger Text in Boxen**
#box(inset: 8pt, fill: gray)[
  *Titel*  
  Mehrzeiliger Text  
  in einem Kasten
]
#v(2cm)
// **Textrotation**
#rotate(45deg)[45° gedrehter Text]
#v(2cm)
// **Horizontale Skalierung und Spationierung**
#text(stretch: 120%)[Gestreckter Text], #text(tracking: 0.3em)[Mit Spationierung]

// **Silbentrennung kontrollieren**
Langwort-ohne-Trennung  
Lang\-wort\-mit\-Tren\-nung

// **Unicode und Sonderzeichen**
© → ⇒ √ ∞ — – „Anführungszeichen“ ‘Einfach’

// **Inline-Formeln und Text**
Text mit eingebetteter Formel: $E = m c^2$


// ----------------------------
// 4. Listen
// ----------------------------
= Listen & Aufzählungen
== Ungeordnete Liste
- Punkt A
- Punkt B
  - Unterpunkt B.1

== Geordnete Liste
1. Schritt eins
2. Schritt zwei

// ----------------------------
// 5. Tabellen
// ----------------------------
= Tabellen
== Einfache Tabelle
#table(
  columns: 3,
  [*Spalte 1*, *Spalte 2*, *Spalte 3*],
  ["A", "B", "C"],
  ["1", "2", "3"]
) <table1>

== Tabelle mit Bild & Liste
#table(
  columns: 2,
  [*Bild*, *Liste*],
  [image("Glitched_Cube.png", width: 50%), [
    - Alpha
    - Beta
  ]]
)

// ----------------------------
// 6. Code
// ----------------------------SSSS
= Code
== Beispielcode in Python
```python
for i in range(5):
    print("Hallo Welt", i)
```

// ----------------------------
// 7. Diagramm (Graph)
// ----------------------------
= Diagramm
#grid(
  fill: (x, y) => rgb(
    if calc.odd(x + y) { "7F8396" }
    else { "EFF0F3" }
  ),
  columns: (1em,) * 8,
  rows: 1em,
  align: center + horizon,

  [♖], [♘], [♗], [♕], [♔], [♗], [♘], [♖],
  [♙], [♙], [♙], [♙], [],  [♙], [♙], [♙],
  grid.cell(
    x: 4, y: 3,
    stroke: blue.transparentize(60%)
  )[♙],

  ..(grid.cell(y: 6)[♟],) * 8,
  ..([♜], [♞], [♝], [♛], [♚], [♝], [♞], [♜])
    .map(grid.cell.with(y: 7)),
)


// ----------------------------
// 8. Bilder & PDFs
// ----------------------------
= Bilder & PDFs
== Bilder
#figure(image("Glitched_Cube.png", width: 50%), caption: [Beispielbild (PNG)])
#figure(image("Glitched_Cube.svg", width: 50%), caption: [Beispielbild (SVG)])

== PDF-Seite einbinden
#pdf.embed(
  "Glitched_Cube.pdf",
  relationship: "supplement",
)

// ----------------------------
// 9. Kommentare (nicht sichtbar)
// ----------------------------

// Das ist ein interner Kommentar

// ----------------------------
// 10. Zitate & Literatur
// ----------------------------
= zitate & Literatur
== Zitat
> "Wissen ist Macht." – Francis Bacon

== Link & Verweis
Mehr Informationen unter: https://typst.app

== Verweis innerhalb des Dokuments
[siehe Tabelle oben](table1)

== Literaturverzeichnis
#bibliography("bibliography.bib")

// ----------------------------
// 11. Glossar (manuell)
// ----------------------------

= Glossar
- *Typst*: Ein modernes Typesetting-System.
- *Markdown*: Leichtgewichts-Auszeichnungssprache.

// Ende des Templates