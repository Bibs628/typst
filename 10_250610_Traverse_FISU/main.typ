//Bitte erstelle basierend auf dieser Vorlage ein Setup welches für ein Buch optimiert ist, mit Seitenzahlen und entsprechend Kopf & Fußzeile:

#let title = "Traversenaufbau FISU / H1.01"
#let subtitle = "Eine kurze Erklärung wie das funktioniert"
#let author = "Nils Hack"
#let date = "2025-06-10"
#let subject = "Traverse, Veranstaltungstechnilik"
#let keywords = ["Typst", "Traverse", "Veranstaltungstechnik, "Messe", "FISU", "H1.01"]

#set text(font: "IBM Plex Sans")



// Dokumentformat
#set page(width: 21cm, height: 29.7cm, margin: 2.5cm)

#align(center)[
    #v(1cm)
      #text(size: 20pt)[#title]#linebreak()
      #text(size: 16pt)[#subtitle]

    #v(1.5cm)
      #text(size: 14pt)[#subject]#linebreak()
      #text(size: 12pt)[Schlagwörter:#linebreak() #(keywords)]

    #v(2cm)
      #text(size: 12pt)[Autor: #author]#linebreak()
      #text(size: 12pt)[Datum: #date]
              ]

#pagebreak()


