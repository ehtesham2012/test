#!/bin/bash
for f in *.txt; 
do 
	head -2 $f > "new_$f";
	rm -rf $f
done
