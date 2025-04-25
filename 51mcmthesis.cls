\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{51mcmthesis}[2025/04/26 v1.0 Standard LaTex Template for 51MCM]

%% Inital Code
\newif\if@mcm@bwprint\@mcm@bwprintfalse
\newif\if@mcm@preface\@mcm@prefacetrue

%% Declaration of Options
\DeclareOption{colorprint}{\@mcm@bwprintfalse}
\DeclareOption{bwprint}{\@mcm@bwprinttrue}
\DeclareOption{withoutpreface}{\@mcm@prefacefalse}
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

%% Executing of Options
\ExecuteOptions{colorprint}
\ProcessOptions\relax

\LoadClass[a4paper,12pt]{article}

\RequirePackage{ifxetex}
\RequireXeTeX
\ifxetex\else
    \ClassError{51mcmthesis}{XeTeX is required}{}\fi

% Required packages
\RequirePackage{ctex}
% 页面布局
\RequirePackage{geometry}
% 数学宏包
\RequirePackage{amsmath}
\RequirePackage{amsfonts}
\RequirePackage{amssymb}
\RequirePackage{bm}
%\RequirePackage{titletoc}
% 设置颜色
\RequirePackage{xcolor}
% 插入图片
\RequirePackage{graphicx}
\RequirePackage{float}
% 表格
\RequirePackage{array}
%% 长表格
\RequirePackage{longtable}
%% booktabs 提供了\toprule 等命令.
\RequirePackage{booktabs,tabularx}
%% multirow 支持在表格中跨行
\RequirePackage{multirow}
%% 调整间隔, 让表格更好看些
\RequirePackage{bigstrut}
%% 在跨行表格中输入定界符
\RequirePackage{bigdelim}
% 保护脆落命令
\RequirePackage{cprotect}
% 设置代码环境
\RequirePackage{listings}
\RequirePackage{xcolor}
% 插入链接
\RequirePackage{url}
% 绘图的包
%\RequirePackage{tikz}
%\usetikzlibrary{snakes}

\geometry{top=25.4mm,bottom=25.4mm,left=30.8mm,right=26.8mm} % 页面布局 上:25.4mm, 下:25.4mm, 左:30.8mm, 右:26.8mm

% 4. 字号定义
\newcommand{\erhao}{\fontsize{22pt}{\baselineskip}\selectfont}      % 二号
\newcommand{\xiaoerhao}{\fontsize{18pt}{\baselineskip}\selectfont}  % 小二号
\newcommand{\sanhao}{\fontsize{16pt}{\baselineskip}\selectfont}  % 三号
\newcommand{\xiaosanhao}{\fontsize{15pt}{\baselineskip}\selectfont}  % 小三号
\newcommand{\sihao}{\fontsize{14pt}{\baselineskip}\selectfont}       % 四号
\newcommand{\xiaosihao}{\fontsize{12pt}{\baselineskip}\selectfont}  % 小四号
\newcommand{\wuhao}{\fontsize{10.5pt}{\baselineskip}\selectfont}    % 五号
\newcommand{\xiaowuhao}{\fontsize{9pt}{\baselineskip}\selectfont}   % 小五号
\newcommand{\liuhao}{\fontsize{7.5pt}{\baselineskip}\selectfont}  % 六号
\newcommand{\qihao}{\fontsize{5.5pt}{\baselineskip}\selectfont}    % 七号

