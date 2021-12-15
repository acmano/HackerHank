i=0
while read line
do
  array[i++]=${line}
done
echo  ${array[@]/*[aA]*/}