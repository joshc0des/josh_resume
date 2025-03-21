%-------------------------------------------------------------------------------
%                Identification
%-------------------------------------------------------------------------------

\ProvidesClass{resumeconfig}[2023 v1.0 resumeconfig]
\NeedsTeXFormat{LaTeX2e}

%-------------------------------------------------------------------------------
%                Class options
%-------------------------------------------------------------------------------

\LoadClass[11pt]{article} % adjust font size here

%-------------------------------------------------------------------------------
%                Packages
%-------------------------------------------------------------------------------

\RequirePackage{geometry}
\RequirePackage[hidelinks]{hyperref}
\RequirePackage{fontspec}
\RequirePackage{color}
\RequirePackage[english]{babel}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{multicol}
\RequirePackage{pifont}
\RequirePackage{fontawesome5}
\RequirePackage{fancyhdr}
\RequirePackage[usenames,dvipsnames]{xcolor}
\RequirePackage{etoolbox,refcount}
\RequirePackage{calc}
\RequirePackage{enumitem}
\RequirePackage{fancyhdr}
\RequirePackage{etoolbox}
\RequirePackage{setspace}
\RequirePackage{lipsum}
\RequirePackage{xparse}
\RequirePackage{relsize}
\usepackage{graphicx}

\setmainfont{TeX Gyre Heros} % adjust font style here

% Additional fonts can be found at the following URL: https://www.draketo.de/anderes/latex-fonts.html#org9f59ea3

%-------------------------------------------------------------------------------
%                Formatting
%-------------------------------------------------------------------------------

\setlength{\tabcolsep}{0in}

\pagenumbering{gobble}
\pagestyle{empty}

\raggedbottom
\raggedright

\geometry{
    paper=letterpaper, % Paper size, change to letterpaper for US letter size
    top=0.5in, % Top margin
    bottom=0.4in, % Bottom margin
    left=0.5in, % Left margin
    right=0.5in, % Right margin
    headheight=0.75cm, % Header height
    footskip=1cm, % Space from the bottom margin to the baseline of the footer
    headsep=0.5cm % Space from the top margin to the baseline of the header
}

% section title format
\titleformat{\section}%
    {\vspace{-4pt}\scshape\raggedright\large\bfseries}% format
    {}% label
    {0em}% space between label and title
    {}% before code
    [\color{black}\titlerule\vspace{-5pt}]% after code

%-------------------------------------------------------------------------------
%                Custom Commands
%-------------------------------------------------------------------------------

\newcommand*{\CustomBullet}{%
    \hspace{0em}%
    \raisebox{-0.1em}{\scalebox{1.5}{$\cdot$}}%
    \hspace{0.3em}%
}

\NewDocumentCommand{\Header}{m m m m m m}{
    \fancyhf{}
    \begin{center}
        {\Huge\textbf{#1}}\\[4pt]
        \textcolor{black}{
            #2 \CustomBullet #3 \CustomBullet \href{mailto:#4}{#4} \CustomBullet
            \href{https://linkedin.com/in/#5}{linkedin.com/in/#5} \href{https://github.com/#6}{github.com/#6}            
        }\\[4pt]
        \textbf{Secret Clearance (Tier 3) - Pending Adjudication}
    \end{center}        
}

\newcommand{\Education}[4]{
    \noindent
    \begin{tabular*}{\textwidth}{@{}l @{\extracolsep{\fill}} r}
        \textbf{#1} & \textit{#3} \\
        \textit{#2} & #4 \\
    \end{tabular*}
}

\newcommand{\WorkExperience}[5]{
    \noindent
    \begin{tabular*}{\textwidth}{@{}l @{\extracolsep{\fill}} r}
        \textbf{#1} & \textit{#3} \\
        \textit{#2} & #4 \\
    \end{tabular*}
    
    \begin{itemize}[noitemsep, topsep=0pt, leftmargin=1.5em]
        #5
    \end{itemize}
}

\newcommand{\skill}[1]{\textbullet\ #1}

\newenvironment{Skills}{
	\begin{tabular}{@{}p{5cm}p{14cm}@{}}
	}{
	\end{tabular}
	\vspace{-4pt}
}

\newcommand{\SkillCategory}[2]{
	\textbf{#1:} & #2 \\[0.5em]
}



\NewDocumentEnvironment{ActivitiesList}{O{3} O{1in} +b}{
\vspace{-12pt}
    \setlength{\columnsep}{10pt}
    \begin{multicols}{#1}
        \begin{itemize}[noitemsep, topsep=0pt, leftmargin=1.5em, label={$\CustomBullet$}]
            \small #3
        \end{itemize}
    \end{multicols}
}{}