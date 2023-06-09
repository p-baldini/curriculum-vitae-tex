\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mandrabcvstyle}[2022/06/07 Mandrab custom CV class]
\LoadClass{article}

\RequirePackage[sfdefault]{classico}
\RequirePackage[T1]{fontenc}
\RequirePackage{fontawesome}
\RequirePackage[a4paper, left=1cm, top=1cm, right=1cm, bottom=1.5cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage[most]{tcolorbox}
\RequirePackage{titlesec}

% PAGE STYLE SETTINGS
\pagestyle{empty}
\parindent0pt

% DEFINE COLORS
\definecolor{aliceblue}{rgb}{0.94, 0.97, 1.0}

% SETUP SECTION AND OTHER STYLES
\titleformat{\section}
  {\Large\bfseries\scshape}
  {$\bullet$ }{0em}             % gives a prefix to all sections
  {}                            % inserts code before the heading
  [\titlerule]                  % inserts a horizontal line after the heading
\titleformat{\subsection}
  {\large\bfseries\scshape}
  {}{0em}                       % gives a prefix to all sections
  {}                            % inserts code before the heading
\newcommand{\experience}[4]{
  \subsection[#1]{$\diamond$ #1 \hfill #2\\\vspace{-\baselineskip}}
  {\large\scshape #3}\if #4 \space \else \space -- #4 \fi
}
\newcommand{\skill}[3]{{\scshape\bfseries #1} \hfill \knowledge{#2}\\ #3}

% DEFINE PERSONAL INFORMATION
\newcommand{\photo}[1]{\renewcommand{\candidatePhoto}{
  \tcbincludegraphics[hbox, graphics options={width=\textwidth}, colframe=gray, size=tight, boxrule=2px, arc=15mm, auto outer arc, nobeforeafter]{#1}
}}
\newcommand{\name}[1]{\renewcommand{\candidateName}{{\Huge\bfseries\scshape #1}}}
\newcommand{\birthday}[1]{\renewcommand{\candidateBirthday}{Date of birth: #1}}
\newcommand{\location}[1]{\renewcommand{\candidateLocation}{#1}}
\newcommand{\email}[1]{\renewcommand{\candidateEmail}{\href{mailto:#1}{\ttfamily #1}}}
\newcommand{\phone}[1]{\renewcommand{\candidatePhone}{#1}}
\newcommand{\drivingLicence}[1]{\renewcommand{\candidateDrivingLicence}{, \quad Driving Licence #1}}
\newcommand{\github}[2]{\renewcommand{\candidateGithub}{\href{#2}{\ttfamily \faGithub~GitHub ID: #1}}}
\newcommand{\scholar}[2]{\renewcommand{\candidateScholar}{\href{#2}{\ttfamily \faGoogle~#1}}}
\newcommand{\university}[2]{\renewcommand{\candidateUniversity}{\href{#2}{\ttfamily \faUniversity~#1}}}
\newcommand{\candidatePhoto}{TODO}
\newcommand{\candidateName}{TODO}
\newcommand{\candidateBirthday}{TODO}
\newcommand{\candidateLocation}{TODO}
\newcommand{\candidateEmail}{TODO}
\newcommand{\candidatePhone}{TODO}
\newcommand{\candidateDrivingLicence}{}
\newcommand{\candidateGithub}{}
\newcommand{\candidateScholar}{}
\newcommand{\candidateUniversity}{}

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
        \candidateGithub, \quad \candidateScholar, \quad \candidateUniversity
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
  \hbox{\makebox[3cm][l]{#1} \knowledge{#2} \quad #3 \\\vspace{5pt}}
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
      Bologna, \today
    \end{minipage}
    %
    \begin{minipage}[t]{.25\textwidth}
      \begin{flushright}
        Signature:
        \candidateSignature
      \end{flushright}
    \end{minipage}
  }
