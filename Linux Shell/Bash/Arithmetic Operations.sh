#!/bin/bash
read VAR
echo ${VAR} | bc -l | xargs printf "%.3f"