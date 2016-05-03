% -------------------------------------------------------------------
%  @LaTeX-class-file{
%     filename        = "thesis.cls",
%     version         = "0.1",
%     date            = "June 2013",
%     codetable       = "ISO/ASCII",
%     keywords        = "LaTeX,",
%     supported       = "send email to sayrejay@gmail.com",
%     docstring       = "A thesis class"
% --------------------------------------------------------------------

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{thesis}[2016/05/01 v0.1 Thesis Class]
\LoadClass[12pt, oneside, letterpaper]{book}

% Required packages
\RequirePackage{graphicx}
\RequirePackage{xcolor}
\definecolor{Customcolor}{rgb}{0.3,0,0} 
\RequirePackage[colorlinks]{hyperref}
\hypersetup{
    linktocpage,
    citecolor=Customcolor,
    filecolor=black,
    linkcolor=black,
    urlcolor=Customcolor,
    linkcolor=Customcolor
}

\RequirePackage[centertags]{amsmath}
\RequirePackage{amssymb}
\RequirePackage{natbib}
\RequirePackage[small, md, sc]{titlesec}
\RequirePackage[tight,nice]{units}
\RequirePackage{verbatim}

\usepackage{amsfonts,amsthm}
\usepackage{float}
\usepackage{tikz}
\usepackage{lscape}
\usepackage{pdflscape}
\usepackage{atbegshi}

\RequirePackage{url}
\RequirePackage[titles]{tocloft}
\setcounter{tocdepth}{1}
\renewcommand{\cftchapfont}{\normalsize \scshape}

\renewcommand\bibname{References}
\renewcommand\listfigurename{Figures}
\raggedright

\RequirePackage{pdfsync} %do pdf synchronization [andy]
\RequirePackage{mathspec}
\RequirePackage{afterpage} 

\RequirePackage{lettrine} % big letter at start of chapter
\RequirePackage[margin=1in]{geometry}

\RequirePackage{fancyhdr} 
\pagestyle{plain} % options: empty , plain , fancy
\RequirePackage[palatino]{quotchap}
\RequirePackage{titling}
\RequirePackage{setspace} 
\RequirePackage{booktabs} % for much better looking tables
\RequirePackage[labelfont={sf,bf,small},textfont={sf,small},justification=RaggedRight,
margin=0pt, figurewithin=section, tablewithin=section]{caption}
%\raggedright

\parindent 12pt


% use Arno Pro instead of standard LaTeX fonts
\setmathsfont(Digits,Latin,Greek)[Numbers={OldStyle,Proportional}]{Arno Pro}%
\setmathrm{Arno Pro}%

\RequirePackage{fontspec,xltxtra,xunicode}
\defaultfontfeatures{Mapping=tex-text, Numbers=OldStyle}
\setromanfont[Mapping=tex-text, 
			  Numbers=OldStyle, 
			  Ligatures={Common}, 
			  SizeFeatures={%
		          {Size={-10}, Font=* Caption},
		          {Size={10-13.0}, Font=*},
		          {Size={13.01-19.9}, Font=* Subhead, Ligatures=Rare, Contextuals={Swash,Alternate}},
		       {Size={19.91-},Font=* Display, Ligatures=Rare, Contextuals={Swash,Alternate}}}]
			  {Arno Pro} %

% some definitions
\def\degreeyear#1{\gdef\@degreeyear{#1}}
\def\degreemonth#1{\gdef\@degreemonth{#1}}
\def\degree#1{\gdef\@degree{#1}}
\def\field#1{\gdef\@field{#1}}
\def\university#1{\gdef\@university{#1}}
\def\universitycity#1{\gdef\@universitycity{#1}}
\def\universitystate#1{\gdef\@universitystate{#1}}
\def\plansponsor#1{\gdef\@plansponsor{#1}}
\def\cosponsor#1{\gdef\@cosponsor{#1}}
\def\outsideevaluator#1{\gdef\@outsideevaluator{#1}}

\renewcommand{\maketitle}{ 
	\singlespacing
	\thispagestyle{empty}
	\vspace*{\fill} \vspace{150pt} \begin{center}
	\Huge \textcolor{Customcolor}{\textit{\thetitle}} \normalsize \\ \sc \vspace{100pt}
	
	\theauthor\\
	\vspace{24pt}
	Submitted under the supervision of\\
	\@outsideevaluator, \@cosponsor, \\
	\& \@plansponsor \\
	\vspace{12pt}
	to the University Honors Program at the  \\
	\@university\\
	%\@universitycity, \@universitystate\\ 
	in partial fulfillment of the \\
	requirements for the degree of \\
	\@degree, $summa~cum~laude$ \\ 
	in \@field\\
	\vspace{24pt}
	
	\@degreemonth\ \@degreeyear \\
	\vspace{12pt}
	\end{center} \vspace*{\fill}
}

\newcommand{\copyrightpage}{
	\pagenumbering{roman}
	\setcounter{page}{1}
	\newpage \thispagestyle{empty} \vspace*{\fill}
	\sc \noindent \copyright~\textit{\@degreeyear \hspace{3pt}~- \theauthor} \\
	\noindent \href{mailto:sayre035@umn.edu}{sayre035@umn.edu} \\
	\noindent All rights reserved. \\
	\vspace*{\fill} \newpage \rm
}


% the acknowledgments page
\newcommand{\acknowledgments}{
	\newpage
	\chapter*{Acknowledgments}
	\noindent
	\input{frontmatter/thanks}
	\vspace*{\fill} 
	\newpage
	\setcounter{page}{1}
	\pagenumbering{roman}}

\newcommand{\abstractpage}{
	\newpage
	\pagestyle{fancy}
	\lhead{Sponsors: \@outsideevaluator, \@cosponsor, \& \@plansponsor} \rhead{\@author}
	\renewcommand{\headrulewidth}{0.0pt} 
	\begin{center}
	\vspace*{1pt}
	\Large \textcolor{Customcolor}{\textit{\@title}} \normalsize\\
	\vspace*{15pt}
	\sc Abstract \\ \rm
	\end{center}
	\doublespace
	\input{frontmatter/abstract}
	\doublespace
	\newpage \lhead{} \rhead{}
	\cfoot{\thepage}
	\onehalfspacing
}

\newcommand{\dedicationpage}{
	\pagestyle{fancy}
	\newpage \thispagestyle{fancy} \vspace*{\fill}
	\sc \noindent \input{frontmatter/dedication}
	\vspace*{\fill} \newpage \rm
	}

% the list of authors
\newcommand{\authorlist}{
	\pagestyle{fancy}
	\newpage
	\thispagestyle{fancy} 
	\chapter*{Author List}
	\noindent \input{frontmatter/authorlist}
	\newpage \rm
	}

	
% An environment for paragraph-style section
\providecommand\newthought[1]{%
   \addvspace{1.0\baselineskip plus 0.5ex minus 0.2ex}%
   \noindent\textsc{#1}}
