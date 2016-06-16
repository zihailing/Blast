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
#$ -t 1-5:1 
# end of SGE stuff
#########################################################
# now execute my job:
ARRAY=(head ath_ch  ath_mt  rice_b1  rice_ch  rice_mt)
DIR=/psc/home/zihailing/zihailing/assembly_data_blast_20160613/
blastall -p blastn -e 1e-5 -m 9 -i $DIR/${ARRAY[$SGE_TASK_ID]}.fasta -d /psc/home/zihailing/zihailing/Assembly_fromTQM/buckwheat_discovar.fa -o /psc/home/zihailing/zihailing/assembly_data_blast_20160613/${ARRAY[$SGE_TASK_ID]}_buckwheat_discovar_blast_result
blastall -p blastn -e 1e-5 -m 9 -i $DIR/${ARRAY[$SGE_TASK_ID]}.fasta -d /psc/home/zihailing/zihailing/Assembly_fromTQM/buckwheat_smrtdenovo.utg.fa -o /psc/home/zihailing/zihailing/assembly_data_blast_20160613/${ARRAY[$SGE_TASK_ID]}_buckwheat_smrtdenovo_blast_result
blastall -p blastn -e 1e-5 -m 9 -i $DIR/${ARRAY[$SGE_TASK_ID]}.fasta -d /psc/home/zihailing/zihailing/Assembly_fromTQM/millet_Pm.Discovar.scaffold.fa -o /psc/home/zihailing/zihailing/assembly_data_blast_20160613/${ARRAY[$SGE_TASK_ID]}_millet_discovar_blast_result
blastall -p blastn -e 1e-5 -m 9 -i $DIR/${ARRAY[$SGE_TASK_ID]}.fasta -d /psc/home/zihailing/zihailing/Assembly_fromTQM/millet_ruanjie.utg.fa -o /psc/home/zihailing/zihailing/assembly_data_blast_20160613/${ARRAY[$SGE_TASK_ID]}_millet_smrtdenovo_blast_result
