#!/bin/bash
read X
read Y
if (( X<Y ));
then
  echo "X is less than Y"
else
  if (( X>Y ));
  then
    echo "X is greater than Y"
  else
    echo "X is equal to Y"
  fi
fi