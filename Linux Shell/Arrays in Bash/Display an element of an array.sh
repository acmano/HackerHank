i=0
for line in $(cat)
do
  array[i++]=${line}
done
echo ${array[3]}