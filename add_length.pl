#!/usr/bin/perl
use strict; use warnings; 
use FileHandle;

my($len_file, $blast_file) = @ARGV;
die "Please input <length_file><blast_file>!" if(@ARGV != 2);

my $in1 = FileHandle->new("< $len_file");
my $in2 = FileHandle->new("< $blast_file");

my %hash;
print "mt/chl\tmt/chl_length\tcontig\tcontig_length\te-value\tbit_score\tbest_alignment_length\twhole_alignment_length\tpercent_a\tpercent_b\tpercent_c\talign_region_number\n";
while(<$in1>){
	chomp;
	my @array = split(/\t/,$_);
	$array[0] =~ /^>(\S+)/;
	$hash{$1} = $array[1];
}

while(<$in2>){
	chomp;
	if($_ !~ /^#/){
		my @array_blast = split(/\t/, $_);
		if(exists($hash{$array_blast[1]})){
			if($blast_file =~ /ath_ch/){
				my $per1 = $array_blast[5]/154478;
				my $per2 = $array_blast[5]/$hash{$array_blast[1]};
				my $per3 = $hash{$array_blast[1]}/154478;
				print "$array_blast[0]\t154478\t$array_blast[1]\t$hash{$array_blast[1]}\t$array_blast[2]\t$array_blast[3]\t$array_blast[4]\t$array_blast[5]\t$per1\t$per2\t$per3\t$array_blast[6]\n";
			}elsif($blast_file =~ /ath_mt/){
				my $per1 = $array_blast[5]/366924;
				my $per2 = $array_blast[5]/$hash{$array_blast[1]};
				my $per3 = $hash{$array_blast[1]}/366924;
				print "$array_blast[0]\t366924\t$array_blast[1]\t$hash{$array_blast[1]}\t$array_blast[2]\t$array_blast[3]\t$array_blast[4]\t$array_blast[5]\t$per1\t$per2\t$per3\t$array_blast[6]\n";
			}elsif($blast_file =~ /rice_ch/){
				my $per1 = $array_blast[5]/134525;
				my $per2 = $array_blast[5]/$hash{$array_blast[1]};
				my $per3 = $hash{$array_blast[1]}/134525;
				print "$array_blast[0]\t134525\t$array_blast[1]\t$hash{$array_blast[1]}\t$array_blast[2]\t$array_blast[3]\t$array_blast[4]\t$array_blast[5]\t$per1\t$per2\t$per3\t$array_blast[6]\n";
			}elsif($blast_file =~ /rice_mt/){
				my $per1 = $array_blast[5]/490520;
				my $per2 = $array_blast[5]/$hash{$array_blast[1]};
				my $per3 = $hash{$array_blast[1]}/490520;
				print "$array_blast[0]\t490520\t$array_blast[1]\t$hash{$array_blast[1]}\t$array_blast[2]\t$array_blast[3]\t$array_blast[4]\t$array_blast[5]\t$per1\t$per2\t$per3\t$array_blast[6]\n";
			}
		}
	}else{
		#print "$_\n";
	}
}
