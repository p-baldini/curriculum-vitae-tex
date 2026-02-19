\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{mystyle}[2026/02/10 P. Baldini custom CV class]
\LoadClass{article}

\RequirePackage[sfdefault]{classico}
\RequirePackage[T1]{fontenc}
\RequirePackage{fontawesome}
\RequirePackage{etaremune}
\RequirePackage[a4paper, left=1cm, top=1cm, right=1cm, bottom=1cm]{geometry}
\RequirePackage{graphicx}
\RequirePackage{hyperref}
\RequirePackage[most]{tcolorbox}
\RequirePackage{titlesec}
\RequirePackage{translations}

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
\titlespacing*{\section}{0em}{.5\baselineskip}{\baselineskip}
\newcommand\experienceTitle[2]{{
  \scshape\bfseries #1 \hfill #2 \smallskip\newline
}}
\newcommand\experienceDetails[2]{{
  {\scshape #1}\if #2 \space \else \space -- #2 \fi \bigskip
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
\newcommand{\photo}[1]{\newcommand{\candidatePhoto}{
  \tcbincludegraphics[hbox, graphics options={width=\textwidth}, colframe=gray, size=tight, boxrule=2px, arc=15mm, auto outer arc, nobeforeafter]{#1}
}}
\newcommand{\name}[1]{\newcommand{\candidateName}{{\Huge\bfseries\scshape #1}}}
\newcommand{\birthday}[1]{\newcommand{\candidateBirthday}{\ifcurrentbaselanguage{italian}{Nato il}{Born} #1}}
\newcommand{\location}[1]{\newcommand{\candidateLocation}{\ifcurrentbaselanguage{italian}{residente a}{located in} #1}}
\newcommand{\email}[1]{\newcommand{\candidateEmail}{\href{mailto:#1}{\ttfamily #1}}}
\newcommand{\phone}[1]{\newcommand{\candidatePhone}{#1}}
\newcommand{\drivingLicence}[1]{\newcommand{\candidateDrivingLicence}{\ifcurrentbaselanguage{italian}{Patente}{Driving Licence} #1}}
\newcommand{\home}[2]{\newcommand{\candidateHome}{\href{#2}{\ttfamily \faHome~#1}}}
\newcommand{\github}[2]{\newcommand{\candidateGithub}{\href{#2}{\ttfamily \faGithub~#1}}}
\newcommand{\scholar}[2]{\newcommand{\candidateScholar}{\href{#2}{\ttfamily \faGoogle~#1}}}
\newcommand{\university}[2]{\newcommand{\candidateUniversity}{\href{#2}{\ttfamily \faUniversity~#1}}}
\newcommand{\linkedin}[2]{\newcommand{\candidateLinkedin}{\href{#2}{\ttfamily \faLinkedinSquare~#1}}}

\newenvironment{candidate}
  {}
  {
    \begin{tcolorbox}[
      colback=aliceblue,
      opacityframe=0, size=tight,
      spread inwards, spread outwards, spread upwards
    ]
      \@ifundefined{candidatePhoto}{
        \hspace{0.8cm}
      }{
        \hfill
        \begin{minipage}{3cm}\vspace{.5cm}
          \candidatePhoto
        \end{minipage}
        \hfill
      }
      %
      \begin{minipage}[c]{\dimexpr \textwidth - 3cm - 3cm}\vspace{.5cm}
        \candidateName\\
        \@ifundefined{candidatePhoto}{
          \rule{\dimexpr \textwidth + 2.05cm}{1px}\\
        }{
          \rule{\dimexpr \textwidth - 2.95cm}{1px}\\
        }
        %
        \@ifundefined{candidateBirthday}{}{\candidateBirthday, \;} 
        \@ifundefined{candidateLocation}{}{\candidateLocation}
        \vspace{5pt} \\
        %
        \@ifundefined{candidateEmail}{}{\candidateEmail, \;}
        \@ifundefined{candidatePhone}{}{\candidatePhone, \;}
        \@ifundefined{candidateDrivingLicence}{}{\candidateDrivingLicence}
        \vspace{5pt} \\
        %
        \@ifundefined{candidateHome}{}{\candidateHome, \;}
        \@ifundefined{candidateGithub}{}{\candidateGithub, \;}
        \@ifundefined{candidateScholar}{}{\candidateScholar, \;}
        \@ifundefined{candidateUniversity}{}{\candidateUniversity, \;}
        \@ifundefined{candidateLinkedin}{}{\candidateLinkedin}
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
  #1 \hfill \makebox[4.5cm][l]{\knowledge{#2} \quad #3}
}

% DECLARATION AND SIGNATURE
\newcommand{\signature}[1]{\newcommand{\candidateSignature}{
  \tcbincludegraphics[hbox, graphics options={width=.85\textwidth}, opacityfill=0]{#1}
}}
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
    \@ifundefined{candidateSignature}{}{
      \begin{minipage}[t]{.25\textwidth}
        \begin{flushright}
          Signature:
          \candidateSignature
        \end{flushright}
      \end{minipage}
    }
  }
