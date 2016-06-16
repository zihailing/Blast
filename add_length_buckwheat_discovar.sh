#!/bin/bash
####################################################################
#
#A (quite) simple submit script for a one or tow processor job
#
####################################################################
#
# SGE options
#
#Change to the current working directory upon starting of the job
#$ -cwd
#
source ~/.profile
# Specify the kind of shell script you use, for example, bash
#$ -S /bin/bash
#
# join the error and standard output streams
#$ -j y
#
#
# don't flood myself with e-mail
#$ -m e
#
# this is my e-mail address
##$ -M zihailing@live.cn
#
#where the format error go
#$ -e /psc/home/zihailing/
#where the format output go
#$ -o /psc/home/zihailing
# notify me about pending SIG_STOP and SIG_KILL
#$ -notify
#
# Specify the array start ,end , step
#$ -t 1-4:1 
# end of SGE stuff
#########################################################
# now execute my job:
ARRAY=(head ath_ch_buckwheat_discovar_blast_result_modified ath_mt_buckwheat_discovar_blast_result_modified        rice_ch_buckwheat_discovar_blast_result_modified    rice_mt_buckwheat_discovar_blast_result_modified)
DIR=/psc/home/zihailing/zihailing/assembly_data_blast_20160613/
perl $DIR/add_length.pl /psc/home/zihailing/zihailing/Assembly_fromTQM/buckwheat_discovar.fa.length $DIR/${ARRAY[$SGE_TASK_ID]} >$DIR/${ARRAY[$SGE_TASK_ID]}_add_length.xls
