\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{HSZG-Protokoll}
\LoadClass[a4paper,fleqn,11pt]{article}

\setlength{\headheight}{23pt}
\RequirePackage{keyval}
\RequirePackage[a4paper, left=2.5cm, right=2.5cm]{geometry}
\RequirePackage[utf8]{inputenc}
%\RequirePackage[T1]{fontenc}
\RequirePackage[ngerman]{babel}
\RequirePackage{grffile}
\RequirePackage{eurosym}
\RequirePackage{graphicx} 
\RequirePackage{amsmath, amsthm, amssymb}
\RequirePackage[separate-uncertainty]{siunitx}
\RequirePackage{ifthen}
\RequirePackage{fancyhdr}
\pagestyle{fancy}

\RequirePackage[justification=centering,labelfont=bf]{caption}
\RequirePackage[bottom]{footmisc}
\RequirePackage{todonotes}
\presetkeys{todonotes}{inline}{}

\RequirePackage{tikz}
\RequirePackage{gnuplot-lua-tikz}
\RequirePackage{circuitikz}
\usetikzlibrary{calc}
\RequirePackage{lastpage}
\RequirePackage{xspace}	
\RequirePackage[skip=10pt plus1pt, indent=10pt]{parskip}
\RequirePackage{makecell}
\RequirePackage{csvsimple}
\RequirePackage{siunitx}
\RequirePackage{svg}
\RequirePackage{sectsty}
\allsectionsfont{\sffamily}

\RequirePackage{csquotes}
\RequirePackage{multicol}
\RequirePackage{setspace}

\RequirePackage{enumitem}
\setitemize{itemsep=-5pt}
\setenumerate{itemsep=-5pt}
\setlength{\mathindent}{10pt}

%  Mathematik
\RequirePackage{amsmath}								%  Mathematikpaket
\allowdisplaybreaks									    %  Formeln können auf mehrere Seiten verteilt werden
\RequirePackage{amssymb}								%  spezielle Mathmematiksymbole
\RequirePackage{siunitx}								%  korrektes Darstellen von Einheiten
\sisetup{locale = DE}

\RequirePackage[final]{pdfpages}							% zum einbinden von externen pdf-Seiten
\RequirePackage{graphicx}								%  zum Einbinden von Grafiken, spziell für dvi->ps Konvertierung
\setlength{\unitlength}{1mm}
\RequirePackage[hidelinks]{hyperref}	
\RequirePackage{placeins}								% FloatBarrier
\RequirePackage{upgreek}
\RequirePackage{tabularx}								% schöne tabellen
\RequirePackage{longtable}  								% lange tabellen
%\RequirePackage[osf,sc]{mathpazo}						% Schriftart	
\RequirePackage{booktabs}								% linien in der tabelle
\RequirePackage{nicefrac}								% brüche in zeilen

\RequirePackage{array}
\newcolumntype{C}{>{\centering\arraybackslash}X}


\RequirePackage{abk}

