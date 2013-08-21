%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% Very simple template for PhD theses to meet the conditions imposed by     %  
% Trinity College Dublin. These conditions can be found in the College      %
% Calender, part   II, "The submission of theses and disserations", section %
% 1.33 and following.                                                       %
%                                                                           %
% See mythesis.tex for example usage.                                       %
%                                                                           %
% Written by Edsko de Vries <edsko@edsko.net>.                              %
% Last update October 5, 2009, and meets thesis guidelines 2008/09.         %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 

\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{tcd-phd-thesis}[2009/10/05 Basic Trinity College Dublin PhD Thesis Class]

% Pass given options to the book class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{book}}

% 1.33.5. "The thesis must be printed on good quality, A4 (297 x 210mm) white
% paper"
\PassOptionsToClass{a4paper}{book}

% 1.33.5. "The type must be black and not less than 10 point".  
% (If user gives another font size as an option to tcd-phd-thesis, the larger
% of the two will be used.)
\PassOptionsToClass{12pt}{book}

% Process all options
\ProcessOptions\relax

% Load the book class
\LoadClass{book}

% 1.33.5. "The gutter margin of both text and diagrams must not be less than 35
% mm and that on the other three sides not less than 20 mm"
\RequirePackage[inner=35mm,outer=20mm,top=20mm,bottom=20mm]{geometry}

% 1.33.5. "Line-spacing must be at one and a half or double spacing between
% lines."
\RequirePackage{setspace}
\doublespacing

% Personal preference: don't use that awful Computer Modern font
\RequirePackage{mathptmx,times}

% Redefine \maketitle from book.cls so that it does not clear the author's name
\renewcommand\maketitle{\begin{titlepage}%
  \let\footnotesize\small
  \let\footnoterule\relax
  \let \footnote \thanks
  \null\vfil
  \vskip 60\p@
  \begin{center}%
    {\LARGE \@title \par}%
    \vskip 3em%
    {\large
     \lineskip .75em%
      \begin{tabular}[t]{c}%
        \@author
      \end{tabular}\par}%
      \vskip 1.5em%
    {\large \@date \par}%       % Set date in \large size.
  \end{center}\par
  \@thanks
  \vfil\null
  \end{titlepage}%
  \setcounter{footnote}{0}%
  \global\let\thanks\relax
  \global\let\maketitle\relax
  \global\let\@thanks\@empty
%  \global\let\@author\@empty
  \global\let\@date\@empty
  \global\let\@title\@empty
  \global\let\title\relax
%  \global\let\author\relax
  \global\let\date\relax
  \global\let\and\relax
}

% Display environment (figure with delimeters above and below, caption and a label)
\newenvironment{display}[2]{%
  \global\def\display@label{#1}%
  \global\def\display@caption{#2}%
  \begin{figure}%
  \hrule%
  \vspace{1em}%
  \begin{center}%
}{%
  \end{center}%
  \hrule%
  \caption{\label{\display@label}\display@caption}%
  \end{figure}%
}
