%vim: set ft=latex \NeedsTeXFormat{LaTeX2e}[1995/12/01]
\ProvidesClass{LZU}
[2015/023/08  LZU document class]

\LoadClass[chinese,fntef, cs4size, twoside]{ctexbook}
\AtEndOfPackage{\makeatletter\input{LZU.cfg}\makeatother}

%\RequirePackage{ctex}

%=======page
\RequirePackage[top=3cm, bottom=2.54cm,outer=3.17cm, inner=3.17cm, headheight=2cm, footskip=2cm, heightrounded]{geometry}
%=======font
\RequirePackage{mathptmx}

%=======package
\RequirePackage{amsmath,amsthm,amsfonts,amssymb,bm}
\RequirePackage{graphicx}
\RequirePackage[svgnames]{xcolor}


%=======head and foot
\RequirePackage{fancyhdr}  % Needed to define custom headers/footers
\RequirePackage{lastpage}  % Number of pages in the document
\RequirePackage{etoolbox}
\pagestyle{fancy}          % Enables the custom headers/footers
\fancyhf{}
\lhead{\zihao{-5}兰州大学本科生毕业论文}%
\rhead{\zihao{-5}\@title}
% Footers
\fancyfoot{} % clear all footer fields
\fancyfoot[LE,RO]{\thepage}
\fancypagestyle{plain}{
    \thispagestyle{fancy}          % Enables the custom headers/footers
}
\fancypagestyle{nohead}{
    \fancyhead{}
    \renewcommand{\headrulewidth}{0pt}
    \fancyfoot{} % clear all footer fields
    \fancyfoot[LE,RO]{\thepage}
}
%\renewcommand{\headrulewidth}{1pt}% % No header rule
%\newcommand{\headrulecolor}[1]{\patchcmd{\headrule}{\hrule}{\color{#1}\hrule}{}{}}
%\headrulecolor{black}


%=======format
%\renewcommand*\figurename{ \zihao{5}\CTEX@figurename}
%\renewcommand*\tablename{ \zihao{5}\CTEX@tablename }
\usepackage[font=small]{caption}

\RequirePackage{titletoc}
\dottedcontents{chapter}[3.5\ccwd]{\zihao{4}}{4\ccwd}{100\ccwd}
\dottedcontents{chapter}[3.5\ccwd]{\zihao{4}}{4\ccwd}{0.75pc}

%=======footnote
\RequirePackage{perpage} %the perpage package
\MakePerPage{footnote} %the perpage package command

%=======english title
\newtoks\entitle
%=======abstract
\newcommand{\ZhAbstract}[2]{%
    \addcontentsline{toc}{chapter}{中文摘要}
    \thispagestyle{nohead}
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
        \setlength{\parskip}{18pt}
        \zihao{3}\heiti \bfseries 摘\phantom{空}要%
    \end{center}%
    {
        \setlength{\parskip}{0pt}
        \linespread{1.3889}
        \par #1\\\\%
        {\songti \bfseries 关键词：} #2
    }
    \newpage
}

\newcommand{\EnAbstract}[2]{%
    \addcontentsline{toc}{chapter}{英文摘要}
    \thispagestyle{nohead}
    \begin{center}%
        \setlength{\parskip}{24pt}
        \begin{minipage}{0.8\textwidth}
            \linespread{1}
            \centering
            \zihao{3}\fontspec{Arial}\bfseries \noindent \the\entitle%
        \end{minipage}
    \end{center}%
    \begin{center}%
        \linespread{1}
        \setlength{\parskip}{18pt}
        \zihao{3}\fontspec{Arial}\bfseries Abstract%
    \end{center}%
    {
        \setlength{\parskip}{0pt}
        \zihao{5}
        \linespread{1.3889}
        \par #1\\\\%
        {\bfseries \fontspec{Times New Roman Bold}Key Words:} #2
    }
}
%=======space
%\newcommand\LZUspace{\protect\CTEX@spaceChar}
%\newcommand\LZUspace{\protect\CJK@spaceChar}
\newcommand\LZUspace{\hspace{\ccwd}}

%=======appendix
\newcommand{\Appendix}{%
    \chapter*{附\LZUspace\LZUspace 录}
    \addcontentsline{toc}{chapter}{附\LZUspace\LZUspace 录}
    \zihao{5}
}
\newcommand{\Thanks}{%
    \chapter*{感\LZUspace\LZUspace 谢}
    \addcontentsline{toc}{chapter}{感\LZUspace\LZUspace 谢}
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
            {\LZUunderline[320pt]{\LZU@value@author}}\\[0.48cm]
            \LZU@label@advisor &
            {\LZUunderline[320pt]{\LZU@value@advisor}} \\[0.48cm]
            \LZU@label@college &
            {\LZUunderline[320pt]{\LZU@value@college}} \\[0.48cm]
            \LZU@label@major &
            {\LZUunderline[320pt]{\LZU@value@major}}\\[0.48cm]
            \LZU@label@grade&
            {\LZUunderline[320pt]{\LZU@value@grade}}\\[0.48cm]
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
        {\bfseries\zihao{3}{诚~~信~~责~~任~~书}}
    \end{center}

    本人郑重声明：本人所呈交的学位论文，是在导师的指导下独立进行研究所取得的成果。毕业论文（设计）中凡引用他人已经发表或未发表的成果、数据、观点等,均已明确注明出处。除文中已经注明引用的内容外,不包含任何其他个人或集体已经发表或在网上发表的论文。

    本声明的法律责任由本人承担。

    \vskip1cm

    \begin{center}
        \begin{tabular*}{\textwidth}{rm{\fifth}lm{\fifth} cm{\fifth}rp{\fifth}lm{\fifth}}
            论\hfill 文\hfill 作\hfill 者\hfill 签\hfill 名 ：&\LZUunderline[\fifth]{} & \hspace{\middlespace} & 日\hfill 期：&\LZUunderline[\fifth]{} 
        \end{tabular*}
    \end{center}

    \vskip2.0cm

    \begin{center}
        {\bfseries\zihao{3}{关于毕业论文（设计）使用授权的声明}}
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
%\hypersetup{hidelinks,colorlinks,breaklinks=true,bookmarksopen=false,pdftitle={Title},pdfauthor={Author}}
\RequirePackage[nameinlink]{cleveref}

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
