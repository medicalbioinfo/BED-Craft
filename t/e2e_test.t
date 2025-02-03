use strict;
use warnings;
use Test::More tests => 2;
use IPC::Open3;
use File::Temp qw(tempfile tempdir);
use File::Basename;

# Path to the BED-Craft script
my $script = "BED-Craft/BED-Craft.pl";

# Create a temporary input gene list file
my ($fh, $filename) = tempfile(SUFFIX => '.txt');
print $fh "EGFR\nKRAS\n";
close $fh;

print "filename is".$filename."\n";

# 1. Run the script and check if the BED file is generated

my $filename2;
if($filename =~ /(\S+)\.txt/){
    $filename2 = $1;
}
my $output_bed = "$filename2.bed";


my $cmd = "perl $script $filename";
my $exit_code = system($cmd);
ok($exit_code == 0, "E2E Test: BED-Craft runs without errors");

# 2. Verify that the output file contains valid chromosome data
open my $bed_fh, '<', $output_bed or die "Cannot open $output_bed";
my @lines = <$bed_fh>;
close $bed_fh;
like($lines[0], qr/^chr/, "E2E Test: Output BED file contains valid chromosome data");

done_testing();
