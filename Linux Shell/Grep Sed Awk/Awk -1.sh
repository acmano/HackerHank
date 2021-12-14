awk '
{
if ( length($2)==0 || length($3)==0 || length($4)==0 ) print "Not all scores are available for "$1;
}
'