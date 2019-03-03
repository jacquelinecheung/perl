#!perl

use File::Copy;

$file="a.txt";

@schemas = qw / jmyy mzyy yfyy qyyy zsyy zhyy szyy 
zjyy mmyy yjyy swyy czyy dgyy hyyy sgyy fsyy 
styy jyyy hzyy gzyy zqyy /;

open(FILE, "$file");
@lines=<FILE>;
close(FILE);

foreach $line(@lines)
{
	chomp($line);
	foreach $schema(@schemas)
	{
		$sourceFile = $line;
		$targetFile = $schema."_".$line;
		copy($sourceFile, $targetFile);
		
		$zwschema = substr($schema,0,2)."zw";
		
		open(TFILE, $targetFile);
		@arrays=<TFILE>;
		close(TFILE);
		
		open STDOUT, ">$targetFile";
		foreach $array(@arrays)
		{
			chomp($array);
			$array=~s/hwfb./$schema./g;
			$array=~s/"&&OWNER_TBCS"/$schema/g;
			$array=~s/"&&USER_COMMON"/common/g;
			$array=~s/"&&OWNER_COMM"/common/g;
			$array=~s/"&&HWZW"/$zwschema/g;
			print "$array\n";
			}
		close STDOUT;
	}
}
