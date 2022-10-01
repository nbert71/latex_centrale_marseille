\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{rapportECM}[Modèle pour rapport ECM]

%--------------------------------
%       Classe et packages
%--------------------------------

\LoadClass[a4paper, 12pt]{article}

\RequirePackage[french]{babel} % Langue
\RequirePackage[utf8]{inputenc} % Utilisation des caractères spéciaux UTF8
\RequirePackage[T1]{fontenc}  % Qqles caractères en plus

\RequirePackage{amsmath}  % Ecriture des maths
\RequirePackage{amsfonts} % Fonts spécifiques aux maths
\RequirePackage{amssymb}  % Symboles maths
\RequirePackage{siunitx} % Pour écrire les puissances de 10 et autres

\RequirePackage{graphicx} % Pour insérer des images
\RequirePackage[justification=centering]{caption} % Pour faire des légendes
\RequirePackage{subcaption}
\RequirePackage{float}
\RequirePackage{wallpaper} % Pour insérer une image en background
\RequirePackage{url}
\RequirePackage[dvipsnames]{xcolor}


\RequirePackage{fancyhdr} % Pour le style global du document
\RequirePackage[left=2.5cm,right=2.5cm,top=2cm,bottom=3.5cm]{geometry} % Pour gérer les marges du document

\RequirePackage[sorting=none]{biblatex} % Permet de gérer une bibliographie et de citer des articles
\addbibresource{main.bib}


%--------------------------------
%           Commandes
%--------------------------------

% ---Informations sur le rapport---
\newcommand{\entreprise}[1]{\renewcommand{\entreprise}{#1}}
\newcommand{\logoentreprise}[1]{\renewcommand{\logoentreprise}{#1}}
\newcommand{\titre}[1]{\renewcommand{\titre}{#1}}
\newcommand{\rendu}[1]{\renewcommand{\rendu}{#1}}
\newcommand{\annee}[1]{\renewcommand{\annee}{#1}}
\newcommand{\piedpage}[1]{\renewcommand{\piedpage}{#1}}
\newcommand{\master}[1]{\renewcommand{\master}{#1}}
\newcommand{\filiere}[1]{\renewcommand{\filiere}{#1}}
\newcommand{\eleve}[1]{\renewcommand{\eleve}{#1}}
\newcommand{\PE}[1]{\renewcommand{\PE}{#1}}
\newcommand{\dates}[1]{\renewcommand{\dates}{#1}}
\newcommand{\tuteurecole}[1]{\renewcommand{\tuteurecole}{#1}}
\newcommand{\tuteurentreprise}[1]{\renewcommand{\tuteurentreprise}{#1}}


\newcommand{\fairemarges}{
  \pagestyle{fancy}
  \fancyheadoffset{0.7cm}
  \setlength{\headheight}{1.4cm}
  \lhead{\includegraphics[height=\headheight]{logos/centrale_long.png}} %Affichage de l'image au top de la page
  \rhead{\nouppercase{\leftmark}}
  \cfoot{\thepage}
}

% Permet d'insérer une page blanche
\newcommand{\pageblanche}{
  \pagebreak
  \thispagestyle{empty}
  \null
  \pagebreak
}


% ----------- Styles ----------- %
% Chaque style permet de modifier la partie de l'en-tête afin d'afficher le nom de la section même si celle-ci n'est pas numérotée

\fancypagestyle{document}{
  \rhead{\nouppercase{\leftmark}}
}
\fancypagestyle{remerciements}{
  \rhead[R]{Remerciements}
}
\fancypagestyle{resumeabstract}{
  \rhead[R]{Résumé \& Abstract}
}
\fancypagestyle{introduction}{
  \rhead[R]{Introduction}
}
\fancypagestyle{glossaire}{
  \rhead[R]{Glossaire}
}
\fancypagestyle{biblio}{
  \rhead[R]{Bibliographie}
}
\fancypagestyle{annexes}{
  \rhead[R]{Annexes}
}
% ------------------------------ %

\newcommand{\fairepagedegarde}{
  \begin{titlepage}
    \centering % Pour tout centrer sur la page
    \ThisCenterWallPaper{1}{logos/wallpaper.png} % Affichage du background 

    % Logo Entreprise et ecole
    \begin{figure}
      \begin{subfigure}{0.5\textwidth}
        \centering
        \includegraphics[width=0.7\textwidth]{\logoentreprise}
        \vspace{1cm}
      \end{subfigure}
      \begin{subfigure}{0.5\textwidth}
        \centering
        \includegraphics[width=0.7\textwidth]{logos/centrale.png}
        \vspace{1cm}
      \end{subfigure}
    \end{figure}

    {\scshape \Large École centrale de Marseille \\[6mm] \entreprise \par}
    \vspace{1cm}

    % Titre du rapport
    \rule{\linewidth}{0.2 mm} \\[0.4 cm]
    {\huge\bfseries \titre \par} \
    \rule{\linewidth}{0.2 mm} \\[1.0 cm]

    % Nom de l'étudiant
    {\scshape\LARGE \eleve \par}
    \vspace{3mm}
    (\footnotesize Promo entrante : \PE) 
    \vspace{1cm}

    % Parcours de l'étudiant
    {\large \rendu\; - \;\annee \\
    \filiere \\
    \master \par}
    \vspace{1cm}

    % Dates
    {\large \dates \par} 

    \vspace{4cm}
    
    % Représentants de l'étudiant
    \begin{minipage}{0.5\textwidth}
      \begin{flushleft} 
      \emph{\textbf{Tuteur(s) école :}}\\
        \tuteurecole
      \end{flushleft}
    \end{minipage}
    ~
    \begin{minipage}{0.4\textwidth}
      \begin{flushright} 
      \emph{\textbf{Tuteur(s) entreprise :}}\\
        \tuteurentreprise
      \end{flushright}
    \end{minipage}

    \vfill

  \end{titlepage}
  \newpage
}

% Affiche la table des matières
\newcommand{\tabledesmatieres}{
  \tableofcontents
  \newpage
}

% Ajoute manuellement un élement dans le sommaire
\newcommand{\ajoutsommaire}[2]{
  \addcontentsline{toc}{#1}{#2}
  % Pour ajouter une section sans numéro (*) dans le sommaire
  % 1- "part", "section" ou bien "subsection" ...
  % 2- Nom de la section
}

% Permet d'insérer une figure
\newcommand{\insererfigure}[4]{
  \begin{figure}[H]
    \centering
    \includegraphics[width=#2]{#1}
    \caption{#3}
    \label{fig: #4}
  \end{figure}
}
% Ajoute un item dans le glossaire
\newcommand{\itemglos}[2]{
  \item \textbf{#1} : #2
}

% Permet d'initialiser le compteur pour les annexes
\newcommand{\initannexes}{
  \newcounter{annexe_number}
  \addcontentsline{toc}{section}{Annexes}
}

% Affiche le titre de l'annexe et le numéro (automatique) 
\newcommand{\annexitem}[1]{
  \stepcounter{annexe_number}
  \subsection*{Annexe \arabic{annexe_number} : \textnormal{#1}}
}
