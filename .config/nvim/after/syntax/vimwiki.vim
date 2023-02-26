syntax match todoCheckbox '\v.*\[\ \]'hs=e-2 conceal cchar=
syntax match todoCheckbox '\v.*\[X\]'hs=e-2 conceal cchar=

" LaTeX: {{{3
" Set embedded LaTex (pandoc extension) highlighting
" Unset current_syntax so the 2nd include will work
unlet b:current_syntax
syn include @LATEX syntax/tex.vim
syn region pandocLaTeXInlineMath start=/\v\\@<!\$\S@=/ end=/\v\\@<!\$\d@!/ keepend contains=@LATEX
syn region pandocLaTeXInlineMath start=/\\\@<!\\(/ end=/\\\@<!\\)/ keepend contains=@LATEX
syn match pandocEscapedDollar /\\\$/ conceal cchar=$
syn match pandocProtectedFromInlineLaTeX /\\\@<!\${.*}\(\(\s\|[[:punct:]]\)\([^$]*\|.*\(\\\$.*\)\{2}\)\n\n\|$\)\@=/ display
" contains=@LATEX
syn region pandocLaTeXMathBlock start=/\$\$/ end=/\$\$/ keepend contains=@LATEX
syn region pandocLaTeXMathBlock start=/\\\@<!\\\[/ end=/\\\@<!\\\]/ keepend contains=@LATEX
syn match pandocLaTeXCommand /\\[[:alpha:]]\+\(\({.\{-}}\)\=\(\[.\{-}\]\)\=\)*/ contains=@LATEX
syn region pandocLaTeXRegion start=/\\begin{\z(.\{-}\)}/ end=/\\end{\z1}/ keepend contains=@LATEX
" we rehighlight sectioning commands, because otherwise tex.vim captures all text until EOF or a new sectioning command
syn region pandocLaTexSection start=/\\\(part\|chapter\|\(sub\)\{,2}section\|\(sub\)\=paragraph\)\*\=\(\[.*\]\)\={/ end=/\}/ keepend
syn match pandocLaTexSectionCmd /\\\(part\|chapter\|\(sub\)\{,2}section\|\(sub\)\=paragraph\)/ contained containedin=pandocLaTexSection
syn match pandocLaTeXDelimiter /[[\]{}]/ contained containedin=pandocLaTexSection
" }}}3

if exists('s:foldmethod') && s:foldmethod !=# &l:foldmethod
    let &l:foldmethod = s:foldmethod
endif

" }}}2


" Mardown
hi markdownHeader1 ctermfg=10 cterm=Bold
match markdownHeader1 /^#\s.*$/


" Markdonw custom tag 
" syntax region markdownTag matchgroup=markdownTagDelimiter start=/^\[\a\+/ end=/\]$/ contains=@markdownTagContent
syntax match markdownTag /^\[\w\+]$/ 
syntax match markdownTag /\s\[\w\+]$/ 
syntax match markdownTag /^\[\w\+]\s/ 
syntax match markdownTag /\s\[\w\+]\s/ 
highlight markdownTag ctermfg=red

" highlight markdownTagDelimiter ctermfg=red

" syn match markdownTagContent contained /\s\+/
" highlight markdownTagContent ctermfg=red
