#!/bin/bash
for f in /incoming/*.txt; 
do 
	head -2 $f > "new_$f";
	rm -rf $f
done
