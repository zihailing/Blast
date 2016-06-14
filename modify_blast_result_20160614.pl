#!/usr/bin/perl
use strict; use warnings;
use FileHandle;

my($infile) = @ARGV;
die "Please input <blast_result>!" if(@ARGV != 1);

my $in = FileHandle->new("< $infile");
my $start = "";
my $len = 0;
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
				print "$len\n";
			}
			$len = $array[3];
			print "$array[0]\t$array[1]\t$array[10]\t$array[11]\t$len\t";
		}else{
			$len += $array[3]
		}
	}
}
print "$len\n";
