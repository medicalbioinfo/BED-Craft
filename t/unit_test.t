use strict;
use warnings;
use Test::More tests => 4;
use File::Temp qw(tempfile tempdir);
use IPC::Open3;

# BED-Craftスクリプトのパス
my $script = "../BED-Craft.pl";

# テスト用の入力ファイルを作成
my ($fh, $filename) = tempfile();
print $fh "BRCA1\nTP53\n";
close $fh;

# 1. スクリプトが正常に実行できるか
my $output_bed = "$filename.bed";
my $cmd = "perl $script $filename";
my $exit_code = system($cmd);
ok($exit_code == 0, "BED-Craft runs without errors");

# 2. 出力BEDファイルが作成されるか
ok(-e $output_bed, "Output BED file is created");

# 3. 出力ファイルの中身が正しいか
open my $bed_fh, '<', $output_bed or die "Cannot open $output_bed";
my @lines = <$bed_fh>;
close $bed_fh;
ok(scalar(@lines) > 0, "Output BED file is not empty");

# 4. 不正なオプションでエラーが発生するか
my $invalid_cmd = "perl $script $filename -invalid_option";
my $invalid_exit_code = system($invalid_cmd);
ok($invalid_exit_code != 0, "Invalid option causes an error");

done_testing();
