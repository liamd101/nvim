local ls = require('luasnip')
local s = ls.snippet
local sn = ls.snippet_node
local isn = ls.indent_snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local c = ls.choice_node
local d = ls.dynamic_node
local fmt = require("luasnip.extras.fmt").fmt
local fmta = require("luasnip.extras.fmt").fmta
local rep = require("luasnip.extras").rep

local tex_utils = require('luasnip-helper-funcs')


ls.add_snippets("all", {
    s({ trig = "template", desc = "Basic template for Math assignments" },
        fmt([[
            ss[10pt]{article}

            \usepackage[margin=1in]{geometry}
            \usepackage{amsmath,amsthm,amssymb, graphicx, multicol, array}
            \usepackage[shortlabels]{enumitem}
            \usepackage[english]{babel}

            \newcommand{\N}{\mathbb{N}}
            \newcommand{\Z}{\mathbb{Z}}
            \newcommand{\R}{\mathbb{R}}
            \newcommand{\I}{\mathbb{I}}
            \newcommand{\Q}{\mathbb{Q}}
            \newcommand{\F}{\mathbb{F}}
            \newtheorem*{remark}{Theorem}

            \newenvironment{problem}[2][Problem]{\begin{trivlist}
            \item[\hskip \labelsep {\bfseries #1}\hskip \labelsep {\bfseries #2.}]}{\end{trivlist}}

            \begin{document}
            \title{<>}
            \author{Liam Dodds}
            \maketitle

            <>

            \end{document}
            ]],
            {
                i(1),
                i(0)
            },
            { delimiters = "<>" }
        ),
        { condition = tex_utils.line_begin }
    ),

    s({ trig = "cistemplate", desc = "Autofill UPenn CIS template"},
        fmt([[
            \documentclass{article}
            \usepackage[letterpaper,top=0.25in,bottom=0.15in,left=0.5in,right=0.5in,includeheadfoot]{geometry}
            \usepackage{amssymb,amsmath}
            \usepackage{parskip}
            \usepackage{fancyhdr}
            \usepackage{tabu}
            \usepackage{enumerate}
            \usepackage{graphicx}
            \usepackage{xcolor}

            \newcommand{\MyID}{82279878}
            \newcommand{\MyRecitation}{<>}
            \newcommand{\CollaboratorNames}{<>}
            \newcommand{\HomeworkNo}{<>}


            % DO NOT MODIFY ANYTHING HERE
            \newcommand{\multichoose}[2]{\left(\!\genfrac{(}{)}{0pt}{}{#1}{#2}\!\right)}
            \renewcommand{\baselinestretch}{1.3}
            \pagestyle{fancy}
            \fancyhead{}
            \fancyfoot[L]{\MyID{}}
            \fancyfoot[R]{Homework \HomeworkNo{}}
            \renewcommand{\headrulewidth}{0pt}
            \renewcommand{\frac}[2]{\dfrac{#1}{#2}}
            \setlength{\headheight}{0pt}
            % DO NOT MODIFY ANYTHING HERE
            \fancypagestyle{firstpage}{
              \fancyhead{}
              \fancyfoot{}
            }
            % DO NOT MODIFY ANYTHING HERE
            \newcommand{\MyIDCheck}[1]
            {\ifnum\pdfstrcmp{#1}{Your 8 digit ID}=0
               \LARGE\textcolor{red}{#1}
            \else
               #1
            \fi}
            % DO NOT MODIFY ANYTHING HERE
            % \newcommand{\MyRecitationCheck}[1]{\ifnum\pdfstrcmp{#1}{2XX}=0
            %    \huge\textcolor{red}{#1}
            % \else
            %    #1
            % \fi}
            % DO NOT MODIFY ANYTHING HERE
            \newcommand{\MyHomeworkNoCheck}[1]{\ifnum\pdfstrcmp{#1}{XX}=0
               \huge\textcolor{red}{#1}
            \else
               #1
            \fi}
            % DO NOT MODIFY ANYTHING HERE
            \newcommand{\MyCollaboratorCheck}[1]{\ifnum\pdfstrcmp{#1}{ADD COLLABORATORS HERE}=0
               \LARGE\textcolor{red}{#1}
            \else
               #1
            \fi}
            % DO NOT MODIFY ANYTHING HERE
            \newcommand{\PrintFirstHeader}{
              CIS 1210 \vspace{5pt} \hfill {\Large\MyIDCheck{\MyID}}
              \\
              {\LARGE{\textbf{Homework \MyHomeworkNoCheck{\HomeworkNo}}}} \vspace{5pt} 

              {\large Collaborators: \MyCollaboratorCheck{\CollaboratorNames}}
              
              \rule{\textwidth}{0.4pt}
            }
            \begin{document}
            \thispagestyle{firstpage}
            \PrintFirstHeader{}
            \begin{enumerate}[\bf Q1.]
              \setlength\itemsep{1em}

              <>

            \end{enumerate}
            \end{document}\\\\\\
        ]],
        {
            i(1, "recitation number"),
            i(2, "collaborators"),
            i(3, "homework number"),
            i(0),
        },
        { delimiters = "<>" }
        ),
        { condition = tex_utils.line_begin }
    ),

    s({ trig = "cismq", desc = "CIS multi-part question template" },
        fmt([[
            \item\hfill\begin{enumerate}
                <>
            \end{enumerate}
        ]],
        { i(0) },
        { delimiters = "<>" }
        ),
        { condition = tex_utils.line_begin }
    ),

})

require("luasnip.loaders.from_lua").load({ include = "all" })
