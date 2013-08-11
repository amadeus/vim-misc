syntax keyword pythonSelf self
syntax keyword pythonDef def
syntax keyword pythonBooleanFalse False
syntax keyword pythonBooleanTrue True
syntax match pythonSeparators /[\.\:\;\,]/
syntax match pythonBrackets /[()\[\]\{\}]/
syntax match pythonOperatorSymbols /[\+\-\%\*\=\>\<\!\/\|\&]/

command -nargs=+ HiLink hi def link <args>
HiLink pythonBrackets                Operator
HiLink pythonSeparators              Noise
HiLink pythonBooleanFalse            Boolean
HiLink pythonBooleanTrue             Boolean
HiLink pythonOperatorSymbols         Operator
HiLink pythonDecorator               Operator
HiLink pythonSelf                    StorageClass
HiLink pythonDef                     StorageClass
delcommand HiLink
