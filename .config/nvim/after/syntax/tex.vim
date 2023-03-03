
" custom tag 
" syntax region markdownTag matchgroup=markdownTagDelimiter start=/^\[\a\+/ end=/\]$/ contains=@markdownTagContent
syntax match markdownTag /^%.*\s\[\w\+\.\w\+].*$/ 
syntax match markdownTag /^%.*\s\[\w\+\.\w\+|\w\+].*$/ 

" Include comments in the markdownTag group
highlight markdownTag ctermfg=red
