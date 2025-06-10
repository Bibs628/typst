//Bitte erstelle basierend auf dieser Vorlage ein Setup welches für ein Buch optimiert ist, mit Seitenzahlen und entsprechend Kopf & Fußzeile:

#let title = "Mein Titel"
#let subtitle = "Ein Untertitel"
#let author = "Max Mustermann"
#let date = "2025-06-10"
#let subject = "Fachgebiet"
#let keywords = ["Typst", "Metadaten", "Beispiel"]
#let main-color = rgb("#0e0e0e")
#let text-color = rgb("#ffffff")
#let heading-color = rgb("#3fd84c")

#set page(paper: "presentation-16-9",
          fill: rgb("#0e0e0e"),
          )

#set text(font: "IBM Plex Sans",
          size: 12pt,
          fill: rgb("#ffffff"),
          )

#set figure(placement: none,
            caption: none,
  )


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

= Übersicht

- Punkt 1
- Punkt 2
- Punkt 3

#pagebreak()

= Fazit

Vielen Dank!
