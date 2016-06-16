#!/bin/sh
for i in *blast_result_modified_add_length.xls
do
	cat $i |awk '0.3< $9 {print $0}' >${i}_2
done
