#!/bin/bash

RecallList="0.99 0.9 0.8 0.7 0.6 0.5 0.4 0.3 0.2"
BucketSize="50"

for K in 1 ; do
  ../../TuneOneMeth.sh "$RecallList" ~/DataNIPS/sig10k_norm.txt ItakuraSaitoFast  1111 0.1 0.1 $K ResultsItakuraSaito/OutFile.sig10k_norm.$K $BucketSize
  if [ "$?" != "0" ] ; then
    echo "Tunning failed!"
    exit 1
  fi

  for n in 16 128 ; do 
    ../../TuneOneMeth.sh "$RecallList" ~/DataNIPS/final$n.txt ItakuraSaitoFast  $n 0.1 0.1 $K ResultsItakuraSaito/OutFile.final$n.$K $BucketSize
    if [ "$?" != "0" ] ; then
      echo "Tunning failed!"
      exit 1
    fi
  done
done