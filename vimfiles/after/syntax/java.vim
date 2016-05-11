" Operators
syn match javaCustomOperator	"\(<<\|>>\|[-+*/%&^|<>!=]\)="
syn match javaCustomOperator	"<<\|>>\|&&\|||\|++\|--\|->"
syn match javaCustomOperator	"[.!~*&%<>^|=,+-]"
syn match javaCustomOperator	"/[^/*=]"me=e-1
syn match javaCustomOperator	"/$"
syn match javaCustomOperator "&&\|||"
syn match javaCustomOperator	"[][]"

" Delimiters
syn match javaDelimiter    "[();\\]"

syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend
syn region foldJavadoc start=+/\*+ end=+\*/+ transparent fold keepend extend
syn region foldImports start=/\(^\s*\n^import\)\@<= .\+;/ end=+^\s*$+ transparent fold keepend

" Highlight Class and Function names
syn match    javaCustomFunc     "\w\+\s*("me=e-1

"syn clear javaFuncDef
"syn region javaFuncDef start=+^\s\+\(\(public\|protected\|private\|static\|abstract\|final\|native\|synchronized\)\s\+\)*\(\(void\|boolean\|char\|byte\|short\|int\|long\|float\|double\|\([A-Za-z_][A-Za-z0-9_$]*\.\)*[A-Z][A-Za-z0-9_$]*\)\(<[^>]*>\)\=\(\[\]\)*\s\+[a-z][A-Za-z0-9_$]*\|[A-Z][A-Za-z0-9_$]*\)+ end=+(+me=e-1 contains=javaScopeDecl,javaType,javaStorageClass,javaComment,javaLineComment,@javaClasses

hi def link javaCustomOperator		Operator
hi def link javaDelimiter Delimiter
hi def link javaCustomFunc  Function


