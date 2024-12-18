#!/usr/bin/perl

use strict;
my ($file1) = @ARGV;

open(IN,$file1);
while(<IN>){
	chomp;
	my $geneID = 0;
	my $geneName = 0;
	my @tmp = split(/\t/,$_);
	if($tmp[2] eq "gene"){
		if($tmp[8] =~ /gene_id\ \"(\S+?)\"/){
			$geneID = $1;
			if(($tmp[0] ne "MT") and ($tmp[8] =~ /gene_name\ \"(\S+?)\"/)){
				$geneName = $1;
				my $BED_start = $tmp[3] - 1;
				print "chr".$tmp[0]."\t".$BED_start."\t".$tmp[4]."\t".$geneID."\t".$geneName."\n";
			}
		}
	}
}
close IN;
