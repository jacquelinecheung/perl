#!perl

use File::Copy;

$file = <STDIN>;
chomp($file);

#@schemas = qw / jmyy mzyy yfyy qyyy zsyy zhyy szyy 
#zjyy mmyy yjyy swyy czyy dgyy hyyy sgyy fsyy 
#styy jyyy hzyy gzyy zqyy /;

$sourceFile = $file;
$targetFile = common."_".$file;
copy($sourceFile, $targetFile);
	
open(FILE, $targetFile);
@lines=<FILE>;
close(FILE);
	
open STDOUT, ">$targetFile";
foreach $line(@lines)
{
	chomp($line);
	#$line=~s/hwfb./$schema./g;
	#$line=~s/&&OWNER_TBCS/$schema/g;
	$line=~s/"&&USER_COMMON"/common/g;
	$line=~s/"&&OWNER_COMM"/common/g;
	print "$line\n";
}
close STDOUT;
