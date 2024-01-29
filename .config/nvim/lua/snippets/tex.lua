
local fmt = require("luasnip.extras.fmt").fmt

return {


s({trig="sec", name="Section"}, fmt([[
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    \section{<>}
    <>
    ]],
    { i(1), i(0) },
    { delimiters='<>' }
)),

s({trig="ssec", name="Sub section"}, fmt([[
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    \subsection{<>}
    <>
    ]],
    { i(1), i(0) },
    { delimiters='<>' }
)),

s({trig="sssec", name="Sub sub section"}, fmt([[
    \subsubsection{<>}
    <>
    ]],
    { i(1), i(0) },
    { delimiters='<>' }
)),


s({trig="par", name="Paragraph"}, fmt([[
\paragraph{<>} <>
]],
{ i(1), i(0) },
{ delimiters='<>' }
)),


s({trig="bf", name="bold text"}, fmt([[
\textbf{<>} <> 
]],
{ i(1), i(0) },
{ delimiters='<>' }
)),

s({trig="bfm", name="Bold symbol"}, fmt([[
\bm{<>} <>
]],
{ i(1), i(0) },
{ delimiters='<>' }
)),

s({trig="it", name="italic text"}, fmt([[
\textit{<>}<>
]],
{ i(1), i(0) },
{ delimiters='<>' }
)),

s({trig="str", name="math sring"}, fmt([[
\texorpdfstring{\$\bm{<> }\$}{MATH}<>
]],
{ i(1), i(0) },
{ delimiters='<>' }
)),



s({trig="ref", name="cross referance"}, fmt([[
\ref{<>} <>
]],
{ i(1), i(0) },
{ delimiters='<>' }
)),

s({trig="ci", name="cite"}, fmt([[
\cite{<>} <>
]],
{ i(1), i(0) },
{ delimiters='<>' }
)),


s({trig="te", name="Text"}, fmt([[
\text{<>}<>
]],
{ i(1), i(0) },
{ delimiters='<>' }
)),

s({trig="ov", name="Overset"}, fmt([[
\overset{<>}<>
]],
{ i(1), i(0) },
{ delimiters='<>' }
)),

s({trig="boxed", name="Begin box"}, fmt([[
\boxed{<>} <>
]],
{ i(1), i(0) },
{ delimiters='<>' }
)),

s({trig="box", name="Box"}, fmt([[
\fbox{\begin{minipage}{41em}
<>
\end{minipage}}
<>
]],
{ i(1), i(0) },
{ delimiters='<>' }
)),

-- Templates
s({ trig="article", name="Article template"}, fmt([[
% {{{
\documentclass[a4paper,10pt,norsk]{article}
\usepackage[utf8]{inputenc}
\usepackage[norsk]{babel}
\usepackage{graphicx, verbatim, amsmath, amsfonts, geometry, float, import, bm}
\usepackage{siunitx} % converts expression to SI units/notation , \num{10e-10}
\usepackage[hidelinks]{hyperref}
\usepackage{biblatex}

% Code higligthing
\usepackage{listings}
\usepackage{xcolor}
\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}

\lstdefinestyle{mystyle}{
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breakatwhitespace=false,         
    breaklines=true,                 
    captionpos=b,                    
    keepspaces=true,                 
    numbersep=5pt,                  
    showspaces=false,                
    showstringspaces=false,
    showtabs=false,                  
    tabsize=4
}
\lstset{style=mystyle}
\setlength{\parindent}{0mm}
\setlength{\parskip}{1.5mm}

% }}}

\title{<>}
\author{Jens Junker Pedersen}

\begin{document}
\maketitle
\tableofcontents

<>

\end{document}
]],
{ i(1), i(2) },
{ delimiters='<>' }
)),

s({trig="==", name="align sign"}, fmt([[
&= <>
]],
{ i(0) },
{ delimiters='<>' }
)),

s({trig="ma", name="Begin matrix"}, fmt([[
\begin{bmatrix}
    <>	
\end{bmatrix}
]],
{ i(0) },
{ delimiters='<>' }
)),

