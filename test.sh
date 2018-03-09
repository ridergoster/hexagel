#!/usr/bin/env bash

res="mai.son"

for i in $(seq 1 ${#res})
do
  char=${res:i-1:1}
  if [ "$char" != "." ]
  then
    x=$(date)
    echo "$char $x"
  fi
done
