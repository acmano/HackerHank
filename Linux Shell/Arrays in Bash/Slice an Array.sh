i=0
while read line
do
  array[i++]=${line}
done
for i in $(seq 3 1 7);
do
  echo -n "${array[$i]} "
done