-- Figure
s({trig="fig", name="Figure"}, fmt([[
\begin{figure}[H]
	\centering
	\includegraphics[width=0.8\textwidth]{Figures/<>}
\end{figure}
<>
]],
{ i(1), i(0) },
{ delimiters='<>' }
)),


s({trig="lab", name="label"}, fmt([[
\label{<>} <> 
]],
{ i(0), i(0) },
{ delimiters='<>' }
)),

s({trig="py", name="Begin python lstlisting"}, fmt([[
\begin{lstlisting}[language=Python]
<>
\end{lstlisting}
<>
]],
{ i(0), i(0) },
{ delimiters='<>' }
)),


s({trig="code", name="import kode"}, fmt([[
\lstinputlisting[language=<>]{<>}
<>
]],
{ i(1), i(2), i(0) },
{ delimiters='<>' }
)),


s({trig="ver", name="verbatim"}, fmt([[
\begin{verbatim}
    <>	
\end{verbatim}
<>
]],
{ i(1), i(0) },
{ delimiters='<>' }
)),

s({trig="eqb", name="Begin equation box"}, fmt([[
\begin{equation*}
	\boxed{<>}
\end{equation*}
<>
]],
{ i(1), i(0) },
{ delimiters='<>' }
)),


s({trig="item", name="Begin itemize"}, fmt([[
\begin{itemize}
	<>
\end{itemize}
<>
]],
{ i(0), i(0) },
{ delimiters='<>' }
)),


s({trig="ii", name="Item"}, fmt([[
\item<>
]],
{ i(0) },
{ delimiters='<>' }
)),


s({trig="tab", name="Begin tabular"}, fmt([[
\begin{table}[H]
	\centering
	\begin{tabular}{<>}
		\hline
		<> 
	\end{tabular} 
\end{table}
<>
]],
{ i(1), i(2), i(0) },
{ delimiters='<>' }
)),


s({trig="tt", name="row"}, fmt([[
<> \\\\
\hline
<>
]],
{ i(1), i(0) },
{ delimiters='<>' }
)),


s({trig="cap", name="caption"}, fmt([[
\caption{<>} <> 
]],
{ i(0), i(0) },
{ delimiters='<>' }
)),



s({trig="enum", name="Begin enumerate"}, fmt([[
\begin{enumerate}
    <>	
\end{enumerate}
<>
]],
{ i(0), i(0) },
{ delimiters='<>' }
)),


-- ========================= Environments =========================
s({trig="beg", name="Begin environment"}, fmt([[
\begin{<>}
	$0
\end{<>}
]],
{ i(1), i(0) },
{ delimiters='<>' }
)),


s({trig="eq", name="Begin equation"}, fmt([[
\begin{equation*}
    <>
\end{equation*}
]],
{ i(0) },
{ delimiters='<>' }
)),

s({trig="eqn", name="Begin equation"}, fmt([[
\begin{equation}
	$<>
\end{equation}
]],
{ i(0) },
{ delimiters='<>' }
)),

s({trig="ali", name="begin align"}, fmt([[
\begin{align*}
	<>
\end{align*}
]],
{ i(0) },
{ delimiters='<>' }
)),

--[[
--
  ____          _      
 / ___|___   __| | ___ 
| |   / _ \ / _` |/ _ \
| |__| (_) | (_| |  __/
 \____\___/ \__,_|\___|
                                                                 
--]]



--[[

 _____            _                                      _       
| ____|_ ____   _(_)_ __ ___  _ __  _ __ ___   ___ _ __ | |_ ___ 
|  _| | '_ \ \ / / | '__/ _ \| '_ \| '_ ` _ \ / _ \ '_ \| __/ __|
| |___| | | \ V /| | | | (_) | | | | | | | | |  __/ | | | |_\__ \
|_____|_| |_|\_/ |_|_|  \___/|_| |_|_| |_| |_|\___|_| |_|\__|___/
                                                                 
--]]

--------------- Figures ---------------

