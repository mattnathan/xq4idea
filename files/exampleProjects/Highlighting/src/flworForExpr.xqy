declare variable $var :=
    for $var in ""
    return ""
;
declare variable $var :=
    for $var in ""
    for $var in ""
    return ""
;
declare variable $var :=
    for $var as empty-sequence() in ""
    for $var at $var in ""
    for $var in "", $var2 in ""
    return ""
;