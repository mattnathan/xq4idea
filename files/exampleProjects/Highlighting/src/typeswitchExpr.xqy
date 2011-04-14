declare variable $var :=
    typeswitch ($var)
        case my:node return ""
        case $var as empty-sequence() return 2
        default return 4
;

declare variable $var :=
    typeswitch ($var)
        case my:node return ""
        case $var as empty-sequence() return 2
        default return 4
;