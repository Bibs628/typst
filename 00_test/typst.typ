= Willkommen zu Typst!

Typst ist ein modernes Textsatzsystem, ähnlich wie LaTeX – aber:

- 🧠 einfacher zu lernen  
- ⚡ schneller zu kompilieren  
- 🧩 mit integrierten Layoutfunktionen

== Textformatierung

Stark *fett*, _kursiv_, `Code`, und auch [Webseite](https://typst.app).

== Mathematik

$E = m c^2$

Inline: $a^2 + b^2 = c^2$

Block:

$ A = pi r^2 $
$ "area" = pi dot "radius"^2 $
$ cal(A) :=
    { x in RR | x "is natural" } $
#let x = 5
$ #x < 17 $


== Listen

- Bullet Punkt 1  
- Bullet Punkt 2

1. Nummeriert  
2. Auch möglich

== Tabelle

| Sprache | Typ      | Lizenz      |
|---------|----------|-------------|
| Typst   | statisch | Open Source |
| LaTeX   | statisch | Open Source |

== Bild (falls du eins einfügst)

#image("Glitched_Cube.png", width: 50%)

== Fußnoten

Ein Beispiel mit Fußnote.[^1]

[^1]: So sehen Fußnoten aus.

== Fertig!

Jetzt kannst du mit `typst compile beispiel.typ` oder `./typst-build.sh beispiel.typ` dein PDF erzeugen.
