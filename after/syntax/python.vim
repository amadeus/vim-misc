syntax keyword pythonSelf self
syntax keyword pythonBooleanFalse False
syntax keyword pythonBooleanTrue True
syntax match pythonSeparators /[\.\:\;\,]/
syntax match pythonBrackets /[()\[\]\{\}]/
syntax match pythonOperatorSymbols /[\+\-\%\*\=\>\<\!\/\|\&]/

command -nargs=+ HiLink hi def link <args>
HiLink pythonBrackets                Noise
HiLink pythonSeparators              Noise
HiLink pythonBooleanFalse            Boolean
HiLink pythonBooleanTrue             Boolean
HiLink pythonOperatorSymbols         Operator
HiLink pythonDecorator               Operator
HiLink pythonSelf                    Define
delcommand HiLink
