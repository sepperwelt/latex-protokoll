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
| `labgroup`     | Nummer der Praktikumsgruppe[^1] | `{}` |
| `labgroupnames`| Namen der Teilnehmenden [^2]    | `{}` |
| `bibstyle`     | Zitationsstil [^3]          | `num`, `alph` |
| `sffont`       | serifenlose Schriftart      | -- |
| `labfem`       | weibliche Laboringeneurin   | -- |

[^1]: Für den Schlüssel `labgroup` muss nur eine Zahl angegeben werden, das Wort "Gruppe" wird automatisch davor gesetzt.
[^2]: Der Schlüssel nimmt eine Liste von Namen, getrennt durch `\\`.
[^3]: Der Zitationsstil `num` setzt die `biblatex`-Option `style=ieee`.

> [!NOTE]
> Wird ein Schlüssel nicht angegeben, wird der Text im Dokument rot dargestellt und eine Fehlermeldung ausgegeben.

## Bereitgestellte Befehle


## Verbesserung
Sehr gern können Verbesserungsvorschläge als Issue eingereicht werden.

## License
MIT License

## Contact
Email: example@domain.com