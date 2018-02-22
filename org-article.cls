
% Identification part
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{org-article}[2010/09/21 0.2 (TSD)]
% End of the identification part
%
% Initial code part

\RequirePackage{ifthen}
\RequirePackage{calc}
\RequirePackage{ifpdf}
\RequirePackage{remreset}
\RequirePackage{pgfopts}
% End of initial code part
% Declaration of options part
% Org-mode default packages
\newboolean{ORGART@nofontenc}  
\DeclareOption{nofontenc}{\setboolean{ORGART@nofontenc}{true}}
\newboolean{ORGART@nofixltx2e}
\DeclareOption{nofixltx2e}{\setboolean{ORGART@nofixltx2e}{true}}
\newboolean{ORGART@nographicx}
\DeclareOption{nographicx}{\setboolean{ORGART@nographicx}{true}}
\newboolean{ORGART@nolongtable}
\DeclareOption{nolongtable}{\setboolean{ORGART@nolongtable}{true}}
\newboolean{ORGART@nofloat}
\DeclareOption{nofloat}{\setboolean{ORGART@nofloat}{true}}
\newboolean{ORGART@nowrapfig}
\DeclareOption{nowrapfig}{\setboolean{ORGART@nowrapfig}{true}}
\newboolean{ORGART@nosoul}
\DeclareOption{nosoul}{\setboolean{ORGART@nosoul}{true}}
\newboolean{ORGART@notextcomp}
\DeclareOption{notextcomp}{\setboolean{ORGART@notextcomp}{true}}
\newboolean{ORGART@nomarvosym}
\DeclareOption{nomarvosym}{\setboolean{ORGART@nomarvosym}{true}}
\newboolean{ORGART@nowasysym}
\DeclareOption{nowasysym}{\setboolean{ORGART@nowasysym}{true}}
\newboolean{ORGART@integrals}
\DeclareOption{integrals}{\setboolean{ORGART@integrals}{true}}
\newboolean{ORGART@nointegrals}
\DeclareOption{nointegrals}{\setboolean{ORGART@nointegrals}{true}}
\newboolean{ORGART@nolatexsym}
\DeclareOption{nolatexsym}{\setboolean{ORGART@nolatexsym}{true}}
\newboolean{ORGART@noamssymb}
\DeclareOption{noamssymb}{\setboolean{ORGART@noamssymb}{true}}
\newboolean{ORGART@nohyperref}
\DeclareOption{nohyperref}{\setboolean{ORGART@nohyperref}{true}}

% Font options
\newboolean{ORGART@times}
\DeclareOption{times}{\setboolean{ORGART@times}{true}}
\newboolean{ORGART@garamond}
\DeclareOption{garamond}{\setboolean{ORGART@garamond}{true}}
\newboolean{ORGART@palatino}
\DeclareOption{palatino}{\setboolean{ORGART@palatino}{true}}
\newboolean{ORGART@utopia}
\DeclareOption{utopia}{\setboolean{ORGART@utopia}{true}}
\newboolean{ORGART@charter}
\DeclareOption{charter}{\setboolean{ORGART@charter}{true}}
\newboolean{ORGART@ctex}
\DeclareOption{ctex}{\setboolean{ORGART@ctex}{true}}

% Base class options
\newboolean{koma}
\DeclareOption{koma}{\setboolean{koma}{true}}
\newboolean{article}
\DeclareOption{article}{\setboolean{article}{true}}
\DeclareOption{tocdepths}{\AtBeginDocument{\setcounter{tocdepth}{1}}}
\DeclareOption{tocdepthss}{\AtBeginDocument{\setcounter{tocdepth}{2}}}
\DeclareOption{tocdepthsss}{\AtBeginDocument{\setcounter{tocdepth}{3}}}
\DeclareOption{secnums}{\AtBeginDocument{\setcounter{secnumdepth}{1}}}
\DeclareOption{secnumss}{\AtBeginDocument{\setcounter{secnumdepth}{2}}}
\DeclareOption{secnumsss}{\AtBeginDocument{\setcounter{secnumdepth}{3}}}
\DeclareOption{secnump}{\AtBeginDocument{\setcounter{secnumdepth}{4}}}
\DeclareOption{secnumsp}{\AtBeginDocument{\setcounter{secnumdepth}{5}}}

