
local fmt = require("luasnip.extras.fmt").fmt


return {


s({ trig='col', name='column'}, fmt([[
<div class="container">
	<div class="col">
        {}
	</div>
	<div class="col">
        {}		
	</div>
</div>
{}
]],
{ i(1), i(2), i(0) }
)),

s({ trig='le', name='Left coloumn' }, fmt([[
<div id="left">
{}
</div>
{}
]],
{ i(1), i(0) }
)),

s({ trig='ri', name='Right coloumn' }, fmt([[
<div id="right">
{}
</div>
{}
]],
{ i(1), i(0) }
)),


--------------- Figures ---------------

s({ trig='fig', name='image for presentation' }, fmt([[
<img class="fragment" src="{}" width="Auto" height="200">
{}
]],
{ i(1), i(0) }
)),

s({ trig='ov', name='Overlapping images' }, fmt([[
<div class="r-stack">
	<img class="fragment" src="{}" width="Auto" height="200">
</div>
{}
]],
{ i(1), i(0) }
)),

s({ trig='st', name='Stretch image' }, fmt([[
<img class="r-stretch" src="{}">
{}
]],
{ i(1), i(0) }
)),

--------------- Background ---------------

s({ trig='bg', name='Image background' }, fmt([[
<!---------------------------------------->
<section data-background-image="{}">
{}
</section>
]],
{ i(1), i(0) }
)),


s({ trig='bgv', name='Video background' }, fmt([[
<!---------------------------------------->
<section data-background-video="{}" 
          data-background-video-loop data-background-video-muted data-background-opacity=0.5>
{}
</section>
]],
{ i(1), i(0) }
)),


s({ trig='bgc', name='Colored background' }, fmt([[
<!---------------------------------------->
<section data-transition="zoom" data-background-color="{}">
{}
</section>
]],
{ i(1), i(0) }
)),


--------------- HTML ---------------

s({ trig='no', name='slider notes' }, fmt([[
<aside class="notes">
{}
</aside>
]],
{ i(0) }
)),

s({ trig='eq', name='Equation' }, fmt([[
\[\begin{aligned}
	<>
\end{aligned}\]
<>
]],
{ i(1), i(0) },
{ delimiters='<>' }
)),

s({ trig='im', name='Inline math' }, fmt([[
$ {} $ {}
]],
{ i(1), i(0) }
)),

s({ trig='sl', name='Slide' }, fmt([[
<!---------------------------------------->
<section>
<h1> {} </h1>
{}
</section>
]],
{ i(1), i(0) }
)),

s({ trig='li', name='List' }, fmt([[
<ul>
    <li class="fragment"> {} </li> 
	{}
</ul>
]],
{ i(1), i(0) }
)),

s({ trig='ii', name='List item' }, fmt([[
<li class="fragment"> {} </li> 
{}
]],
{ i(1), i(0) }
)),


s({ trig='co', name='Code highlight' }, fmt([[
<pre><code data-line-numbers="{}">
{} 
</code></pre>
]],
{ i(1), i(0) }
)),


s({ trig='him', name='hyperlink image' }, fmt([[
    <a href="{}"> 
        <img style="vertical-align:middle" src="{}" width="Auto" height="100"> 
    </a>
    {}
    ]],
{ i(1), i(2), i(0) }
)),



--------------- Styling ---------------
s({ trig='ye', name='Yellow highlight' }, fmt([[
<span style="color:#d4ac0d"> {} </span> {}
]],
{ i(1), i(0) }
)),

s({ trig='bo', name='Bold text' }, fmt([[
<strong> {} </strong> {}
]],
{ i(1), i(0) }
)),


--------------- Markdown ---------------
s({ trig='ma', name='Markdown area' }, fmt([[
<!---------------------------------------->
<section data-markdown>
<textarea data-template>
{}
</textarea>
</section>
]],
{ i(0) }
)),

s({ trig='#', name='header 1' }, fmt([[
# {} <!-- .element: class="fragment fade-in" -->
{}
]],
{ i(1), i(0) }
)),

s({ trig='##', name='header 2' }, fmt([[
# {} <!-- .element: class="fragment fade-in" -->
{}
]],
{ i(1), i(0) }
)),

s({ trig='###', name='header 3' }, fmt([[
# {} <!-- .element: class="fragment fade-in" -->
{}
]],
{ i(1), i(0) }
)),

s({ trig='####', name='header 4' }, fmt([[
# {} <!-- .element: class="fragment fade-in" -->
{}
]],
{ i(1), i(0) }
)),

s({ trig='#####', name='header 5' }, fmt([[
# {} <!-- .element: class="fragment fade-in" -->
{}
]],
{ i(1), i(0) }
)),


s({ trig='*', name='Markdown list item' }, fmt([[
* {} <!-- .element: class="fragment fade-in" -->
{}
]],
{ i(1), i(0) }
)),

s({ trig='fr', name='Markdown Fragment' }, fmt([[
<!-- .element: class="fragment fade-in" -->
{}
]],
{ i(0) }
)),


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





