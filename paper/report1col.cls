\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{report1col}[2026/07/03 Custom one-column journal-style report class]

\DeclareOption*{}
\ProcessOptions\relax

\LoadClass[10pt,onecolumn]{article}

% Typography: Latin Modern Roman is the normal text face.
\RequirePackage[T1]{fontenc}
\RequirePackage[utf8]{inputenc}
\RequirePackage{lmodern}
\RequirePackage{microtype}

% Page, floats, math, and source-code support used by the report content.
\RequirePackage[a4paper,twoside,top=30mm,bottom=50mm,left=35mm,right=44mm,footskip=14mm]{geometry}
\RequirePackage{setspace}
\RequirePackage{graphicx}
\RequirePackage{multirow}
\RequirePackage{amsmath,amssymb,amsfonts}
\RequirePackage{amsthm}
\RequirePackage{mathrsfs}
\RequirePackage[title]{appendix}
\RequirePackage{xcolor}
\RequirePackage{textcomp}
\RequirePackage{manyfoot}
\RequirePackage{booktabs}
\RequirePackage{caption}
\RequirePackage{listings}
\RequirePackage{titlesec}
\RequirePackage[numbers,square]{natbib}
\RequirePackage{enumitem}
\RequirePackage{rotating}
\RequirePackage{url}
\RequirePackage{xparse}
\RequirePackage{etoolbox}
\RequirePackage{fancyhdr}

\setstretch{1.02}
\setlength{\parindent}{1.25em}
\setlength{\parskip}{0pt}
\setlength{\emergencystretch}{2em}
\setlength{\textfloatsep}{14pt plus 2pt minus 2pt}
\setlength{\floatsep}{12pt plus 2pt minus 2pt}
\setlength{\intextsep}{12pt plus 2pt minus 2pt}
\setlength{\abovecaptionskip}{6pt}
\setlength{\belowcaptionskip}{0pt}

% Front matter layout. These margins affect only the title/authors/abstract/keywords block.
\newlength{\rptfrontleft}
\newlength{\rptfrontright}
\newlength{\rptfronttop}
\newlength{\rptfrontbottom}
\newlength{\rpttitleafter}
\newlength{\rptauthorsafter}
\newlength{\rptaffilsafter}
\newlength{\rptabstractafter}
\newlength{\rptkeywordsafter}

\setlength{\rptfrontleft}{10mm}
\setlength{\rptfrontright}{10mm}
\setlength{\rptfronttop}{15pt}
\setlength{\rptfrontbottom}{12pt}
\setlength{\rpttitleafter}{2em}
\setlength{\rptauthorsafter}{0.5em}
\setlength{\rptaffilsafter}{1.8em}
\setlength{\rptabstractafter}{1em}
\setlength{\rptkeywordsafter}{1em}

\titleformat{\section}
  {\normalfont\Large\bfseries}
  {\thesection}
  {0.75em}
  {}
\titlespacing*{\section}{0pt}{18pt plus 2pt minus 2pt}{8pt plus 1pt minus 1pt}

\titleformat{\subsection}
  {\normalfont\large\bfseries}
  {\thesubsection}
  {0.75em}
  {}
\titlespacing*{\subsection}{0pt}{14pt plus 2pt minus 2pt}{6pt plus 1pt minus 1pt}

\titleformat{\subsubsection}
  {\normalfont\normalsize\itshape}
  {\thesubsubsection}
  {0.75em}
  {}
\titlespacing*{\subsubsection}{0pt}{12pt plus 2pt minus 2pt}{5pt plus 1pt minus 1pt}

\captionsetup{
  font=small,
  labelfont=bf,
  labelsep=period,
  justification=raggedright,
  singlelinecheck=false
}

\lstset{
  basicstyle=\ttfamily\small,
  columns=fullflexible,
  keepspaces=true,
  breaklines=true,
  showstringspaces=false,
  frame=none,
  xleftmargin=0pt,
  aboveskip=6pt,
  belowskip=6pt
}

\newtheoremstyle{thmstyleone}
  {6pt}{6pt}{\itshape}{}{\bfseries}{.}{ }{}
\newtheoremstyle{thmstyletwo}
  {6pt}{6pt}{\itshape}{}{\rmfamily}{.}{ }{}
