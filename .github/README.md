# Vorlage für Protokolle der Fakultät EI an der Hochschule Zittau/Görlitz
Dieses Repository beinhaltet in erster Linie eine neue Klasse `HSZG-Protokoll`, das bequem ein Titelblatt für Protokolle der Fakultät EI an der Hochschule Zittau/Görlitz erstellt. Bereitgestellt wird die Klassendefinition samt Logo-Dateien der HSZG sowie ein Beispieldokument mit nützlichen Formatierungen und Code-Beispielen.

Die Klasse stellt ferner auch nützliche Befehle zur Verfügung, um das genaue Zeichensetzen zu beschleunigen.

## Verwendung
1. Repository clonen
2. Dokument mit der Klasse `HSZG-Protokoll` erstellen. Dafür kann die Datei `Protokoll.tex` genutzt werden.
3. Externe Quellen in `./assets` ablegen.
4. Bei Bedarf den Inhalt des Dokuments aufteilen. (Im Beispieldokument in `content.tex` ausgelagert.)

## Setup des Dokuments
Um das Dokument einzurichten, steht der Befehl `\SetupTitlePage` zur Verfügung. Der Befehl nimmt folgende Arbumente:

| Schlüssel      | Verwendung                  | Wert |
|----------------|-----------------------------|------|
| `titlelecture` | Titel der Lehrveranstaltung | `{}` |
| `titlelab`     | Titel des Versuchs          | `{}` |
| `namelabengineer` | Name des Laboringenieurs | `{}` |
| `datelab`      | Datum des Versuchs          | `{}` |
| `datereport`   | Datum des Protokolls        | `{}`, `\today` |
| `labgroup`     | Nummer der Praktikumsgruppe [^1] | `{}` |
| `labgroupnames`| Namen der Teilnehmenden [^2]    | `{}` |
| `bibstyle`     | Zitationsstil [^3]          | `num`, `alph` |
| `sffont`       | serifenlose Schriftart      | -- |
| `labfem`       | weibliche Laboringeneurin   | -- |

[^1]: Für den Schlüssel `labgroup` muss nur eine Zahl angegeben werden, das Wort "Gruppe" wird automatisch davor gesetzt.
[^2]: Der Schlüssel nimmt eine Liste von Namen, getrennt durch `\\`.
[^3]: Der Zitationsstil `num` setzt die `biblatex`-Option `style=ieee`.

> [!NOTE]
> Wird ein Schlüssel nicht angegeben, wird der Text im Dokument rot dargestellt und eine Fehlermeldung ausgegeben.

> [!NOTE]
> Wird die Datei `references.bib` nicht gefunden, wird `biblatex` nicht geladen und kein Literaturverzeichnis erstellt.

## Bereitgestellte Befehle
### Abtürzungen
Die folgenden Befehle stellen gängige Abkürzungen mit korrektem Abstand zur Verfügung:
| Befehl    | Darstellung |
|-----------|-------------|
| `\zb` | z. B. |
| `\ua` | u. a. |
| `\ie` | d. h. |
| `\og` | o. g. |
| `\oa` | o. a. |

### Mathematische Befehle

| Befehl    | Darstellung | Verwendung |
|-----------|-------------|------------|
| `\mv{}` | $\boldsymbol{N}$            | fette Zeichen für Matrizen, Vektoren und dgl.           |
| `\kmv{}`    | $\underline{\boldsymbol{N}}$ | fette unterstrichene Zeichen für komplexe Größen |
| `\trans{}` | $\boldsymbol{A}^{\mathrm{T}}$ | Transponierte einer Matrix |
| `\herm{}` | $\boldsymbol{B}^{\mathrm{H}}$ | Transponierte einer konjugiert komplexen Matrix |
| `\rg{}` | $\mathrm{rg}\left(C\right)$ | Rang einer Matrix |
| `\re{}` | $\mathrm{Re}\{U\right\}$ | Realteil |
| `\im{}` | $\mathrm{Im}\{S\} $ | Imaginärteil |
| `\K{}`  | $\underline{I}$ | Komplexe Größe |
| `\corsp`| $\stackrel{\scriptscriptstyle \bigtriangleup}{=}$ | "entspricht"-Zeichen|
| `\ident`| $\mv{I}$ | Einheitsmatrix |
| `\const` | $\mathrm{const.}$ | Konstante |
| `\ii` | $j$ | Imaginäre Einheit |
| `\jw` | $j \, \omega$ | |

<details>
<summary>Liste der eingebundenen Pakete</summary>

| Package | Option |
|---------|--------|
| `article` |       |
| `silence` |       |
| `keyval` |       |
| `geometry` | `a4paper` `left=2.5cm` `right=2.5cm`      |
| `inputenc` | `utf8`      |
| `babel` | `ngerman`      |
| `grffile` |       |
| `eurosym` |       |
| `amsmath` | `\allowdisplaybreaks`      |
| `amsthm` |       |
| `amssymb` |       |
| `siunitx` | `separate-uncertainty` `\sisetup{locale = DE}`     |
| `physics` |       |
| `ifthen` |       |
| `fancyhdr` | `\pagestyle{fancy}`      |
| `subcaption` |       |
| `caption` |  `justification=centering` `labelfont=bf`     |
| `footmisc` | `bottom`      |
| `todonotes` | `\presetkeys{todonotes}{inline}{}`      |
| `tikz` | `\usetikzlibrary{calc}`      |
| `gnuplot-lua-tikz` |       |
| `circuitikz` |       |
| `lastpage` |       |
| `xspace` |       |
| `parskip` | `skip=10pt` `plus1pt` `indent=10pt`      |
| `makecell` |       |
| `csvsimple` |       |
| `svg` |       |
| `sectsty` |       |
| `csquotes` |       |
| `multicol` |       |
| `setspace` |       |
| `enumitem` | 
```
\setitemize{itemsep=-5pt}
\setenumerate{itemsep=-5pt}
\setlength{\mathindent}{10pt}
```
|
| `pdfpages` | `final`      |
| `graphicx` |       |
| `hyperref` |       |
| `article` | `hidelinks`      |
| `placeins` |       |
| `upgreek` |       |
| `tabularx` |       |
| `longtable` |       |
| `booktabs` |       |
| `nicefrac` |       |
| `biblatex` | `backend=biber      |

</details>

## Verbesserung
Sehr gern können Verbesserungsvorschläge als Issue eingereicht werden.

## License
MIT License

## Contact
Email: example@domain.com