% Other package options
\newboolean{ORGART@microtype}
\DeclareOption{microtype}{\setboolean{ORGART@microtype}{true}}
\newboolean{ORGART@paralist}
\DeclareOption{paralist}{\setboolean{ORGART@paralist}{true}}
\newboolean{ORGART@setspace}
\newboolean{ORGART@doublespace}
\DeclareOption{setspace}{\setboolean{ORGART@setspace}{true}}
\DeclareOption{doublespace}{\setboolean{ORGART@doublespace}{true}}
% \newboolean{topcapt}
% \DeclareOption{topcapt}{\setboolean{topcapt}{true}}
\newboolean{listings}
\newboolean{color}
\DeclareOption{listings}{\setboolean{listings}{true}}
\DeclareOption{listings-bw}{%
  \setboolean{listings}{true}%
  \AtBeginDocument{%
    \lstset{
      basicstyle=\ttfamily\footnotesize,%
      frame=lines,%
      breaklines=true,%
      showstringspaces=false}%
  }%
}
\DeclareOption{listings-color}{%
  \setboolean{listings}{true}%
  \setboolean{color}{true}%
  \AtBeginDocument{%
    \definecolor{keywords}{RGB}{255,0,90}%
    \definecolor{comments}{RGB}{60,179,113}%
    \definecolor{back}{RGB}{231,231,231}%
    \lstset{%
      keywordstyle=\color{keywords},%
      commentstyle=\color{comments},%
      backgroundcolor=\color{back},%
      basicstyle=\ttfamily\footnotesize,%
      showstringspaces=false,%
      frame=lines,%
      breaklines=true,%
      resetmargins=true%
    }%
  }%
}
\DeclareOption{listings-sv}{%
  \setboolean{listings}{true}%
  \setboolean{color}{true}%
  \AtBeginDocument{%
    \definecolor{...@lstbackground}{RGB}{255,255,204} % light yellow
    \definecolor{...@lstkeyword}{RGB}{0,0,255} % blue
    \definecolor{...@lstidentifier}{RGB}{0,0,0} % black
    \definecolor{...@lstcomment}{RGB}{255,0,0} % red
    \definecolor{...@lststring}{RGB}{0,128,0} % dark green
    \lstset{%
      basicstyle=\ttfamily\scriptsize, % the font that is used for the code
      tabsize=4, % sets default tabsize to 4 spaces
      numbers=left, % where to put the line numbers
      numberstyle=\tiny, % line number font size
      stepnumber=0, % step between two line numbers
      breaklines=true, %!! do break long lines of code
      showtabs=false, % show tabs within strings adding particular underscores
      showspaces=false, % show spaces adding particular underscores
      showstringspaces=false, % underline spaces within strings
      keywordstyle=\color{...@lstkeyword},
      identifierstyle=\color{...@lstidentifier},
      stringstyle=\color{...@lststring},
      commentstyle=\color{...@lstcomment},
      backgroundcolor=\color{...@lstbackground}, % sets the background color
      resetmargins=true,%
      captionpos=b, % sets the caption position to `bottom'
      extendedchars=false %!?? workaround for when the listed file is in UTF-8
    }%
  }%
}
\DeclareOption{listings-es}{%
  \setboolean{listings}{true}%
  \setboolean{color}{true}%
  \AtBeginDocument{%
    \definecolor{dkgreen}{rgb}{0,0.5,0}%
    \definecolor{dkred}{rgb}{0.5,0,0}%
    \definecolor{gray}{rgb}{0.5,0.5,0.5}%
    \lstset{%
      basicstyle=\ttfamily\bfseries\scriptsize,
      keywordstyle=\color{blue},
      ndkeywordstyle=\color{red},
      commentstyle=\color{dkred},
      stringstyle=\color{dkgreen},
      numbers=left,
      breaklines=true,
      numberstyle=\ttfamily\footnotesize\color{gray},
      stepnumber=1,
      numbersep=10pt,
      backgroundcolor=\color{white},
      tabsize=4,
      showspaces=false,
      showstringspaces=false,
      xleftmargin=.23in
    }%
  }%
}  
\newboolean{minted}
\DeclareOption{minted}{\setboolean{minted}{true}}  
%  \newboolean{color}
%  \DeclareOption{color}{\setboolean{color}{true}}  
\newboolean{gantt}
\DeclareOption{gantt}{\setboolean{gantt}{true}}

% Base class
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{scrartcl}}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}  

% Pass options to packages
\DeclareOption{anchorcolor}{%
   \PassOptionsToPackage{anchorcolor}{hyperref}}
\DeclareOption{backref}{%
   \PassOptionsToPackage{backref}{hyperref}}
\DeclareOption{baseurl}{%
   \PassOptionsToPackage{baseurl}{hyperref}}
\DeclareOption{bookmarks}{%
   \PassOptionsToPackage{bookmarks}{hyperref}}
\DeclareOption{bookmarksnumbered}{%
   \PassOptionsToPackage{bookmarksnumbered}{hyperref}}
\DeclareOption{bookmarksopen}{%
   \PassOptionsToPackage{bookmarksopen}{hyperref}}
\DeclareOption{bookmarksopenlevel}{%
   \PassOptionsToPackage{bookmarksopenlevel}{hyperref}}
\DeclareOption{bookmarkstype}{%
   \PassOptionsToPackage{bookmarkstype}{hyperref}}
\DeclareOption{breaklinks}{%
   \PassOptionsToPackage{breaklinks}{hyperref}}
\DeclareOption{CJKbookmarks}{%
   \PassOptionsToPackage{CJKbookmarks}{hyperref}}
\DeclareOption{citebordercolor}{%
   \PassOptionsToPackage{citebordercolor}{hyperref}}
\DeclareOption{citecolor}{%
   \PassOptionsToPackage{citecolor}{hyperref}}
\DeclareOption{colorlinks}{%
   \PassOptionsToPackage{colorlinks}{hyperref}}
\DeclareOption{draft}{%
   \PassOptionsToPackage{draft}{hyperref}}
\DeclareOption{dvipdfm}{%
   \PassOptionsToPackage{dvipdfm}{hyperref}}
\DeclareOption{dvipdfmx}{%
   \PassOptionsToPackage{dvipdfmx}{hyperref}}
\DeclareOption{dvips}{%
   \PassOptionsToPackage{dvips}{hyperref}}
\DeclareOption{dvipsone}{%
   \PassOptionsToPackage{dvipsone}{hyperref}}
\DeclareOption{dviwindo}{%
   \PassOptionsToPackage{dviwindo}{hyperref}}
\DeclareOption{encap}{%
   \PassOptionsToPackage{encap}{hyperref}}
\DeclareOption{extension}{%
   \PassOptionsToPackage{extension}{hyperref}}
\DeclareOption{filebordercolor}{%
   \PassOptionsToPackage{filebordercolor}{hyperref}}
\DeclareOption{filecolor}{%
   \PassOptionsToPackage{filecolor}{hyperref}}
\DeclareOption{final}{%
   \PassOptionsToPackage{final}{hyperref}}
\DeclareOption{frenchlinks}{%
   \PassOptionsToPackage{frenchlinks}{hyperref}}
\DeclareOption{hyperfigures}{%
   \PassOptionsToPackage{hyperfigures}{hyperref}}
\DeclareOption{hyperfootnotes}{%
   \PassOptionsToPackage{hyperfootnotes}{hyperref}}
\DeclareOption{hyperindex}{%
   \PassOptionsToPackage{hyperindex}{hyperref}}
\DeclareOption{hypertex}{%
   \PassOptionsToPackage{hypertex}{hyperref}}
\DeclareOption{hypertexnames}{%
   \PassOptionsToPackage{hypertexnames}{hyperref}}
\DeclareOption{implicit}{%
   \PassOptionsToPackage{implicit}{hyperref}}
\DeclareOption{latex2html}{%
   \PassOptionsToPackage{latex2html}{hyperref}}
\DeclareOption{legalpaper}{%
   \PassOptionsToPackage{legalpaper}{hyperref}}
\DeclareOption{letterpaper}{%
   \PassOptionsToPackage{letterpaper}{hyperref}}
\DeclareOption{linkbordercolor}{%
   \PassOptionsToPackage{linkbordercolor}{hyperref}}
\DeclareOption{linkcolor}{%
   \PassOptionsToPackage{linkcolor}{hyperref}}
\DeclareOption{linktocpage}{%
   \PassOptionsToPackage{linktocpage}{hyperref}}
\DeclareOption{menubordercolor}{%
   \PassOptionsToPackage{menubordercolor}{hyperref}}
\DeclareOption{menucolor}{%
   \PassOptionsToPackage{menucolor}{hyperref}}
\DeclareOption{nativepdf}{%
   \PassOptionsToPackage{nativepdf}{hyperref}}
\DeclareOption{naturalnames}{%
   \PassOptionsToPackage{naturalnames}{hyperref}}
\DeclareOption{nesting}{%
   \PassOptionsToPackage{nesting}{hyperref}}
\DeclareOption{pageanchor}{%
   \PassOptionsToPackage{pageanchor}{hyperref}}
\DeclareOption{pagebackref}{%
   \PassOptionsToPackage{pagebackref}{hyperref}}
\DeclareOption{pdfauthor}{%
   \PassOptionsToPackage{pdfauthor}{hyperref}}
\DeclareOption{pdfborder}{%
   \PassOptionsToPackage{pdfborder}{hyperref}}
\DeclareOption{pdfcenterwindow}{%
   \PassOptionsToPackage{pdfcenterwindow}{hyperref}}
\DeclareOption{pdfcreator}{%
   \PassOptionsToPackage{pdfcreator}{hyperref}}
\DeclareOption{pdfdirection}{%
   \PassOptionsToPackage{pdfdirection}{hyperref}}
\DeclareOption{pdfdisplaydoctitle}{%
   \PassOptionsToPackage{pdfdisplaydoctitle}{hyperref}}
\DeclareOption{pdfduplex}{%
   \PassOptionsToPackage{pdfduplex}{hyperref}}
\DeclareOption{pdffitwindow}{%
   \PassOptionsToPackage{pdffitwindow}{hyperref}}
\DeclareOption{pdfhighlight}{%
   \PassOptionsToPackage{pdfhighlight}{hyperref}}
\DeclareOption{pdfinfo}{%
   \PassOptionsToPackage{pdfinfo}{hyperref}}
\DeclareOption{pdfkeywords}{%
   \PassOptionsToPackage{pdfkeywords}{hyperref}}
\DeclareOption{pdflang}{%
   \PassOptionsToPackage{pdflang}{hyperref}}
\DeclareOption{pdfmark}{%
   \PassOptionsToPackage{pdfmark}{hyperref}}
\DeclareOption{pdfmenubar}{%
   \PassOptionsToPackage{pdfmenubar}{hyperref}}
\DeclareOption{pdfnewwindow}{%
   \PassOptionsToPackage{pdfnewwindow}{hyperref}}
\DeclareOption{pdfnonfullscreenpagemode}{%
   \PassOptionsToPackage{pdfnonfullscreenpagemode}{hyperref}}
\DeclareOption{pdfnumcopies}{%
   \PassOptionsToPackage{pdfnumcopies}{hyperref}}
\DeclareOption{pdfpagelayout}{%
   \PassOptionsToPackage{pdfpagelayout}{hyperref}}
\DeclareOption{pdfpagemode}{%
   \PassOptionsToPackage{pdfpagemode}{hyperref}}
\DeclareOption{pdfpagelabels}{%
   \PassOptionsToPackage{pdfpagelabels}{hyperref}}
\DeclareOption{pdfpagescrop}{%
   \PassOptionsToPackage{pdfpagescrop}{hyperref}}
\DeclareOption{pdfpagetransition}{%
   \PassOptionsToPackage{pdfpagetransition}{hyperref}}
\DeclareOption{pdfpicktraybypdfsize}{%
   \PassOptionsToPackage{pdfpicktraybypdfsize}{hyperref}}
\DeclareOption{pdfprintarea}{%
   \PassOptionsToPackage{pdfprintarea}{hyperref}}
\DeclareOption{pdfprintclip}{%
   \PassOptionsToPackage{pdfprintclip}{hyperref}}
\DeclareOption{pdfprintpagerange}{%
   \PassOptionsToPackage{pdfprintpagerange}{hyperref}}
\DeclareOption{pdfprintscaling}{%
   \PassOptionsToPackage{pdfprintscaling}{hyperref}}
\DeclareOption{pdfproducer}{%
   \PassOptionsToPackage{pdfproducer}{hyperref}}
\DeclareOption{pdfstartpage}{%
   \PassOptionsToPackage{pdfstartview}{hyperref}}
\DeclareOption{pdfsubject}{%
   \PassOptionsToPackage{pdfsubject}{hyperref}}
\DeclareOption{pdftex}{%
   \PassOptionsToPackage{pdftex}{hyperref}}
\DeclareOption{pdftitle}{%
   \PassOptionsToPackage{pdftitle}{hyperref}}
\DeclareOption{pdftoolbar}{%
   \PassOptionsToPackage{pdftoolbar}{hyperref}}
\DeclareOption{pdftrapped}{%
   \PassOptionsToPackage{pdftrapped}{hyperref}}
\DeclareOption{pdfview}{%
   \PassOptionsToPackage{pdfview}{hyperref}}
\DeclareOption{pdfviewarea}{%
   \PassOptionsToPackage{pdfviewarea}{hyperref}}
\DeclareOption{pdfviewclip}{%
   \PassOptionsToPackage{pdfviewclip}{hyperref}}
\DeclareOption{pdfwindowui}{%
   \PassOptionsToPackage{pdfwindowui}{hyperref}}
\DeclareOption{plainpages}{%
   \PassOptionsToPackage{plainpages}{hyperref}}
\DeclareOption{ps2pdf}{%
   \PassOptionsToPackage{ps2pdf}{hyperref}}
\DeclareOption{raiselinks}{%
   \PassOptionsToPackage{raiselinks}{hyperref}}
\DeclareOption{runbordercolor}{%
   \PassOptionsToPackage{runbordercolor}{hyperref}}
\DeclareOption{runcolor}{%
   \PassOptionsToPackage{runcolor}{hyperref}}
\DeclareOption{setpagesize}{%
   \PassOptionsToPackage{setpagesize}{hyperref}}
\DeclareOption{tex4ht}{%
   \PassOptionsToPackage{tex4ht}{hyperref}}
\DeclareOption{textures}{%
   \PassOptionsToPackage{textures}{hyperref}}
\DeclareOption{unicode}{%
   \PassOptionsToPackage{unicode}{hyperref}}
\DeclareOption{urlbordercolor}{%
   \PassOptionsToPackage{urlbordercolor}{hyperref}}
\DeclareOption{urlcolor}{%
   \PassOptionsToPackage{urlcolor}{hyperref}}
\DeclareOption{verbose}{%
   \PassOptionsToPackage{verbose}{hyperref}}
\DeclareOption{vtex}{%
   \PassOptionsToPackage{vtex}{hyperref}}
\DeclareOption{xetex}{%
   \PassOptionsToPackage{xetex}{hyperref}}

% End of declaration of options part
% Execution of options part

\ProcessPgfOptions{/ORGART}
\ProcessOptions\relax

% End of execution of options part
% Package loading part

% Base class
\ifthenelse{\boolean{koma}}
{%
  \LoadClass{scrartcl}%
}%
{%
\LoadClass{article}%
}  

% Org-mode default
\ifthenelse{\boolean{ORGART@nofixltx2e}}
{}
{\RequirePackage{fixltx2e}}    
\ifthenelse{\boolean{ORGART@nographicx}}
{}
{\RequirePackage{graphicx}}   
\ifthenelse{\boolean{ORGART@nolongtable}}
{}
{\RequirePackage{longtable}}    
\ifthenelse{\boolean{ORGART@nofloat}}
{}
{\RequirePackage{float}}  
\ifthenelse{\boolean{ORGART@nowrapfig}}
{}
{\RequirePackage{wrapfig}}  
\ifthenelse{\boolean{ORGART@nosoul}}
{}
{\RequirePackage{soul}}  
\ifthenelse{\boolean{ORGART@nofontenc}}
{}
{\RequirePackage[T1]{fontenc}}    % with T1 option for symbol packages
\ifthenelse{\boolean{ORGART@notextcomp}}
{}
{\RequirePackage{textcomp}}  
\ifthenelse{\boolean{ORGART@nomarvosym}}
{}
{\RequirePackage{marvosym}}  
\ifthenelse{\boolean{ORGART@nowasysym}}
{}
{%
  \ifthenelse{\boolean{ORGART@integrals}}%
  {\RequirePackage[integrals]{wasysym}}%
  {\RequirePackage[nointegrals]{wasysym}}%
}  
\ifthenelse{\boolean{ORGART@nolatexsym}}
{}
{\RequirePackage{latexsym}}  
\ifthenelse{\boolean{ORGART@noamssymb}\or\boolean{ORGART@utopia}\or\boolean{ORGART@charter}\or\boolean{ORGART@garamond}\or\boolean{ORGART@times}}
{}
{\RequirePackage{amssymb}}  

% Other packages
% Set the standard LaTeX list environments to their compact counterparts  
\ifthenelse{\boolean{ORGART@paralist}}
  {%
    \RequirePackage{paralist}
    \let\itemize\compactitem%
    \let\description\compactdesc%
    \let\enumerate\compactenum%
  }
  {}  
  \ifthenelse{\boolean{ORGART@microtype}}
{%
  \ifpdf
   \RequirePackage{microtype}
  \fi}%
{}
\ifthenelse{\boolean{ORGART@setspace}}
{\RequirePackage{setspace}}
{}
% \ifthenelse{\boolean{topcapt}}
%   {\RequirePackage{topcapt}}
%   {}
\ifthenelse{\boolean{listings}}
  {\RequirePackage{listings}}
  {}
\ifthenelse{\boolean{color}}
  {\RequirePackage{color}}
  {}
\ifthenelse{\boolean{minted}}
  {\RequirePackage{minted}}
  {}
\ifthenelse{\boolean{gantt}}
{\RequirePackage{pgf, pgfarrows, pgfnodes, tikz}}
{}
 
% Font packages 
\ifthenelse{\boolean{ORGART@times}}
{%
  \ifpdf
  \RequirePackage[T1]{fontenc}
  \RequirePackage{mathptmx} 
  \RequirePackage[scaled=.90]{helvet} 
  \RequirePackage{courier}
  \fi}%
{}
\ifthenelse{\boolean{ORGART@garamond}}
{%
  \ifpdf
   \RequirePackage[T1]{fontenc} 
   \RequirePackage[urw-garamond]{mathdesign}
   \RequirePackage[scaled]{berasans} 
   \RequirePackage{inconsolata} % tt
   \linespread{1.0609}
  \fi}%
{}
\ifthenelse{\boolean{ORGART@palatino}}
{%
  \ifpdf
  \RequirePackage[T1]{fontenc}
  \RequirePackage{mathpazo}% 
  \linespread{1.05}%
  \RequirePackage[scaled]{helvet}%
  \RequirePackage{courier} % tt
  \fi}%
{}  
\ifthenelse{\boolean{ORGART@charter}}
{%
  \ifpdf
   \RequirePackage[T1]{fontenc} 
   \RequirePackage[bitstream-charter]{mathdesign}
   \RequirePackage[scaled=.90]{helvet} 
   \RequirePackage{courier} % tt
  \fi}%
{}  
\ifthenelse{\boolean{ORGART@ctex}}
{%
  \ifpdf
   \RequirePackage[UTF8]{ctex}
   \RequirePackage[T1]{fontenc}
   \RequirePackage[adobe-utopia]{mathdesign}
   \RequirePackage[scaled]{berasans}
   \RequirePackage{inconsolata} % tt
  \fi}%
{}

\ifthenelse{\boolean{ORGART@utopia}}
{%
  \ifpdf
   \RequirePackage[T1]{fontenc} 
   \RequirePackage[adobe-utopia]{mathdesign}
   \RequirePackage[scaled]{berasans} 
   \RequirePackage{inconsolata} % tt
  \fi}%
{}  

% Hyperref asks to be loaded last
\ifthenelse{\boolean{ORGART@nohyperref}}
{\RequirePackage{url}}
{\RequirePackage[unicode]{hyperref}}  

% End of package loading part
%
  % Class code part
  \ifthenelse{\boolean{ORGART@setspace}}%
  {\ifthenelse{\boolean{ORGART@doublespace}}%
  {\doublespacing}%
  {\singlespacing}}%
  {}%
  \ifthenelse{\boolean{listings}}%
  {\lstdefinelanguage{org}%
    {%
      morekeywords={:results, :session, :var, :noweb, :exports},%
      sensitive=false,%
      morestring=[b]",%
      morecomment=[l]{\#},%
    }%
    \lstdefinelanguage{dot}
    {%
      morekeywords={graph},
      sensitive=false,
    }%
    \lstdefinelanguage{ditaa}
    {%
      breaklines=false
    }%
  }%
  {}%  
  \let\proglang=\textsf
  \let\package=\textsf
  \let\classfile=\textsf
  \let\progstruct=\texttt
  \newcommand{\progexample}[1]{{\ttfamily\small #1}}
%  \newcommand\ganttline[4]{% line, tag, start end
%    \node at (0,#1) [anchor=base east] {#2};
%    \fill[black!20!white] (#3/20,#1-.2) rectangle (#4/20,#1+.2);}
%  \newcounter{gantttask}
%  \newcommand{\gantttaskcolour}{blue!50!white}
%  \newcommand{\ganttmilestonecolour}{red!50!white}
%  \newcommand{\ganttdatelinecolour}{black!50!white}
%  \newcommand{\ganttprojecttime}{1}
%  \newcommand{\ganttntasks}{1}
%  \newcommand\gantttask[6]{% label, activity, start, end, labelpos, align
%    \begin{pgfonlayer}{foreground}
%      % \node at (0,\thegantttask) [anchor=base east] {#2};
%      \stepcounter{gantttask}
%      \node [left] at (0,\thegantttask) {#1};
%      \draw[fill=\gantttaskcolour] (#3/\ganttprojecttime,\thegantttask-0.4) rectangle (#4/\ganttprojecttime,\thegantttask +0.4);
%      \node at (#5/\ganttprojecttime,\thegantttask) #6 {#2};
%    \end{pgfonlayer}
%  }
%  \newcommand\ganttpoint[3]{% line, tag, date
%    \node at (0,#1) [anchor=base east] {#2};
%    \fill[black] (#3/\ganttprojecttime,#1) circle (0.1/\ganttprojecttime);
%  }
%  \newcommand\ganttdateline[2]{% tag, date
%    \begin{pgfonlayer}{background}
%      \draw[\ganttdatelinecolour] (#2/\ganttprojecttime,0) -- (#2/\ganttprojecttime,\thegantttask+1);
%      \node at (#2/\ganttprojecttime,0) [above] {#1};
%    \end{pgfonlayer}
%  }
%  \newcommand\ganttmilestone[2]{% tag, date
%    \begin{pgfonlayer}{foreground}
%      \node at (#2/\ganttprojecttime,\thegantttask+1.0) [below] {#1};
%      \draw[black,fill=\ganttmilestonecolour] (#2/\ganttprojecttime-0.1\ganttntasks/\ganttprojecttime,\thegantttask+0.9) rectangle (#2/\ganttprojecttime+0.1\ganttntasks/\ganttprojecttime,\thegantttask+1.1);
%    \end{pgfonlayer}
%  }
%  
%  
  % End of class code part