\newtheoremstyle{thmstylethree}
  {6pt}{6pt}{\rmfamily}{}{\bfseries}{.}{ }{}

\setlist[enumerate]{label=\arabic*.,leftmargin=*}
\setlist[itemize]{leftmargin=*}
\bibliographystyle{IEEEtran}
\setlength{\bibhang}{0pt}
\setlength{\bibsep}{4pt}
\renewcommand{\bibnumfmt}[1]{[#1]\hspace{0.5em}}
\providecommand{\botrule}{\bottomrule}

\makeatletter
\def\rpt@title{}
\def\rpt@authors{}
\def\rpt@affils{}
\def\rpt@abstract{}
\def\rpt@keywords{}
\def\rpt@footerleft{}
\def\rpt@footercenter{}
\def\rpt@footerright{}
\newif\ifrpt@footer

\RenewDocumentCommand{\title}{o m}{\gdef\rpt@title{#2}}
\RenewDocumentCommand{\author}{s o m}{\gappto\rpt@authors{#3\par}}
\NewDocumentCommand{\email}{m}{\gappto\rpt@authors{\texttt{#1}\par}}
\NewDocumentCommand{\equalcont}{m}{}
\NewDocumentCommand{\affil}{s o m}{\gappto\rpt@affils{#3\par}}
\RenewDocumentCommand{\abstract}{+m}{\gdef\rpt@abstract{#1}}
\NewDocumentCommand{\keywords}{m}{\gdef\rpt@keywords{#1}}
\NewDocumentCommand{\pacs}{o m}{}
\NewDocumentCommand{\footer}{m}{%
  \gdef\rpt@footerleft{#1}%
  \rpt@footertrue
}

\fancypagestyle{rptfirstpagefooter}{%
  \fancyhf{}%
  \fancyfoot[L]{\footnotesize\rpt@footerleft}%
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{16384sp}%
  \renewcommand{\footruleskip}{2pt}%
  \renewcommand{\footrule}{%
    \vskip-\footruleskip
    \hbox to\headwidth{\rule{\dimexpr\headwidth/2\relax}{\footrulewidth}\hfil}%
    \vskip\footruleskip
  }%
}

\AtBeginDocument{%
  \ifrpt@footer
    \thispagestyle{rptfirstpagefooter}%
  \fi
}

\NewDocumentCommand{\fnm}{m}{#1}
\NewDocumentCommand{\sur}{m}{#1}
\NewDocumentCommand{\spfx}{m}{#1}
\NewDocumentCommand{\sfx}{m}{#1}
\NewDocumentCommand{\orgdiv}{m}{#1}
\NewDocumentCommand{\orgname}{m}{#1}
\NewDocumentCommand{\orgaddress}{m}{#1}
\NewDocumentCommand{\street}{m}{#1}
\NewDocumentCommand{\city}{m}{#1}
\NewDocumentCommand{\postcode}{m}{#1}
\NewDocumentCommand{\state}{m}{#1}
\NewDocumentCommand{\country}{m}{#1}

\newcommand{\bmhead}[1]{\section*{#1}}
\newcommand{\backmatter}{}

\renewcommand{\maketitle}{%
  \vspace*{\rptfronttop}%
  \noindent\hspace*{\rptfrontleft}%
  \begin{minipage}{\dimexpr\textwidth-\rptfrontleft-\rptfrontright\relax}
    \begin{center}
      {\LARGE\bfseries \rpt@title\par}
      \vspace{\rpttitleafter}
      {\large \rpt@authors}
      \vspace{\rptauthorsafter}
      {\large \rpt@affils}
    \end{center}
    \vspace{\rptaffilsafter}
    \ifx\rpt@abstract\@empty\else
      {\small\centering\textbf{Abstract}\par}
      \vspace{3pt}
      {\small\rpt@abstract\par}
      \vspace{\rptabstractafter}
    \fi
    \ifx\rpt@keywords\@empty\else
      {\footnotesize\noindent\textbf{Keywords: }\rpt@keywords\par}
      \vspace{\rptkeywordsafter}
    \fi
  \end{minipage}\par
  \vspace{\rptfrontbottom}%
}
\makeatother
