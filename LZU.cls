%vim: set ft=latex \NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{LZU}
[2015/023/08  LZU document class]

\LoadClass[chinese,fntef, cs4size, twoside]{ctexbook}
%\AtEndOfPackage{\makeatletter\input{LZU.cfg}\makeatother}
\AtEndOfPackage{\input{LZU.cfg}}

%\RequirePackage{ctex}

%=======page
\RequirePackage[top=3cm, bottom=2.54cm,outer=3.17cm, inner=3.17cm, headheight=2cm, footskip=2cm, heightrounded]{geometry}
%=======font
%\RequirePackage{mathptmx}
\setmainfont{Times New Roman}

%=======package
\RequirePackage{amsmath,amsfonts,amssymb}
\RequirePackage{graphicx}
\RequirePackage[svgnames]{xcolor}

%=======head and foot
\RequirePackage{fancyhdr}  % Needed to define custom headers/footers
\RequirePackage{lastpage}  % Number of pages in the document
\RequirePackage{etoolbox}
\pagestyle{fancy}          % Enables the custom headers/footers

\fancypagestyle{frontmatterstyle}{
    \fancyhf{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot{} % clear all footer fields
    \fancyfoot[LE,RO]{\thepage}
}
\appto\frontmatter{\pagestyle{frontmatterstyle}}

\fancypagestyle{mainmatterstyle}{
    \fancyhf{}
    \lhead{\zihao{-5}兰州大学本科生毕业论文}%
    \rhead{\zihao{-5}\@title}
    % Footers
    \fancyfoot{} % clear all footer fields
    \fancyfoot[LE,RO]{\thepage}
    \renewcommand{\headrulewidth}{0.4pt}% % No header rule
}

\appto\mainmatter{\pagestyle{mainmatterstyle}}
\appto\mainmatter{\linespread{1.3889}\selectfont}
\fancypagestyle{plain}{
    \thispagestyle{mainmatterstyle}
}
\AtBeginDocument{\addtocontents{toc}{\protect\thispagestyle{frontmatterstyle}}}
%\renewcommand{\headrulewidth}{1pt}% % No header rule
%\newcommand{\headrulecolor}[1]{\patchcmd{\headrule}{\hrule}{\color{#1}\hrule}{}{}}
%\headrulecolor{black}

%=======format
%\renewcommand*\figurename{ \zihao{5}\CTEX@figurename}
%\renewcommand*\tablename{ \zihao{5}\CTEX@tablename }
\usepackage[font=small]{caption}

\RequirePackage[titles]{tocloft}
\renewcommand\cftchapdotsep{\cftdotsep}
\renewcommand\cftchapfont{\zihao{4}}
\renewcommand\cftsecfont{\zihao{-4}}
\renewcommand\cftsubsecfont{\zihao{-4}}
%\RequirePackage{titletoc}
%\dottedcontents{chapter}[2cm]{\zihao{4}}{4\ccwd}{0.75pc}
%\dottedcontents{section}[2cm]{\zihao{-4}}{2\ccwd}{0.75pc}
%\dottedcontents{subsection}[2cm+3\ccwd]{\zihao{-4}}{3\ccwd}{0.75pc}
%=======footnote
\RequirePackage{perpage} %the perpage package
\MakePerPage{footnote} %the perpage package command

%=======information
\newtoks\advisor
\newtoks\college
\newtoks\major
\newtoks\grade

%=======english title
\newtoks\entitle
%=======abstract
\newcommand{\ZhAbstract}[2]{%
    \addcontentsline{toc}{chapter}{中文摘要}
    \thispagestyle{frontmatterstyle}
    %\thispagestyle{plain}
    \begin{center}%
        \setlength{\parskip}{24pt}
        \begin{minipage}{0.8\textwidth}
            \linespread{1}
            \centering
            \zihao{3}\fontspec{Arial}\heiti\bfseries \noindent\@title%
        \end{minipage}
    \end{center}%
    \begin{center}%
        \linespread{1}
        \setlength{\parskip}{24pt}
        \zihao{3}\heiti \bfseries 摘\phantom{空}要%
    \end{center}%
    \linespread{1.3889}
    \selectfont
    \setlength{\parskip}{0pt}
    \vspace{10pt}
    \par #1\\\\%
    {\songti \bfseries 关键词：} #2
    \newpage
}

\newcommand{\EnAbstract}[2]{%
    \addcontentsline{toc}{chapter}{英文摘要}
    \thispagestyle{frontmatterstyle}
    \begin{center}%
        \setlength{\parskip}{24pt}
        \begin{minipage}{0.8\textwidth}
            \linespread{1}
            \selectfont
            \centering
            \zihao{3}\fontspec{Arial}\bfseries \noindent \expandafter\MakeUppercase\expandafter{\the\entitle}%
        \end{minipage}
    \end{center}%
    \begin{center}%
        \linespread{1}
        \selectfont
        \setlength{\parskip}{24pt}
        \zihao{3}\fontspec{Arial}\bfseries Abstract%
    \end{center}%
    \setlength{\parskip}{0pt}
    {\zihao{5}
    \linespread{1.27}
    \selectfont
    \vspace{11pt}
    \par #1\\\\%
    {\bfseries \fontspec{Times New Roman Bold}Key Words:} #2}
}
%=======space
%\newcommand\LZUspace{\protect\CTEX@spaceChar}
%\newcommand\LZUspace{\protect\CJK@spaceChar}
\newcommand\LZUspace{\hspace{\ccwd}}

%=======appendix
\newcommand{\Appendix}{%
    %\setcounter{chapter}{16}% Equivalent to "letter P"
    \setcounter{section}{0}
    \renewcommand{\thechapter}{A}%
    \chapter*{附\LZUspace\LZUspace 录}
    \addcontentsline{toc}{chapter}{附\LZUspace\LZUspace 录}
    \zihao{5}
}
\newcommand{\Thanks}{%
    \chapter*{致\LZUspace\LZUspace 谢}
    \addcontentsline{toc}{chapter}{致\LZUspace\LZUspace 谢}
    \zihao{-4}\fangsong
}

% statement
\RequirePackage{array}
\def\LZU@underline[#1]#2{%
\CTEXunderline{\hbox to #1{\hfill#2\hfill}}}
\def\LZUunderline{\@ifnextchar[\LZU@underline\CTEXunderline}

%\RequirePackage[thinlines]{easytable}

%\newcolumntype{M}[1]{>{\centering\arraybackslash}m{#1}}
%\newcolumntype{N}{@{}m{0pt}@{}}
\RequirePackage{makecell}
%\RequirePackage{pgffor}
\RequirePackage{forloop}
\RequirePackage{xstring}
\renewcommand\maketitle{%
    \cleardoublepage
    \thispagestyle{empty}
    \begin{center}

    % Requires \usepackage{graphicx}
        \includegraphics[width=6cm]{pic/lzu.eps}\\

        \vspace{\stretch{1}}

        {\fontsize{28bp}{0pt}\ziju{1}\CJKfontspec{微软雅黑-Bold}\LZU@label@thesis}
        \vskip \stretch{1.5}
    %\vspace{\stretch{1}}
        \zihao{-3}
        \def\tabcolsep{6pt}
    %\begin{TAB}(r,0.5cm,1.25cm){ll}{ccccccc}
        \expandarg
        \newcounter{ct}
        \begin{tabular}{ll}
            \LZU@label@titleZh
            \forloop{ct}{1}{\value{ct}<6}{%
                \StrFindGroup{\@title}{\value{ct}}[\mygroup]%
                \IfStrEq{\mygroup}{}{}{%
                    & {\StrFindGroup{\@title}{\value{ct}}[\mygroup]\LZUunderline[320pt]{\bfseries\fontspec{Times New Roman}\zihao{3}\mygroup}}\\[0.48cm]%
                }%
            }%
            \LZU@label@titleEn
            \forloop{ct}{1}{\value{ct}<6}{%
                \StrFindGroup{\the\entitle}{\value{ct}}[\mygroup]%
                \IfStrEq{\mygroup}{}{}{%
                    & {\StrFindGroup{\the\entitle}{\value{ct}}[\mygroup]\LZUunderline[320pt]{\fontspec{Times New Roman-Bold}\zihao{3}\mygroup}}\\[0.48cm]%
                }%
            }%
            \LZU@label@author &
            {\LZUunderline[320pt]{\@author}}\\[0.48cm]
            \LZU@label@advisor &
            {\LZUunderline[320pt]{\the\advisor}} \\[0.48cm]
            \LZU@label@college &
            {\LZUunderline[320pt]{\the\college}} \\[0.48cm]
            \LZU@label@major &
            {\LZUunderline[320pt]{\the\major}}\\[0.48cm]
            \LZU@label@grade&
            {\LZUunderline[320pt]{\the\grade}}\\[0.48cm]
        \end{tabular}
    %\vspace{\stretch{1}}
        \vskip \stretch{1}
        {\CJKfontspec{微软雅黑}\ziju{0.3}\zihao{-4}\LZU@label@schooladdress }
    \end{center}
    \clearpage
}

\newcommand\makestatement{
    \newcommand\fifth{0.2\textwidth}
    \newcommand\middlespace{0.08\textwidth}

    \thispagestyle{empty}
%\cleardoublepage
    \baselineskip 22.5pt
    \parskip 0pt

    \begin{center}
        {\bfseries\songti\zihao{3}{诚信责任书}}
    \end{center}

    本人郑重声明:本人所呈交的学位论文,是在导师的指导下独立进行研究所取得的成果。毕业论文(设计)中凡引用他人已经发表或未发表的成果、数据、观点等, 均已明确注明出处。除文中已经注明引用的内容外, 不包含任何其他个人或集体已经发表或在网上发表的论文。

    本声明的法律责任由本人承担。

    \vskip1cm

    \begin{center}
        \begin{tabular*}{\textwidth}{rm{\fifth}lm{\fifth} cm{\fifth}rp{\fifth}lm{\fifth}}
            论\hfill 文\hfill 作\hfill 者\hfill 签\hfill 名 ：&\LZUunderline[\fifth]{} & \hspace{\middlespace} & 日\hfill 期：&\LZUunderline[\fifth]{}
        \end{tabular*}
    \end{center}

    \vskip2.0cm

    \begin{center}
        {\bfseries\songti\zihao{3}{关于毕业论文（设计）使用授权的声明}}
    \end{center}

    本人在导师指导下所完成的论文及相关的职务作品，知识产权归属兰州大学。本人完全了解兰州大学有关保存、使用毕业论文的规定，同意学校保存或向国家有关部门或机构送交论文的纸质版和电子版，允许论文被查阅和借阅；本人授权兰州大学可以将本毕业论文的全部或部分内容编入有关数据库进行检索，可以采用任何复制手段保存和汇编本毕业论文。本人离校后发表、使用毕业论文或与该论文直接相关的学术论文或成果时，第一署名单位仍然为兰州大学。

    本学位论文研究内容：

    $\square$ 可以公开

    $\square$ 不宜公开，已在学位办公室办理保密申请，解密后适用本授权书。

%（请在以上选项内选择其中一项打“$\surd$”）
    （请在以上选项内选择其中一项打“$\checkmark$”）

    \vskip1cm
    \begin{center}
        \begin{tabular*}{\textwidth}{rm{\fifth}lm{\fifth}cm{\fifth}rp{\fifth}lm{\fifth}}
            论\hfill 文\hfill 作\hfill 者\hfill 签\hfill 名 ：&\LZUunderline[\fifth]{} & \hspace{\middlespace} &  导\hfill 师\hfill 签\hfill 名 ：&\LZUunderline[\fifth]{} \\
            日\hfill 期：&\LZUunderline[\fifth]{} & \hspace{\middlespace} & 日\hfill 期：&\LZUunderline[\fifth]{}
        \end{tabular*}
    \end{center}
    \clearpage
}


%---------------------------
%hyperlink
%---------------------------
\RequirePackage[unicode,psdextra]{hyperref} % Required for hyperlinks
\hypersetup{hidelinks,breaklinks=true,bookmarksopen=false,pdftitle={Title},pdfauthor={Author}}
%自动写入pdf信息
\AtBeginDocument{
    \hypersetup{
        pdftitle = {\@title},
        pdfauthor = {\@author},
        pdfsubject = {兰州大学本科毕业论文}
    }
}
%\hypersetup{hidelinks,colorlinks,breaklinks=true,bookmarksopen=false,pdftitle={Title},pdfauthor={Author}}
\RequirePackage[nameinlink]{cleveref}
\renewcommand{\figureautorefname}{图}
\crefformat{equation}{#2式(#1)#3}
\crefformat{figure}{#2图#1#3}
\crefformat{table}{#2表#1#3}
\crefformat{chapter}{#2第\zhnumber{#1}章#3}
\crefformat{section}{#2#1节#3}
\crefformat{subsection}{#2#1条#3}
\crefformat{subsubsection}{#2#1款#3}

%grade
\RequirePackage{tabularx}
\newcommand{\Grade}{
    %\chapter*{论文成绩}
%\addcontentsline{论文成绩}
    \addcontentsline{toc}{chapter}{论文成绩}
    \begin{center}
        {\zihao{3}\heiti 论文成绩}
        \zihao{-3}\bfseries\songti
        \begin{tabularx}{\textwidth}{|X|}
            \hline
            导师评语\\[11cm]
            建议成绩\underline{\hspace{80pt}}\hfill 指导教师（签字）\underline{\hspace{80pt}}\\
            \hline
            答辩小组意见\vskip \stretch{1}\\[2cm]
            \hfill 答辩委员会负责人(签字)\underline{\hspace{80pt}}\\
            \hline
            \vskip \stretch{1}\\[2cm]
            成绩\underline{\hspace{80pt}}\hfill 学院（盖章）\underline{\hspace{80pt}}\\
            \hfill{\zihao{-4}年\hspace{20pt}月\hspace{20pt}日}\\
            \hline
        \end{tabularx}
    \end{center}
}

%item style
\usepackage{enumitem}
\setenumerate[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}
\setitemize[1]{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=0pt}
\setdescription{itemsep=0pt,partopsep=0pt,parsep=\parskip,topsep=5pt}

%math theorem
\RequirePackage[amsmath,thmmarks,hyperref]{ntheorem}
\theorembodyfont{\rmfamily\songti}
\theoremheaderfont{\rmfamily\heiti}
%\theoremsymbol{\ensuremath{\blacksquare}}
\theoremsymbol{\ensuremath{\square}}
%\theoremstyle{nonumberplain}
\newtheorem*{proof}{证明}
\theoremstyle{plain}
\theoremsymbol{}
\qedsymbol{\ensuremath{\square}}
%\theoremseparator{：}
\newtheorem{assumption}{假设}[chapter]
\newtheorem{definition}{定义}[chapter]
\newtheorem{proposition}{命题}[chapter]
\newtheorem{lemma}{引理}[chapter]
\newtheorem{theorem}{定理}[chapter]
\newtheorem{axiom}{公理}[chapter]
\newtheorem{corollary}{推论}[chapter]
\newtheorem{example}{例}[chapter]
\newtheorem{conjecture}{猜想}[chapter]

\crefname{theorem}{定理}{定理}
\crefname{assumption}{假设}{假设}
\crefname{definition}{定义}{定义}
\crefname{proposition}{命题}{命题}
\crefname{lemma}{引理}{引理}
\crefname{theorem}{定理}{定理}
\crefname{axiom}{公理}{公理}
\crefname{corollary}{推论}{推论}
\crefname{example}{例}{例}
\crefname{remark}{注释}{注释}
\crefname{conjecture}{猜想}{猜想}
