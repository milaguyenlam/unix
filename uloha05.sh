#!/bin/sh
awk '
BEGIN {
        RS="<"
        FS="[Hh][Rr][Ee][Ff]"
}
/^[Aa]/ {
        if (NF == 2) {
                if ($2 ~ /[ \n]*=[ \n]*["].*["]/) {
                        l = gensub(/.*=[ \n]*["](.*)["].*/,"\\1","g",$2)
                }
                else {
                        l = gensub(/[ \n]*=(.*)[> \n].*/,"\\1","g",$2)
                        if (l ~ />/) {
                                l = gensub(/(.*)>/,"\\1","g",l)
                        }
                }
                gsub(/&amp;/,"\\&",l)
                gsub("&quot;", "\"", l)
                gsub("&lt;", "<", l)
                gsub("&gt;", ">", l)
                print l
        }
}
'