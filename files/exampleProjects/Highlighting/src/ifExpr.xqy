declare variable $var :=
    if ($var)
    then "true"
    else "false";
declare variable $var :=
    if (if ($var) then $var else $var)
    then if ($var) then $var else $var
    else if ($var) then $var else $var;

