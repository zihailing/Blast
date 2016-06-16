#!/usr/bin/perl
use strict; use warnings;
use FileHandle;

my($infile) = @ARGV;
die "Please input <blast_result>!" if(@ARGV != 1);

my $in = FileHandle->new("< $infile");
my $start = "";
my $len = 0;
my $num = 1;
while(<$in>){
	chomp;
	if($_ =~ /^#/){
		print "$_\n";
	}else{
		my @array = split(/\t/, $_);
		my $now = $array[1];
		if($now ne $start){
			$start = $now;
			if($len != 0){
				print "$len\t$num\n";
			}
			$len = $array[3];
			$num = 1;
			print "$array[0]\t$array[1]\t$array[10]\t$array[11]\t$len\t";
		}else{
			$len += $array[3];
			$num++;
		}
	}
}
print "$len\n";
