\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{NPUResearchProposal}[10/09/2014 NPU Research Proposal.]


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%  西北工业大学博士开题报告模板，从TUCS template修改而来
%  西北工业大学计算机学院 张臻 zhen@zzhang.org
%  All rights reserved
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%\RequirePackage[BoldFont,SlantFont,CJKsetspaces,CJKchecksingle]{xeCJK}

\RequirePackage[no-math]{fontspec}
\RequirePackage{indentfirst}
\RequirePackage{xunicode}% provides unicode character macros
\RequirePackage{xltxtra} % provides some fixes/extras
\RequirePackage{fancyhdr}
\RequirePackage{fancybox}
\RequirePackage{xeCJK} % 使用xeCJK宏包
\RequirePackage{setspace}
\RequirePackage{ifthen,epsfig,graphicx}
\RequirePackage{color}
\RequirePackage{etoolbox}
%\RequirePackage{epstopdf}


% For the cover pages.
\newboolean{cover}
\DeclareOption{cover}{\setboolean{cover}{true}}

%%%%%%%%%%%%%%%%%
% A SAIIP report is a kind of article.
%%%%%%%%%%%%%%%%%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions
\LoadClass[a4paper]{article}
\setmainfont[BoldFont=SimSun,ItalicFont=Times New Roman]{Times New Roman}
%\setsansfont{Times New Roman}
%For chinese fonts
%\setCJKmainfont[BoldFont=SimHei]{SimSun}
\setCJKmonofont{SimSun}% 设置缺省中文字体
\setCJKmainfont[BoldFont=SimHei,ItalicFont=KaiTi_GB2312]{SimSun}   % 设置缺省中文字体
%\newfontfamily\kai{KaiTi}


%%%%%%%%%%%%%%%%
% Add environment for some definations
%%%%%%%%%%%%%%%%

\newtheorem{propos}{命题}
\newtheorem{definition}{定义}
\renewcommand{\refname}{参考文献}
\renewcommand{\figurename}{图}
\renewcommand{\tablename}{表}
%\newtheorem{proof}{Proof}

