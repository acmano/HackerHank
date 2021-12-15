i=0
for line in $(cat)
do
  array[i++]=${line}
done
for j in $(seq 0 1 $i);
do
  countrylist[$((j+0))]=${array[$j]}
  countrylist[$((j+i+1))]=${array[$j]}
  countrylist[$((j+2*i+2))]=${array[$j]}
done
echo ${countrylist[@]}