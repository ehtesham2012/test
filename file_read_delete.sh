#!/bin/bash
for f in *.txt; 
do 
	head -c -20 $f > "new_$f";
	rm -rf $f
done