\newcommand\tab[1][0.5cm]{\hspace*{#1}}

%\AtEndPreamble{
    \RequirePackage[					                % Literaturverzeichnis mit "biber [Projektname ohne Endung]" aktualisieren
        backend=biber,
        style=ieee,
    ]{biblatex}                                         % Bibliography management
    \addbibresource{references.bib}                     % Bibliography file
%}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%% VARIABLEN FÜR VORLAGE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{expl3}
\ExplSyntaxOn

\tl_new:N \l_titlelecture_tl
\tl_new:N \l_titlelab_tl
\tl_new:N \l_namelabengineer_tl
\tl_new:N \l_datelab_tl
\tl_new:N \l_datereport_tl
\tl_new:N \l_studyregister_tl
\tl_new:N \l_labgroup_tl
\tl_new:N \l_labgroupnames_tl

% Define a new key-value family
\keys_define:nn { titlepage }
    {
        titlelecture    .tl_set:N = \l_titlelecture_tl,
        titlelecture    .initial:n = {Titel~der~Lehrveranstaltung},

        titlelab        .tl_set:N = \l_titlelab_tl,
        titlelab        .initial:n = {Versuchsname},

        namelabengineer .tl_set:N = \l_namelabengineer_tl,
        namelabengineer .initial:n = {Schreiter},

        datelab         .tl_set:N = \l_datelab_tl,
        datelab         .initial:n = {Versuchsdatum},

        datereport      .tl_set:N = \l_datereport_tl,
        datereport      .initial:n = {Protokolldatum},

        studyregister   .tl_set:N = \l_studyregister_tl,
        studyregister   .initial:n = {Matrikel},

        labgroup        .tl_set:N = \l_labgroup_tl,
        labgroup        .initial:n = {Gruppennummer},

        labgroupnames   .tl_set:N = \l_labgroupnames_tl,
        labgroupnames   .initial:n = {Namen\\der\\Beteiligten}
    }

% Command to use the keys
\NewDocumentCommand{\SetupTitlePage}{m}{
    \keys_set:nn {titlepage}{#1}
}

\NewDocumentCommand{\titlelecture}{}{\tl_use:N \l_titlelecture_tl}
\NewDocumentCommand{\titlelab}{}{\str_use:N \l_titlelab_tl}
\NewDocumentCommand{\namelabengineer}{}{\str_use:N \l_namelabengineer_tl}
\NewDocumentCommand{\datelab}{}{\str_use:N \l_datelab_tl}
\NewDocumentCommand{\datereport}{}{\str_use:N \l_datereport_tl}
\NewDocumentCommand{\studyregister}{}{\str_use:N \l_studyregister_tl}
\NewDocumentCommand{\labgroup}{}{\str_use:N \l_labgroup_tl}
\NewDocumentCommand{\labgroupnames}{}{\str_use:N \l_labgroupnames_tl}


\tl_new:N \l_hszg_tl
\tl_set:Nn \l_hszg_tl {assets/images/HSZG.svg}
\cs_new_protected:Npn \FileHszgTest
    {
        \bool_if:nTF
            { \file_if_exist_p:V \l_hszg_tl }
            { \includesvg[height=1.5cm]{\tl_use:N \l_hszg_tl} }
            { \todo[color=red]{Logo\ \texttt{HSZG.svg}\ fehlt!}}
    } 

\tl_new:N \l_fei_tl
\tl_set:Nn \l_fei_tl {assets/images/f-ei.png}
\cs_new_protected:Npn \FileFEITest
    {
        \bool_if:nTF
            { \file_if_exist_p:V \l_fei_tl }
            { \includegraphics[height=1.4cm]{\tl_use:N \l_fei_tl}}
            { \todo[color=red]{Logo\ \texttt{f-ei.png}\ fehlt!}}
    } 


\ExplSyntaxOff
    
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\lhead{\footnotesize Versuch: \titlelab} 
\chead{} 
\rhead{} 

\lfoot{\footnotesize\labgroup} \cfoot{} \rfoot{\footnotesize Seite \thepage\ von \pageref{LastPage}} 
\renewcommand{\headrulewidth}{0.4pt}
\renewcommand{\footrulewidth}{0.4pt}
\addto\captionsngerman{\renewcommand{\figurename}{Abb.}}
\addto\captionsngerman{\renewcommand{\tablename}{Tab.}}
%\captionsetup{justification = raggedright}

\AddToHook{begindocument/end}{
    \begin{titlepage}
        \newgeometry{left=2.5cm, right=2.5cm,top=1cm,bottom=0.1cm}

        \begin{tikzpicture}[remember picture, overlay]
            \draw[line width = 1pt] ($(current page.north west) + (20mm,-15mm)$) rectangle ($(current page.south east) + (-20mm,15mm)$);
            \draw[line width = 1pt] ($(current page.north west)+ (20mm,-36mm)$) -- ($(current page.north west)+ (190mm,-36mm)$);
        \end{tikzpicture}

        \begin{center}

            % Upper part of the page
            \begin{minipage}[t][2cm]{\textwidth}
                \begin{minipage}[b][1.5cm]{0.33\textwidth}
                    \FileHszgTest
                \end{minipage}
                \hfill
                \begin{minipage}[b][1.5cm][c]{0.55\textwidth}
                    \vspace*{\fill}
                    \centering
                    \textbf{\large Fakultät\\ Elektrotechnik / Informatik}\\
                    Fachbereich Elektrotechnik
                    \vspace*{\fill}
                \end{minipage}
                \begin{minipage}[b][1.5cm]{0.1\textwidth}
                    \FileFEITest
                \end{minipage}
            \end{minipage}
            %\newline

            \begin{minipage}[t][3cm]{\textwidth}
            \end{minipage}
            %\newline

            \begin{minipage}[t][4cm]{\textwidth}
                \textbf{Titel des Praktikums:}
                \vspace*{\fill}
                \begin{center}
                    \Large \titlelab
                \end{center}
                \vspace*{\fill}
            \end{minipage}
            %\newline

            \begin{minipage}[t][3.5cm]{\textwidth}
            \end{minipage}
            %\newline

            \begin{minipage}[t][3cm]{\textwidth}
                \textbf{Zugeordnete Lehrveranstaltung:}
                \vspace*{\fill}
                \begin{center}
                    \Large \titlelecture
                \end{center}
                \vspace*{\fill}
            \end{minipage}
            %\newline

            \begin{minipage}[t][3cm]{\textwidth}
            \end{minipage}
            %\newline

            \begin{minipage}[t][0.5cm]{\textwidth}
                \begin{minipage}[t][0.5cm]{0.25\textwidth}
                    \textbf{Laboringenieur:}
                \end{minipage}
                \begin{minipage}[t][0.5cm]{0.4\textwidth}
                    \namelabengineer
                \end{minipage}
                \begin{minipage}[t][0.5cm]{0.1\textwidth}
                \end{minipage}
                \begin{minipage}[t][0.5cm]{0.2\textwidth}

                \end{minipage}
            \end{minipage}
            %\newline

            \begin{minipage}[t][0.5cm]{\textwidth}
                \begin{minipage}[t][0.5cm]{0.25\textwidth}
                    \textbf{Praktikum am:}
                \end{minipage}
                \begin{minipage}[t][0.5cm]{0.25\textwidth}
                    \datelab
                \end{minipage}
                \begin{minipage}[t][0.5cm]{0.25\textwidth}
                    \textbf{Protokolldatum:}
                \end{minipage}
                \begin{minipage}[t][0.5cm]{0.2\textwidth}
                    \datereport
                \end{minipage}
            \end{minipage}
            %\newline

            \begin{minipage}[t][0.5cm]{\textwidth}
                \begin{minipage}[t][0.5cm]{0.25\textwidth}
                    \textbf{Matrikel:}
                \end{minipage}
                \begin{minipage}[t][0.5cm]{0.25\textwidth}
                    \studyregister
                \end{minipage}
                \begin{minipage}[t][0.5cm]{0.25\textwidth}
                    \textbf{Praktikumsgruppe:}
                \end{minipage}
                \begin{minipage}[t][0.5cm]{0.2\textwidth}
                    \labgroup
                \end{minipage}
            \end{minipage}
            %\newline

            \begin{minipage}[t][2.5cm]{\textwidth}
    %			\begin{minipage}[t][0.5cm]{0.25\textwidth}
    %				\textbf{Protokoll erstellt von:}
    %
    %			\end{minipage}
    %			\begin{minipage}[t][0.5cm]{0.25\textwidth}
    %				\nameprotocol
    %
    %			\end{minipage}
                \begin{minipage}[t][0.5cm]{0.25\textwidth}
                    \textbf{Teilnehmer:}
                \end{minipage}
                \begin{minipage}[t][0.5cm]{0.25\textwidth}
                    \labgroupnames
                \end{minipage}
            \end{minipage}

        \end{center}

    \end{titlepage}

    \renewcommand{\baselinestretch}{1.5} 
    \newgeometry{left=2.5cm, right=2.5cm,top=2.5cm,bottom=2.5cm}
}