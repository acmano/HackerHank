#!/bin/bash
read S1
read S2
read S3
if (( S1 >= 1 )) && (( Z <= 1000 )) && (( S1+S2 > S3 )) && (( S1+S3 > S2 )) && (( S2+S3 > S1 )) ;
then
  if (( S1 == S2 )) && (( S2 == S3 ));
  then
    echo "EQUILATERAL"
  else
    if (( S1 == S2 )) || (( S2 == S3 )) || (( S3 == S1 )) ;
    then 
      echo "ISOSCELES"
    else
      echo "SCALENE"
    fi
  fi
fi