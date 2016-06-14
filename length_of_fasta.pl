#!/usr/bin/perl
use strict; use warnings; 
use FileHandle;

my($infile) = @ARGV;
die "Please input <fasta_file>!" if(@ARGV != 1);

my $in = FileHandle->new("< $infile");

my $len = 0;
while(<$in>){
	chomp;
	if($_ =~ /^>/){
		if($len != 0){
			print "$len\n$_\t";
			$len = 0;
		}else{
			print "$_\t";
		}
	}else{
		my $len_one = length($_);
		$len += $len_one;
	}
}
print "$len\n";