%%
\pretocmd{\eqref}{公式~}{}{}
\newtoggle{FundReasearch}
\newtoggle{AppResearch}
\newtoggle{EngResearch}
\newtoggle{CroResearch}
\newcommand{\FundReasearch}{\toggletrue{FundReasearch}}
\newcommand{\AppResearch}{\toggletrue{AppResearch}}
\newcommand{\EngResearch}{\toggletrue{EngResearch}}
\newcommand{\CroResearch}{\toggletrue{CroResearch}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% SAIIP reports have some fields that articles dont, namly:
%   saiipnumber: The number of the TUCS report.
%   isbn: The ISBN number of the report.	
%   lab: The TUCS laboratory that produced the report.	
%   keywords: Some keywords the describe the report.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\@saiipnumber}{?}
\newcommand{\saiipnumber}[1]{\renewcommand{\@saiipnumber}{#1}}
%%学号
\newcommand{\@stunumber}{?}
\newcommand{\stunumber}[1]{\renewcommand{\@stunumber}{#1}}
\newcommand{\@College}{?}
\newcommand{\College}[1]{\renewcommand{\@College}{#1}}
\newcommand{\@Major}{?}
\newcommand{\Major}[1]{\renewcommand{\@Major}{#1}}
\newcommand{\@Degree}{?}
\newcommand{\Degree}[1]{\renewcommand{\@Degree}{#1}}
\newcommand{\@Supervisor}{?}
\newcommand{\Supervisor}[1]{\renewcommand{\@Supervisor}{#1}}
\newcommand{\@Classification}{?}
\newcommand{\Classification}[1]{\renewcommand{\@Classification}{#1}}
\newcommand{\@Date}{?}
\newcommand{\Date}[1]{\renewcommand{\@Date}{#1}}

\newcommand{\@isbn}{?}
\newcommand{\isbn}[1]{\renewcommand{\@isbn}{#1}}

\newcommand{\@lab}{}
\newcommand{\lab}[1]{%
  \renewcommand{\@lab}{%
    \begin{center}%
      \textbf{SAIIP Laboratory}\\
      #1
    \end{center}%
  }%
}

\newcommand{\@keywords}{}
\newcommand{\keywords}[1]{%
  \renewcommand{\@keywords}{%
    \vspace{2\baselineskip}
    \begin{raggedright}%
      \textbf{Keywords:} #1
    \end{raggedright}%
  }%
}

%%%%%%%%%%%%%%%%%%%%%%
%   issn: The ISSN number of the TR series.
%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\@issn}{XXXX-XXXX}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The date in a TUCS Report is just given as: Month YEAR.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The authors of a TUCS Report appear on seperate lines.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand{\and}{$|$\ }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% The thanks command is used to give an author's address.
% It behaves differently on the cover page and on the title page.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newboolean{showthanks}
\renewcommand{\thanks}[1]{%
  \ifthenelse{\boolean{showthanks}}{\\
    {\indent \addr@font
      \hspace{2.5em}%
      \begin{tabular}{@{}l@{}}%
	#1
      \end{tabular}%
    }%
  }{}%
}

% Set up the margins _after_ the paper size has been selected by whatever
% style files the user has.
\setlength{\parindent}{2em}

%\AtBeginDocument{
%  \setlength{\textwidth}{168mm}
%  \setlength{\textheight}{249mm}

% Place the text centered on the pages
%  \setlength{\evensidemargin}{0mm}
%  \setlength{\oddsidemargin}{0mm}
%  \setlength{\topmargin}{0mm}
%}


%%%%%%%%%%%%%%%%%%%%%%%
% TUCS report titles look a bit different though.
%%%%%%%%%%%%%%%%%%%%%%%

% The font for the title on the front cover
\newcommand{\School@Font}{
  \fontsize{22}{28}
  \selectfont
}
\newcommand{\BigTitle@Font}
{
  \fontsize{24}{28}
  \selectfont
}
\newcommand{\OtherInf@Font}
{
  \fontsize{14}{18}
  \selectfont
}
\newcommand{\title@font}{%
  %\fontseries{m}%
  %\fontshape{n}%
  \fontsize{22}{28} 
  \selectfont
  \sffamily}

% The font for the title on the inner cover
\newcommand{\titletwo@font}{%
  \fontseries{m}%
  \fontshape{n}%
  \fontsize{24.88}{28} 
  \selectfont
  \sffamily}

% The font for the author{s} on the front cover
\newcommand{\author@font}{%
  \fontseries{m}%
  \fontshape{n}%
  \fontsize{17.28}{20} 
  \selectfont
  \sffamily}

% The font for the author{s} on the inner cover
\newcommand{\authortwo@font}{%
  \fontseries{m}%
  \fontshape{n}%
  \fontsize{14}{18}%
  \selectfont
  \sffamily}

% The font for the univerities on the back cover
\newcommand{\backhead@font}{%
  \fontseries{b}%
  \fontshape{n}%
  \fontsize{10}{11}%
  \selectfont
  \sffamily}

% The font for the departments on the back cover
\newcommand{\back@font}{%
  \fontseries{m}  
  \fontshape{n}%
  \fontsize{10}{11}%
  \selectfont
  \sffamily}

% The font for the report number and date on the front cover
\newcommand{\tinfo@font}{%
  \fontseries{m} 
  \fontshape{n}%
  \fontsize{14}{16}%
  \selectfont
  \sffamily}

% The font for report number and date on inner cover page
\newcommand{\tinfotwo@font}{%
  \fontseries{m}  
  \fontshape{n}%
  \fontsize{12}{14}%
  \selectfont
  \sffamily}

% The font for addresses of authors on inner cover page
% Used in \thanks
\newcommand{\addr@font}{%
  \fontseries{m}%
  \fontshape{n}%
  \fontsize{12}{14}%
  \selectfont
  \rmfamily}

% This is the command that actually makes the title.
\renewcommand{\maketitle}{%
  \thispagestyle{empty}
  \clearpage
  \noindent{\leftline{表5}}\\
  \noindent{\rightline{学号:\underline{\@stunumber}}}\\
  \vspace{4em}\\
  \noindent{\centerline{\School@Font{西\hspace{1em}北\hspace{1em}工\hspace{1em}业\hspace{1em}大\hspace{1em}学}}}\\\\
  \noindent{\centerline{\textit{\BigTitle@Font{研究生学位论文选题报告表}}}}\\
  \vspace{7em}
  
  \begin{figure}[!htbp]
    \begin{picture}(100,100)(0,0)
      \put(101,0){
        \begin{tabular}{rl}
          \textit{\OtherInf@Font{\makebox[90pt][s]{学院：}}} & 
\underline{\textit{\OtherInf@Font{\makebox[110pt][s]{\@College}}~~}}\\[2ex]
\textit{\OtherInf@Font{\makebox[90pt][s]{学科、专业：}}} & 
\underline{\textit{\OtherInf@Font{\makebox[110pt][s]{\@Major}}~~}}\\[2ex]
\textit{\OtherInf@Font{\makebox[90pt][s]{姓名：}}} & 
\underline{\textit{\OtherInf@Font{\makebox[110pt][s]{\@author}}~~}}\\[2ex]
\textit{\OtherInf@Font{\makebox[90pt][s]{学位级别：}}}            &
\underline{\textit{\OtherInf@Font{\makebox[110pt][s]{\@Degree}}~~}}\\[2ex]
          \textit{\OtherInf@Font{\makebox[90pt][s]{导师：}}} &
\underline{\textit{\OtherInf@Font{\makebox[110pt][s]{\@Supervisor}}~~}}\\[2ex]
          \textit{\OtherInf@Font{\makebox[90pt][s]{培养类别：}}} &
\underline{\textit{\OtherInf@Font{\makebox[110pt][s]{\@Classification}}~~}}\\[2ex]
          \textit{\OtherInf@Font{\makebox[90pt][s]{报告日期：}}} &
\underline{\textit{\OtherInf@Font{\makebox[110pt][s]{\@Date}}~~}}\\[2ex]
        \end{tabular}
      }
      \put(205,-330){\fontsize{16pt}{16pt}\selectfont{\textit{研究生院}}}
    \end{picture}
    
  \end{figure}  
  \clearpage
  \setcounter{page}{1}%

  \begin{spacing}{2}
    \noindent{\centerline{\fontsize{18}{30}\selectfont{研究生学位论文选题报告的要求}}}
  \end{spacing}
  %\vspace{2cm}\\
  \begin{spacing}{1.5}
    一、硕士生的选题报告内容应包括文献综述、选题意义、研究内容、研究方案，论文工作量的估计、工作条件，预期达到的水平，存在的问题及拟采取的解决措施。
    \par
    二、博士生的选题报告内容应包括文献综述、选题背景及其意义、研究内容、研究特色、工作难点、预期成果及其可能的创新点。
    \par
    三、选题报告会应以学术活动的方式公开进行。
    \par
    四、正式开题之前，研究生应在广泛阅读中、外文资料的基础上，深入了解拟选课题的国内外研究动态，把握所选课题的目的、意义和预期结果，明确课题工作的设想、方法和研究路径。
    \par
    五、研究生在规定的时间内，写出选题报告初稿，经指导教师审阅同意后，由指导教师安排选题报告时间。选题报告未通过者，重新开题，若第二次选题报告仍通不过者，则按有关规定终止学籍。
    \par
    六、选题报告不能按期完成者，应及时向研究生院培养处提出延期申请。
    \par
    七、本表可以打印或用钢笔认真填写，若不够填写时，可另加附页。
  \end{spacing}
  \fancypagestyle{firststyle}
  {
    \fancyhead{}
    \fancyfoot[RO]{}
    \fancyfoot[LE]{}
    \fancyfoot[C]{-\thepage-}
    \renewcommand{\headrulewidth}{0pt} %页眉横线宽度===========
  }
  \thispagestyle{firststyle}
  %\thisfancy
  \clearpage
  \pagestyle{fancy}
  \fancyhead{}
  \fancyfoot[RO]{}
  \fancyfoot[LE]{}
  \fancyfoot[C]{-\thepage-}
  \renewcommand{\headrulewidth}{0pt} %页眉横线宽度===========
  
  %\renewcommand{\headsep}{5pt}
  %\renewcommand{\footskip}{10pt}
  \fancypage{%
    \setlength{\fboxsep}{8pt}%
    \setlength{\fboxrule}{0.8pt}%
    \setlength{\shadowsize}{0pt}%
    \shadowbox}{}
  \begin{picture}(100,70)(0,0)
    \put(-32,60){\makebox[96pt]{\fontsize{10.5}{10.5}\selectfont{论文题目}}}
    \put(80,60){\makebox[.8\textwidth]{\fontsize{10.5}{10.5}\selectfont{\@title}}}
    \put(64,0){\line(0,1){78}}
    \put(-32,22){\makebox[96pt]{\hfill \begin{tabular}{p{70pt}}\fontsize{10.5}{10.5}\selectfont{论文类型（请在有关项目下作√记号）}\end{tabular}\hfill}}
    \put(64,25){\line(1,0){381}}
    \put(160,0){\line(0,1){50}}
    \put(256,0){\line(0,1){50}}
    \put(352,0){\line(0,1){50}}
    \put(64,34){\makebox[96pt]{\fontsize{10.5}{10.5}\selectfont{基础研究}}}
    \put(160,34){\makebox[96pt]{\fontsize{10.5}{10.5}\selectfont{应用研究}}}
    \put(256,34){\makebox[96pt]{\fontsize{10.5}{10.5}\selectfont{工程技术}}}
    \put(352,34){\makebox[96pt]{\fontsize{10.5}{10.5}\selectfont{跨学科研究}}}
    

    \iftoggle{FundReasearch}{
      \put(64,10){\makebox[96pt]{\fontsize{10.5}{10.5}\selectfont{√}}}
    }
    {
      \iftoggle{AppResearch}
      {    
        \put(160,10){\makebox[96pt]{\fontsize{10.5}{10.5}\selectfont{√}}}
      }   
      {
        \iftoggle{EngResearch}
        { 
          \put(256,10){\makebox[96pt]{\fontsize{10.5}{10.5}\selectfont{√}}}
        }   
        {
          \iftoggle{CroResearch}
          { 
            \put(352,10){\makebox[96pt]{\fontsize{10.5}{10.5}\selectfont{√}}}
          }
          {
            %
          }
        }
      }
    }
       

    \put(-32,50){\line(1,0){477}}
    \put(-32,0){\line(1,0){477}}
  \end{picture}
  \noindent{
    
    \begin{spacing}{1.4}
    \noindent{\textit{研究生在进行选题报告、听取意见后，整理成文（不少于3500字）。}}
    \end{spacing}
  }
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% TUCS abstracts (which are mandatory) appear before the `first' page.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ifthenelse{\boolean{@titlepage}}{%
  \let\@ldabstract=\abstract
  \let\@ldendabstract=\endabstract
  \renewenvironment{abstract}{%
    \@ldabstract
    \setcounter{page}{0}%
  }{
    \par
    \@keywords
    \vfill
    \begin{center}
      \@lab
    \end{center}
    \vfill
    \@ldendabstract
    \setcounter{page}{1}%
  }%
}{}


\AtEndDocument{%
  \clearpage
  \begin{picture}(100,100)(0,0)
    \put(-32,-10){\begin{tabular}{p{55pt}}\makebox[52pt]{\textit{指导教师}}\\
        \makebox[52pt]{\textit{意 \hfill 见}}
      \end{tabular}}
    \put(-32,-225){\begin{tabular}{p{55pt}}\makebox[52pt]{\textit{院 \hfill 系}}\\
        \makebox[52pt]{\textit{意 \hfill 见}}
      \end{tabular}}
    \put(-32,-430){\begin{tabular}{p{55pt}}\makebox[52pt]{\textit{研究生院}}\\
        \makebox[52pt]{\textit{复核时间}}
      \end{tabular}}
    \put(-32,-565){\begin{tabular}{p{55pt}}\makebox[52pt]{\textit{备\hfill 注}}\\
        %\makebox[52pt]{\textit{意 \hfill 见}}
      \end{tabular}}
    \put(90,-110){\textit{指导教师（签名）：}}
    \put(300,-110){\textit{\makebox[140pt]{201\hfill 年\hfill     月\hfill    日}}}
    \put(90,-310){\textit{院系负责人（签名）：}}
    \put(300,-310){\textit{\makebox[140pt]{201\hfill 年\hfill     月\hfill    日}}}
    \put(90,-510){\textit{复核人签名（签章）： }}
    \put(300,-510){\textit{\makebox[140pt]{201\hfill 年\hfill     月\hfill    日}}}
    
    \put(-32,-120){\line(1,0){477}}
    \put(-32,-320){\line(1,0){477}}
    \put(-32,-520){\line(1,0){477}}
    \put(30,-605.5){\line(0,1){714}}
  \end{picture}
}  % end of \AtEndDocument
