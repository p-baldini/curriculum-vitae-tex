\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mystyle}[2026/02/10 P. Baldini custom CV class]
\LoadClass{article}

\RequirePackage[sfdefault]{classico}
\RequirePackage[T1]{fontenc}
\RequirePackage{fontawesome}
\RequirePackage{etaremune}
\RequirePackage[a4paper, left=1cm, top=1cm, right=1cm, bottom=1.5cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage[most]{tcolorbox}
\RequirePackage{titlesec}
\RequirePackage{tracklang}

% PAGE STYLE SETTINGS
\pagestyle{empty}
\parindent0pt
\parskip0pt
\hbadness=99999

% DEFINE COLORS
\definecolor{aliceblue}{rgb}{0.94, 0.97, 1.0}

% SETUP SECTION AND OTHER STYLES
\titleformat{\section}
  {\Large\bfseries\scshape}
  {}{0em}                       % gives a prefix to all sections
  {}                            % inserts code before the heading
  [\titlerule]                  % inserts a horizontal line after the heading
\titleformat{\subsection}
  {\large\bfseries\scshape}
  {}{0em}                       % gives a prefix to all sections
  {}                            % inserts code before the heading
\newcommand\experienceTitle[2]{{
  \scshape\bfseries #1 \hfill #2 \smallskip\newline
}}
\newcommand\experienceDetails[2]{{
  {\scshape #1}\if #2 \space \else \space -- #2 \fi \smallskip\newline
}}
\newcommand{\experience}[4]{
  \smallskip
  {\scshape \bfseries #1 \hfill #2}
  \smallskip\\
  {\scshape #3}\if #4 \space \else \space -- #4 \fi
  \medskip

  % \subsection[#1]{$\diamond$ #1 \hfill #2\\\vspace{-\baselineskip}}
  % {\large\scshape #3}\if #4 \space \else \space -- #4 \fi
}
\newcommand{\skill}[3]{{\scshape\bfseries #1} \hfill \knowledge{#2}\\ #3}

% DEFINE PERSONAL INFORMATION
\newcommand{\photo}[1]{\renewcommand{\candidatePhoto}{
  \tcbincludegraphics[hbox, graphics options={width=\textwidth}, colframe=gray, size=tight, boxrule=2px, arc=15mm, auto outer arc, nobeforeafter]{#1}
}}
\newcommand{\name}[1]{\renewcommand{\candidateName}{{\Huge\bfseries\scshape #1}}}
\newcommand{\birthday}[1]{\renewcommand{\candidateBirthday}{Date of birth: #1}}
\newcommand{\datadinascita}[1]{\renewcommand{\candidateBirthday}{Nato il #1}}
\newcommand{\location}[1]{\renewcommand{\candidateLocation}{#1}}
\newcommand{\residenza}[1]{\renewcommand{\candidateLocation}{Residente a #1}}
\newcommand{\email}[1]{\renewcommand{\candidateEmail}{\href{mailto:#1}{\ttfamily #1}}}
\newcommand{\phone}[1]{\renewcommand{\candidatePhone}{#1}}
\newcommand{\drivingLicence}[1]{\renewcommand{\candidateDrivingLicence}{, \quad Driving Licence #1}}
\newcommand{\patente}[1]{\renewcommand{\candidateDrivingLicence}{, \quad Patente #1}}
\newcommand{\home}[2]{\renewcommand{\candidateHome}{\href{#2}{\ttfamily \faHome~#1}}}
\newcommand{\github}[2]{\renewcommand{\candidateGithub}{\href{#2}{\ttfamily \faGithub~#1}}}
\newcommand{\scholar}[2]{\renewcommand{\candidateScholar}{\href{#2}{\ttfamily \faGoogle~#1}}}
\newcommand{\university}[2]{\renewcommand{\candidateUniversity}{\href{#2}{\ttfamily \faUniversity~#1}}}
\newcommand{\linkedin}[2]{\renewcommand{\candidateLinkedin}{\href{#2}{\ttfamily \faLinkedinSquare~#1}}}
\newcommand{\candidatePhoto}{TODO}
\newcommand{\candidateName}{TODO}
\newcommand{\candidateBirthday}{TODO}
\newcommand{\candidateLocation}{TODO}
\newcommand{\candidateEmail}{TODO}
\newcommand{\candidatePhone}{TODO}
\newcommand{\candidateDrivingLicence}{}
\newcommand{\candidateHome}{}
\newcommand{\candidateGithub}{}
\newcommand{\candidateScholar}{}
\newcommand{\candidateUniversity}{}
\newcommand{\candidateLinkedin}{}

\newenvironment{candidate}
  {}
  {
    \begin{tcolorbox}[
      colback=aliceblue,
      opacityframe=0, size=tight,
      spread inwards, spread outwards, spread upwards
    ]
      \hfill
      \begin{minipage}{3cm}\vspace{.5cm}
        \candidatePhoto
      \end{minipage}
      \hfill
      \begin{minipage}[c]{\dimexpr \textwidth - 3cm - 3cm}\vspace{.5cm}
        \candidateName\\
        \rule{\dimexpr \textwidth - 3cm}{1px}\\
        \candidateBirthday, \quad \candidateLocation\vspace{5pt} \\
        \candidateEmail, \quad \candidatePhone \candidateDrivingLicence \vspace{5pt} \\
        \candidateHome, \quad \candidateGithub, \quad \candidateScholar, \quad \candidateUniversity, \quad \candidateLinkedin
      \end{minipage}
      \vspace{.5cm}
    \end{tcolorbox}
  }

% LANGUAGE AND SKILLS
\newcount\knowledgecount
\newcommand\knowledge[1]
  {
    \knowledgecount=0
      \loop\ifnum\knowledgecount<#1
        \advance\knowledgecount1
        \textcolor{black}{$\bullet$}
      \repeat
      \loop\ifnum\knowledgecount<6
        \ifnum #1<0
          \def\breakloop{\fi\iffalse}
          \expandafter\breakloop
        \fi
        \advance\knowledgecount1
        \textcolor{lightgray}{$\bullet$}
      \repeat
  }
\newcommand\languageknowledge[3]{
  % \hbox{\makebox[2cm][l]{#1} \knowledge{#2} \quad #3 \hfill}
  \makebox[3cm][l]{#1} \knowledge{#2} \quad #3
}

% DECLARATION AND SIGNATURE
\newcommand{\signature}[1]{\renewcommand{\candidateSignature}{
  \tcbincludegraphics[hbox, graphics options={width=.85\textwidth}, opacityfill=0]{#1}
}}
\newcommand{\candidateSignature}{TODO}
\newenvironment{declaration}
  {
    \vfill\itshape
  }
  {
    \vspace{2\baselineskip}\newline\upshape
    \begin{minipage}[t]{.75\textwidth}
      Mercato Saraceno, \today
    \end{minipage}
    %
    \begin{minipage}[t]{.25\textwidth}
      \begin{flushright}
        Signature:
        \candidateSignature
      \end{flushright}
    \end{minipage}
  }
