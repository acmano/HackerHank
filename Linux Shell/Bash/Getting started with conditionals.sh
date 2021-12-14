#!/bin/bash
read VAR
case ${VAR} in
  'y') echo "YES" ;;
  'Y') echo "YES" ;;
  'n') echo "NO"  ;;
  'N') echo "NO"  ;;
esac