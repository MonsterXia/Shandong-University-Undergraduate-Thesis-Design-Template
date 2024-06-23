% !Mode:: "TeX:UTF-8"
\NeedsTeXFormat{LaTeX2e}[1999/12/01]
\ProvidesClass{sduthesis}[2015/05/12 v1.0.5 Shandong University Thesis Template for Postgraduate]
%------解决表格换行问题-------
\newcommand{\tabincell}[2]{\begin{tabular}{@{}#1@{}}#2\end{tabular}} 
%------解决表格换行问题-------

% ----- KVoptions Packages -----
\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=SDU, prefix=SDU@opt@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{SDU}{#1}}

% ----- Declare Options -----
% ----- CHSstyle
\DeclareBoolOption[true]{chsstyle}
\DeclareComplementaryOption{nochsstyle}{chsstyle}
% ----- draft/print
\DeclareBoolOption[false]{print}
\DeclareComplementaryOption{noprint}{print}
% ----- double/single
\DeclareBoolOption[true]{double}
\DeclareComplementaryOption{single}{double}
% ----- Default Options
\DeclareDefaultOption{\PassOptionsToPackage{\CurrentOption}{ctex}}
% A4纸张大小，书记格式
\LoadClass[a4paper, 12pt]{book}
\ProcessKeyvalOptions*\relax

\ifSDU@opt@double\relax\else
    \PassOptionsToClass{openany}{book}
    \let\cleardoublepage\clearpage
\fi
%------print------

%------中文支持------
\RequirePackage[ noindent, scheme=plain, UTF8, heading]{ctex}
%----字体名
\RequirePackage{ifpdf,ifxetex}
\ifpdf
	\newcommand{\fzbHei}{\heiti}
\else
	\newcommand{\fzbHei}{\heiti}
\fi
%------中文支持------

%------行距------
\linespread{1.5}
\addtolength{\parskip}{.3ex}
%------行距------

%------页面设置------
\ifSDU@opt@double
	\newcommand{\GeoOptions}{left=2.5cm, right=2.5cm, top=3cm, bottom=3cm}
\else
	\newcommand{\GeoOptions}{left=2.5cm, right=2.5cm, top=3cm, bottom=3cm}
\fi
\RequirePackage[\GeoOptions]{geometry}
%------页面设置------

%------页眉页脚------
\RequirePackage{fancyhdr}
%----清除设置----
\pagestyle{fancyplain}
\fancyhf{}
%----清除设置----

%----页眉划线----
\newcommand{\makeheadrule}{%
\makebox[0pt][l]{\rule[.7\baselineskip]{\headwidth}{0.8pt}}%
\rule[0.85\baselineskip]{\headwidth}{1.5pt}\vskip-.8\baselineskip}

\makeatletter
\renewcommand{\headrule}{%
{\if@fancyplain\let\headrulewidth\plainheadrulewidth\fi
\makeheadrule}}
\makeatother
%----页眉划线----

%----眉脚内容----
% ----------页眉----------
\pagestyle{fancy}
\fancyhf{}
\makeatletter
\ifSDU@opt@chsstyle
\chead{\zihao{-5}\the\ThesisHeader}
\makeatother
% ----------页脚----------
\cfoot{--{~\thepage~}--}  % 页码居中显示
% \fancyfoot[LE,RO]{--{~\thepage~}--}   % 页码居外侧显示
%----眉脚内容----
%------页眉页脚------

%------数学支持------
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amsthm}
\RequirePackage{amssymb}
\RequirePackage{amsbsy}
\RequirePackage{bm}
\RequirePackage{mathrsfs}
\newcommand*{\me}{\ensuremath{\mathrm{e}}}				%自然对数的底
\newcommand*{\mi}{\ensuremath{\mathrm{i}}}				%虚数单位
\newcommand*{\dif}{\ensuremath{\,\mathrm{d}}}			%微分算子
\DeclareMathAlphabet{\mathsfsl}{OT1}{cmss}{m}{sl}
\newcommand*{\VEC}[1]{\ensuremath{\boldsymbol{#1}}}		%向量
\newcommand*{\MATRIX}[1]{\ensuremath{\mathsfsl{#1}}}	%矩阵名称
\newcommand*{\TENSOR}[1]{\ensuremath{\mathsfsl{#1}}}	%张量名称
\newcommand*{\HUA}[1]{\ensuremath{\mathscr{{#1}}}} 		%输出花体字母
\newcommand*{\SHUANG}[1]{\ensuremath{\mathbb{{#1}}}}	%输出双线字母
\numberwithin{equation}{chapter}						%公式编号随section变化
%------数学支持------

%------图表支持------

\RequirePackage{graphicx}
%----图档搜索路径----
\graphicspath{{figures/}{figure/}{pictures/}{picture/}{pic/}{pics/}{image/}{images/}}
%----图档搜索路径----
\RequirePackage{booktabs}
%%----表格行距----
%\renewcommand\arraystretch{1.3}
%%----表格行距----
%----编号----
\RequirePackage{amsmath}
\numberwithin{figure}{chapter}
\numberwithin{table}{chapter}
%----编号----
%----不浮动----
\makeatletter
\newcommand{\figcaption}{\def\@captype{figure}\captionsetup{labelsep=space}\caption}
\newcommand{\tabcaption}{\def\@captype{table}\captionsetup{labelsep=space}\caption}
% \newcommand{\figcaption}{\def\@captype{figure}\caption}
% \newcommand{\tabcaption}{\def\@captype{table}\caption}
\makeatother
%----不浮动----
%------图表支持------

%------交叉引用------
\RequirePackage{hyperref}
\hypersetup{unicode}
\hypersetup{colorlinks=true}
\hypersetup{linkcolor=black}
\makeatletter
\ifSDU@opt@print
	\hypersetup{allcolors=black}
\else\relax\fi
\makeatother
%------交叉引用------

%--------目录-------------
\makeatletter
\def\@bfdottedtocline#1#2#3#4#5{%
\ifnum #1>\c@tocdepth \else
  \vskip \z@ \@plus.2\p@
  {\leftskip #2\relax \rightskip \@tocrmarg \parfillskip -\rightskip
   \parindent #2\relax\@afterindenttrue
   \interlinepenalty\@M
   \leavevmode \bfseries
   \@tempdima #3\relax
   \advance\leftskip \@tempdima \null\nobreak\hskip -\leftskip
   {#4}\normalfont\nobreak
   \leaders\hbox{$\m@th
      \mkern \@dotsep mu\hbox{.}\mkern \@dotsep
      mu$}\hfill
   \nobreak
   \hb@xt@\@pnumwidth{\hfil\normalfont \normalcolor #5}%
   \par}%
\fi}
\renewcommand*\l@chapter{\@bfdottedtocline{0}{0em}{1.5em}}
\makeatother
%--------目录-------------

%------摘要环境------
\newcommand\enabstractname{ABSTRACT}
\newcommand\enkeywordsname{Key Words}
\newcommand\enkeywords[1]{\vspace{1cm}\noindent{\bfseries\zihao{-4}\enkeywordsname: }#1}
\newenvironment{enabstract}{%
    \newpage
    \phantomsection
    \fancyfoot{}
    \vspace*{0.8\baselineskip}
        \centerline{\zihao{-3}\bfseries\enabstractname}
    \vspace*{0.5\baselineskip}
\setlength{\parindent}{2em}
}{
    \clearpage 
}

\newcommand\cnabstractname{摘\hspace{2em}要}
\newcommand\cnkeywordsname{关键词}
\newcommand\cnkeywords[1]{\vspace{1cm}\noindent{\bfseries\zihao{-4}\cnkeywordsname: }#1}
\newenvironment{cnabstract}{%
    \newpage
    \phantomsection
    \fancyfoot{}
    \vspace*{0.8\baselineskip}
	\centerline{\zihao{-2}\heiti\bfseries\cnabstractname} %20150305 ADD%
    \vspace*{0.5\baselineskip}
	\setlength{\parindent}{2em}
	\zihao{-4}\songti
}{
    \clearpage
}
%------摘要环境------

%------中文风格------
\makeatletter
\ifSDU@opt@chsstyle
%----标题与日期----
\CTEXoptions[figurename={图},tablename={表}]
\CTEXoptions[today=small]
%----标题与日期----
%----章节样式----

%--contents
\ctexset{
  contentsname = {\centering\zihao{-2}\heiti\bfseries 目\hspace{2em}录},
}
%--contents

%--reference
% \ctexset{
%   bibname = {\centering\zihao{-2}\heiti\bfseries 参考文献},
% }
\usepackage[backend=biber, style=gb7714-2015, gbpub=false, doi=false]{biblatex}
\addbibresource[location=local]{contents/reference.bib}
\defbibheading{myheading}[参考文献]{%
  \chapter*{\centering\bfseries\heiti\zihao{-2}#1}
  \addcontentsline{toc}{chapter}{#1}
  {\zihao{5}\selectfont}
}
\AtBeginBibliography{\zihao{5}\linespread{1}\selectfont}
%--reference

%--chapter
\CTEXsetup[name={第,章}]{chapter}
\CTEXsetup[number={\chinese{chapter}}]{chapter}
\CTEXsetup[format={\centering}]{chapter}
\CTEXsetup[nameformat={\bfseries\zihao{3}}]{chapter}
\CTEXsetup[titleformat={\bfseries\zihao{3}}]{chapter}
\CTEXsetup[aftername={\quad{}}]{chapter}
\CTEXsetup[beforeskip={0.8\baselineskip}]{chapter}
\CTEXsetup[afterskip={0.5\baselineskip}]{chapter}
%--section
% \CTEXsetup[name={$\S$\,,}]{section} % 去掉章节前的双S花符号
\CTEXsetup[format={\bfseries\flushleft\zihao{4}}]{section}
\CTEXsetup[beforeskip={0.5\baselineskip}]{section}
\CTEXsetup[afterskip={0.5\baselineskip}]{section}
%--subsection
\CTEXsetup[format={\bfseries\flushleft\zihao{-4}}]{subsection}
%--subsubsection
\CTEXsetup[format={\flushleft\zihao{-4}}]{subsubsection}
%--appendix
\newcommand{\startappendices}{  
  \appendix  
  \renewcommand{\thechapter}{\Alph{chapter}}  
  \setcounter{chapter}{0}  
  \CTEXsetup[  
    name={附录~,},  
    number=\thechapter,  
    beforeskip=0.8\baselineskip plus .2ex minus .2ex,  
    afterskip=0.5\baselineskip plus .2ex, 
    indent=1em,  
    format={\centering\zihao{-2}\heiti\bfseries}  
  ]{chapter}  
} 

%----------致谢---------------------
\newcommand{\acknowledgment}
{
    \clearpage
    \phantomsection	
    \vspace*{0.8\baselineskip}
	\centerline{\zihao{-2}\heiti\bfseries{致\hspace{2em}谢}} %20150305 ADD%
    \vspace*{0.5\baselineskip}
	\addcontentsline{toc}{chapter}{致\quad{}谢} %使目录中以章级别显示“致谢”
	\addcontentsline{toe}{chapter}{Acknowledgement}
    \setlength{\parindent}{2em}
	\zihao{-4}\songti
}{
\clearpage
}
%----------致谢---------------------

%----章节样式----
%----首行缩进----
\RequirePackage{indentfirst}
%----首行缩进----
\else\relax\fi
\makeatletter
%------中文风格------

%------封面------
\input{sduthesis-front-cover.def}
%------封面------
 
%------声明------
\input{sduthesis-statement.def}
%------声明------

%------Make------
\newcommand{\maketitlepagestatement}{%  
  \maketitlepage  
  \thispagestyle{empty}  
  \clearpage % 强制分页并清空浮动体  
  \makestatement  
  \clearpage % 再次强制分页并清空浮动体  
  \setcounter{page}{1} % 重置页码计数器  
}  


\newcommand{\maketableofcontents}{%
    \pagenumbering{Roman}
    \tableofcontents
    \ifSDU@opt@double
        \cleardoublepage
    \else
        \clearpage
    \fi
}
%------Make------
\endinput

%------载入宏包------
%--中文支持
ctex
%--页面设置
geometry
%--页眉页脚
fancyhdr
%--数学支持
amsmath
amsfonts
amsthm
amssymb
amsbsy
bm
mathrsfs
%--图表
graphicx
booktabs
amsmath
%------载入宏包------