% 定义存储内容的命令
\newcommand{\tihao}[1]{\def\@tihao{#1}}
\newcommand{\duihao}[1]{\def\@duihao{#1}}
\newcommand{\zubie}[1]{\def\@zubie{#1}}
\newcommand{\schoolname}[1]{\def\@schoolname{#1}}
\newcommand{\membera}[1]{\def\@membera{#1}}
\newcommand{\memberb}[1]{\def\@memberb{#1}}
\newcommand{\memberc}[1]{\def\@memberc{#1}}
\newcommand{\email}[1]{\def\@email{#1}}
\newcommand{\phone}[1]{\def\@phone{#1}}
\newcommand\mcm@tokens@keywords{}

% 设置字体
\setmainfont{Times New Roman}
%\setmonofont{Courier New}
\setsansfont{Arial}
\setCJKfamilyfont{kai}[AutoFakeBold]{SimSun}
\newcommand*{\kai}{\CJKfamily{kai}}
\setCJKfamilyfont{song}[AutoFakeBold]{SimSun}
\newcommand*{\song}{\CJKfamily{song}}
\renewcommand{\songti}{\CJKfamily{song}}
\setCJKfamilyfont{yahei}[AutoFakeBold]{Microsoft YaHei}
\newcommand{\yahei}{\CJKfamily{yahei}}

\newcommand{\stextbf}[1]{{\songti\bfseries #1}}

% 6. 文档环境
\AtBeginDocument{%
    \setlength{\parindent}{2em}% 首行缩进两字符
}


\def\@maketitle{
    \thispagestyle{empty}
    {
        \begin{center}
            \yahei\xiaoerhao\noindent 五一数学建模竞赛\par
            \yahei\sanhao\noindent 承\quad 诺\quad 书
        \end{center}
        \CommitmentDeclaration
        \clearpage
    }
    \setcounter{page}{1}
    {
        \begin{center}
            \yahei\xiaoerhao\textbf{五 \! 一 \! 数 \! 学 \! 建 \! 模 \! 竞 \! 赛}\\ \vspace{10pt}
            \includegraphics{51mcm.png} \\ \vspace{1em}

            \songti\sihao \textbf{题目：} \underline{\makebox[20em][c]{\@title}}
        \end{center}
    }
}
%% 定义摘要环境
\renewenvironment{abstract}{%}
    \noindent
    \if@twocolumn
        \section*{\abstractname}%
    \else
        % 与上一行间距
        {\xiaosihao\bfseries\songti 摘\quad 要：}%
        \quotation
    \fi}
{\if@twocolumn\else\endquotation\newpage\null\fi}
\renewenvironment{quotation}

{\list{}{\listparindent 2em%
        \itemindent \listparindent
        \rightmargin\z@
        \leftmargin\z@
        \parsep \z@ \@plus\p@}%
    \item\relax}
{\endlist}

\newcommand\keywords[1]{%
\renewcommand{\mcm@tokens@keywords}{#1} \par

\noindent\textbf{\xiaosihao\songti 关键词：}~{\xiaosihao\songti\bfseries \mcm@tokens@keywords} \\[0.5em]
}
% 7. 承诺书命令
\newcommand{\CommitmentDeclaration}{%
    % 首行缩进
    \setlength{\parindent}{2em}% 首行缩进两字符
    \setlength{\baselineskip}{20pt}%行距1.5倍
    \songti\xiaosihao\par
    我们仔细阅读了五一数学建模竞赛的竞赛规则。\par
    我们完全明白，在竞赛开始后参赛队员不能以任何方式（包括电话、电子邮件、网上咨询等）与本队以外的任何人（包括指导教师）研究、讨论与赛题有关的问题。\par
    我们知道，抄袭别人的成果是违反竞赛规则的, 如果引用别人的成果或其它公开的资料（包括网上查到的资料），必须按照规定的参考文献的表述方式在正文引用处和参考文献中明确列出。\par
    我们郑重承诺，严格遵守竞赛规则，以保证竞赛的公正、公平性。如有违反竞赛规则的行为，我们愿意承担由此引起的一切后果。\par
    我们授权五一数学建模竞赛组委会，可将我们的论文以任何形式进行公开展示（包括进行网上公示，在书籍、期刊和其他媒体进行正式或非正式发表等）。\par
    % 正文内容
    参赛题号（从A/B/C中选择一项填写）：\underline{\makebox[12.5em][c]{\@tihao}}\par
    参赛队号：\underline{\makebox[25em][c]{\@duihao}}\par
    参赛组别（研究生、本科、专科、高中）：\underline{\makebox[11.5em][c]{\@zubie}}\par
    所属学校（学校全称）：\underline{\makebox[19.5em][c]{\@schoolname}}\par
    参赛队员：
    队员1姓名：\underline{\makebox[16.2em][c]{\@membera}}\par
    \hspace*{5em}队员2姓名：\underline{\makebox[16.2em][c]{\@memberb}}\par
    \hspace*{5em}队员3姓名：\underline{\makebox[16.2em][c]{\@memberc}}\par
    联系方式：Email：\underline{\makebox[11.48em][c]{\@email}}\quad
    联系电话：\underline{\makebox[8.75em][c]{\@phone}}\par
    \begin{flushright}
        日期：\underline{\makebox[2em][c]{\the\year}}年
        \underline{\makebox[2em][c]{\the\month}}月
        \underline{\makebox[2em][c]{\the\day}}日
    \end{flushright}


    % 页底
    \vfill
    \songti\sihao\centering\textbf{（除本页外不允许出现学校及个人信息）}
}

% 中文标题格式设置
% 目录深度
\setcounter{secnumdepth}{3}
% 节标题格式, 居中, 使用\chinese命令修改计数器
\def\@seccntformat#1{\csname the#1\endcsname\ }
\renewcommand\thesection{\chinese{section}、}
\renewcommand\thesubsection{\arabic{section}\thinspace.\thinspace\arabic{subsection}}
\renewcommand\thesubsubsection{\thesubsection\thinspace.\thinspace\arabic{subsubsection}}
\renewcommand\section{\@startsection{section}{1}{\z@}%
 	{-3.5ex \@plus -1ex \@minus -.2ex}%
	{2.3ex \@plus.2ex}%
	{\centering\normalfont\Large\bfseries}}
\renewcommand\subsection{\@startsection{subsection}{2}{\z@}%
	{-3.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\normalfont\large\bfseries}}
\renewcommand\subsubsection{\@startsection{subsubsection}{3}{\z@}%
	{-3.25ex\@plus -1ex \@minus -.2ex}%
	{1.5ex \@plus .2ex}%
	{\normalfont\normalsize\bfseries}}
\renewcommand\paragraph{\@startsection{paragraph}{4}{\z@}%
	{3.25ex \@plus1ex \@minus.2ex}%
	{-1em}%
	{\normalfont\normalsize\bfseries}}
\renewcommand\subparagraph{\@startsection{subparagraph}{5}{\parindent}%
	 {3.25ex \@plus1ex \@minus .2ex}%
	 {-1em}%
	 {\normalfont\normalsize\bfseries}}