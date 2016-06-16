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
ARRAY=(head buckwheat_discovar.fa   buckwheat_smrtdenovo.utg.fa     millet_Pm.Discovar.scaffold.fa  millet_ruanjie.utg.fa)
DIR=/psc/home/zihailing/zihailing/Assembly_fromTQM/
perl /psc/home/zihailing/zihailing/assembly_data_blast_20160613/length_of_fasta.pl $DIR/${ARRAY[$SGE_TASK_ID]} >$DIR/${ARRAY[$SGE_TASK_ID]}.length
