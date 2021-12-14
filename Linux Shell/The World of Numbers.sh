#!/bin/bash
read x
read y
if ((x >= -100 )) && ((y != 0)) && ((y <= 100));
then
  echo $((x+y))
  echo $((x-y))
  echo $((x*y))
  echo $((x/y))
f