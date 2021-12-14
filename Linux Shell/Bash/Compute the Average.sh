#!/bin/bash
SUM=0
read QTY
if (( QTY >= 1 )) && (( QTY <= 500 )) ;
then
  for i in $(seq 1 1 ${QTY}) ;
  do
    read NUMBER
    if (( NUMBER >= -10000 )) && (( NUMEBR <= 10000 )) ;
    then
      SUM=$(( SUM + NUMBER ))
    fi
  done
  echo "${SUM}/${QTY}" | bc -l | xargs printf "%.3f"
fi