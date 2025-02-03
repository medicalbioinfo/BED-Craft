#!/usr/bin/perl

# Usage:
# perl BED-Craft.pl input_gene_symbol_name_file.txt

# Usage option:
# perl BED-Craft.pl input_gene_symbol_name_file.txt [-build <hg19|hg38|CHM13|mm10|mm39|other> (default: hg38)] [-buffer <number> (default: 50000)] [-chr <yes|no> (default: yes)]

# BED-Craft for Nanopore adaptive sampling
# v.2.0
# Copyright (C) 2024-2025 Fuyuki Miya
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.
#*/


use strict;
use Getopt::Long;
use File::Basename;
use File::Spec;

my ($input) = @ARGV;
my $filename;
my $bed_file;
my %gene = ();
my $totalBP = 0;
my $totalROI = 0;
my $linenum = 0;
my $miss = 0;
my %DB;

if($input =~ /(\S+)\.txt/){
	$filename = $1;
}else{
	$filename = $input;
}
$bed_file = $filename."\.bed";

open(OUT1, ">$bed_file") or die $!;


if(@ARGV < 1){
	die "Usage: perl BED-Craft.pl input_gene_symbol_name_file.txt [-genome <hg19|hg38|CHM13|mm10|mm39|other> (default: hg38)] [-buffer <number> (default: 50000)] [-chr <yes|no> (default: yes)]\n";
}

my $genome = "hg38";
my $buffer = "50000";
my $chr_option = "yes";

GetOptions(
'genome=s' => \$genome,
'buffer=s'   => \$buffer,
'chr=s'   => \$chr_option,
	) or die "Error in command line arguments\.\n Usage: perl BED-Maker.pl input_gene_symbol_name_file.txt [-genome <hg19|hg38|CHM13|mm10|mm39|other> (default: hg38)] [-buffer <number> (default: 50000)] [-chr <yes|no> (default: yes)]";

if ($buffer !~ /^\d+$/) {
	die "Error: Buffer size is not a number\.\n Usage: perl BED-Craft.pl input_gene_symbol_name_file.txt [-genome <hg19|hg38|CHM13|mm10|mm39|other> (default: hg38)] [-buffer <number> (default: 50000)] [-chr <yes|no> (default: yes)]\n";
}
if (($chr_option ne "yes") and ($chr_option ne "no")){
	die "Error: Wrong chr option\.\n Usage: perl BED-Craft.pl input_gene_symbol_name_file.txt [-genome <hg19|hg38|CHM13|mm10|mm39|other> (default: hg38)] [-buffer <number> (default: 50000)] [-chr <yes|no> (default: yes)]\n";
}

my $script_path = $0;

my $script_dir = dirname($script_path);

my $gene_annot_file = "hg38_gene_annotation\.bed";

if($genome eq "hg19"){
	$gene_annot_file = "hg19_gene_annotation\.bed";
}elsif($genome eq "CHM13"){
	$gene_annot_file = "CHM13_gene_annotation\.bed";
}elsif($genome eq "mm10"){
	$gene_annot_file = "GRCm38_mm10_gene_annotation\.bed";
}elsif($genome eq "mm39"){
	$gene_annot_file = "GRCm39_mm39_gene_annotation\.bed";
}elsif($genome ne "hg38"){
	$gene_annot_file = $genome;
}

	my $annotation_path = File::Spec->catfile($script_dir, $gene_annot_file);

open(FILE1, '<', $annotation_path) or die("The $annotation_path file cannot opened. Please check that the file is in the sampe directory as BED-Craft.pl");
while(<FILE1>){
	chomp;
	my @ensembl = split(/\t/,$_);
	my $ucsymbol = uc($ensembl[4]);
	$DB{$ucsymbol} = 1;
}
close FILE1;

open(IN, $input);
while(<IN>){
	chomp;
	$linenum++;
	my @tmp = split(/\t/,$_);
	if($tmp[0] =~ /\S+/){
		my $ucinput = uc($tmp[0]);
		$gene{$ucinput} = 1;
		if( exists $DB{$ucinput}){
		}else{
			print "Warning: "."\"".$tmp[0]."\""." is not included in the annotation file of the genome version\."."\n";
			$miss++;
		}
	}
}
close IN;

open(FILE2, '<', $annotation_path) or die("The $gene_annot_file file cannot opened. Please check that the file is in the sampe directory as BED-Craft.pl");
while(<FILE2>){
	chomp;
	my @data = split(/\t/,$_);
	my $ucsymbol = uc($data[4]);
	if( exists $gene{$ucsymbol}){
		my $start = $data[1] - $buffer;
		if($start < 0){
			$start = 0;
		}
		my $end = $data[2] + $buffer;
		my $targetlength = $end - $start;
		my $genelength = $data[2] - $data[1];
		$totalROI = $totalROI + $genelength;
		$totalBP = $totalBP + $targetlength;
		if($chr_option eq "yes"){
			print OUT1 $data[0]."\t".$start."\t".$data[2]."\t".$data[4]."_".$data[3]."\t"."0"."\t"."+"."\n";
			print OUT1 $data[0]."\t".$data[1]."\t".$end."\t".$data[4]."_".$data[3]."\t"."0"."\t"."-"."\n";
		}elsif($chr_option eq "no"){
			if($data[0] =~ /chr(\S+)/){
				my $nochr = $1;
				print OUT1 $nochr."\t".$start."\t".$data[2]."\t".$data[4]."_".$data[3]."\t"."0"."\t"."+"."\n";
				print OUT1 $nochr."\t".$data[1]."\t".$end."\t".$data[4]."_".$data[3]."\t"."0"."\t"."-"."\n";
			}
		}
	}
}
close FILE2;

my $success = $linenum - $miss;

if(($genome eq "hg19") or ($genome eq "hg38") or ($genome eq "CHM13")){
	my $GenomicRate = $totalBP / 3117292070 * 100;
	print "Input gene counts: ".$linenum."\n";
	print "Successfully targeted counts: ".$success."\n";
	print "Total ROI genes length: ".$totalROI. " bp"."\n";
	print "Total targeted length: ".$totalBP. " bp (".sprintf('%0.4f', $GenomicRate)."% of Human genome)"."\n";
	print "The file \"".$bed_file."\" has been output."."\n";
}elsif(($genome eq "mm10") or ($genome eq "mm39")){
	my $GenomicRate = $totalBP / 2730881984 * 100;
	print "Input gene counts: ".$linenum."\n";
	print "Successfully targeted counts: ".$success."\n";
	print "Total ROI genes length: ".$totalROI. " bp"."\n";
	print "Total targeted length: ".$totalBP. " bp (".sprintf('%0.4f', $GenomicRate)."% of Mouse genome)"."\n";
	print "The file \"".$bed_file."\" has been output."."\n";
}else{
	print "Input gene counts: ".$linenum."\n";
	print "Successfully targeted counts: ".$success."\n";
	print "Total ROI genes length: ".$totalROI. " bp"."\n";
	print "Total targeted length: ".$totalBP. " bp"."\n";
	print "The file \"".$bed_file."\" has been output."."\n";
}