--[[

 __  __       _   _     
|  \/  | __ _| |_| |__  
| |\/| |/ _` | __| '_ \ 
| |  | | (_| | |_| | | |
|_|  |_|\__,_|\__|_| |_|

--]]

-- --------------- General ---------------
s({ trig="eqr", name="math ref", wordTrig=false }, fmt([[
    \eqref{<>} <>
    ]]
    , { i(1), i(0) },
    { delimiters='<>' }
)),

s({ trig="sn", name="sietific notation", wordTrig=false }, fmt([[
    \num{<>} <>
    ]]
    , { i(1), i(0) },
    { delimiters='<>' }
)),

s({ trig="^", name="Super script", wordTrig=false }, fmt([[
    ^{<>}<>
    ]],
    { i(1), i(0) },
    { delimiters='<>' }
)),

s({ trig="_", name="Sub script", wordTrig=false }, fmt([[
    _{<>}<> 
    ]],
    { i(1), i(0) },
    { delimiters='<>' }
)),

s({ trig="vec", name="Vector", wordTrig=false }, fmt([[
    \vec{<>}<>
    ]],
    { i(1), i(0) },
    { delimiters='<>' }
)),

s({ trig="bar", name="Bar", wordTrig=false }, fmt([[
    \bar{<>}<>
    ]],
    { i(1), i(0) },
    { delimiters='<>' }
)),

s({ trig="ha", name="Hat", wordTrig=false }, fmt([[
    \hat{<>} <>
    ]],
    { i(1), i(0) },
    { delimiters='<>' }
)),

s({ trig="ti", name="Tilde", wordTrig=false }, fmt([[
    \tilde{<>}<>
    ]],
    { i(1), i(0) },
    { delimiters='<>' }
)),

------------------------- Operators -------------------------

s({ trig="//", name="Fraction", wordTrig=false, snippetType="autosnippet" }, fmt([[
    \frac{<>}{<>}<>
    ]],
    { i(1), i(2), i(0) },
    { delimiters='<>' }
)),

s({ trig="ro", name="Square root", wordTrig=false }, fmt([[
    \sqrt{<>} <>
    ]],
    { i(1), i(0) },
    { delimiters='<>' }
)),

s({ trig="sum", name="Sum", wordTrig=false }, fmt([[
    \sum_{<>}^{<>}<>
    ]],
    { i(1), i(2), i(0) },
    { delimiters='<>' }
)),

s({ trig="int", name="Integral", wordTrig=false }, fmt([[
    \int_{<>}^{<>}<>
    ]],
    { i(1), i(2), i(0) },
    { delimiters='<>' }
)),

--------------- Bracets ---------------

s({ trig="br", name="Big round bracets", wordTrig=false }, fmt([[
    \left(<> \right)<>
    ]],
    { i(1), i(0) },
    { delimiters='<>' }
)),

s({ trig="bs", name="Big square bracets", wordTrig=false }, fmt([[
    \left[<> \right]<>
    ]],
    { i(1), i(0) },
    { delimiters='<>' }
)),

--------------- Derivatives ---------------

s({ trig="dt", name="time derivative", wordTrig=false }, fmt([[
    \frac{d<>}{dt}<>
    ]],
    { i(1), i(0) },
    { delimiters='<>' }
)),

s({ trig="dpt", name="parital time derivative", wordTrig=false }, fmt([[
    \frac{\partial <>}{\partial t} <>
    ]],
    { i(1), i(0) },
    { delimiters='<>' }
)),

s({ trig="dp", name="partial derivative", wordTrig=false }, fmt([[
    \frac{\partial <>}{\partial <>} <>
    ]],
    { i(1), i(2), i(0) },
    { delimiters='<>' }
)),

s({ trig="dd", name="derivative", wordTrig=false }, fmt([[
    \frac{d <>}{d <>} <>
    ]],
    { i(1), i(2), i(0) },
    { delimiters='<>' }
)),



--------------- Symbols ---------------
s({ trig="deg", name="degree", wordTrig=false }, fmt([[this is a string {}]], {i(0)})),
s({ trig="pm", name="Plus minus", wordTrig=false }, fmt([[\pm {}]], {i(0)})),
s({ trig="le", name="less or equal", wordTrig=false }, fmt([[\leq {}]], {i(0)})),
s({ trig="ge", name="greater or equal", wordTrig=false }, fmt([[\geq {}]], {i(0)})),
s({ trig="con", name="Congruent", wordTrig=false }, fmt([[\cong {}]], {i(0)})),
s({ trig="->", name="rigth arrow", wordTrig=false }, fmt([[\rightarrow {}]], {i(0)})),
s({ trig="<-", name="left arrow", wordTrig=false }, fmt([[\leftarrow {}]], {i(0)})),
s({ trig="=>", name="Rigth arrow", wordTrig=false }, fmt([[\Rightarrow {}]], {i(0)})),
s({ trig="<>", name="Left rigth arrow", wordTrig=false }, fmt([[\Leftrightarrow {}]], {i(0)})),
s({ trig="inf", name="infinity", wordTrig=false }, fmt([[\infty {}]], {i(0)})),
s({ trig="na", name="nabla", wordTrig=false }, fmt([[\nabla {}]], {i(0)})),
s({ trig="pa", name="partial", wordTrig=false }, fmt([[\partial {}]], {i(0)})),
-- s({ trig="E", name="expectation", wordTrig=false }, fmt([[\mathbb{E} <>]], { delimiters='<>' }, {i(0)})),



--------------- Greek ---------------
s({ trig="al", name="alpha", wordTrig=false }, fmt([[\alpha {}]], {i(0)})),
s({ trig="be", name="beta", wordTrig=false }, fmt([[\beta {}]], {i(0)})),
s({ trig="ga", name="gamma", wordTrig=false }, fmt([[\gamma {}]], {i(0)})),
s({ trig="de", name="delta", wordTrig=false }, fmt([[\delta {}]], {i(0)})),
s({ trig="De", name="Delta", wordTrig=false }, fmt([[\Delta {}]], {i(0)})),
s({ trig="ep", name="epsilon", wordTrig=false }, fmt([[\epsilon {}]], {i(0)})),
s({ trig="et", name="eta", wordTrig=false }, fmt([[\eta {}]], {i(0)})),
s({ trig="th", name="theta", wordTrig=false }, fmt([[\theta {}]], {i(0)})),
s({ trig="Th", name="Theta", wordTrig=false }, fmt([[\Theta {}]], {i(0)})),
s({ trig="ka", name="kappa", wordTrig=false }, fmt([[\kappa {}]], {i(0)})),
s({ trig="la", name="lambda", wordTrig=false }, fmt([[\lambda {}]], {i(0)})),
s({ trig="mu", name="mu", wordTrig=false }, fmt([[\mu {}]], {i(0)})),
s({ trig="nu", name="nu", wordTrig=false }, fmt([[\nu {}]], {i(0)})),
s({ trig="xi", name="xi", wordTrig=false }, fmt([[\xi {}]], {i(0)})),
s({ trig="pi", name="pi", wordTrig=false }, fmt([[\pi {}]], {i(0)})),
s({ trig="si", name="sigma", wordTrig=false }, fmt([[\sigma {}]], {i(0)})),
s({ trig="Si", name="Sigma", wordTrig=false }, fmt([[\Sigma {}]], {i(0)})),
s({ trig="ta", name="tau", wordTrig=false }, fmt([[\tau {}]], {i(0)})),
s({ trig="ph", name="phi", wordTrig=false }, fmt([[\phi {}]], {i(0)})),
s({ trig="Ph", name="Phi", wordTrig=false }, fmt([[\Phi {}]], {i(0)})),
s({ trig="rh", name="Rho", wordTrig=false }, fmt([[\rho {}]], {i(0)})),
s({ trig="ps", name="psi", wordTrig=false }, fmt([[\psi {}]], {i(0)})),
s({ trig="Ps", name="Psi", wordTrig=false }, fmt([[\Psi {}]], {i(0)})),
s({ trig="om", name="omega", wordTrig=false }, fmt([[\omega {}]], {i(0)})),
s({ trig="Om", name="Omega", wordTrig=false }, fmt([[\Omega {}]], {i(0)}))
}
