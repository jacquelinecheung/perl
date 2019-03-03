#!C:\Perl\bin\perl

use File::Copy;

$file = <STDIN>;
chomp($file);

@schemas = qw / jmyy mzyy yfyy qyyy zsyy zhyy szyy 
zjyy mmyy yjyy swyy czyy dgyy hyyy sgyy fsyy 
styy jyyy hzyy gzyy zqyy /;

foreach $schema(@schemas)
{
	$sourceFile = $file;
	$targetFile = $schema."_".$file;
	copy($sourceFile, $targetFile);
	
	$zwschema = substr($schema,0,2)."zw";
	
	$tbspace = uc(substr($schema,0,2)."_mcm_data");
	$inspace = uc(substr($schema,0,2)."_mcm_ind");
	
	open(FILE, $targetFile);
	@lines=<FILE>;
	close(FILE);
	
	open STDOUT, ">$targetFile";
	foreach $line(@lines)
	{
		chomp($line);
		$line=~s/hwfb./$schema./g;
		$line=~s/HWFB./$schema./g;
		$line=~s/"&&OWNER_TBCS"/$schema/g;
		$line=~s/"&&USER_COMMON"/common/g;
		$line=~s/"&&OWNER_COMM"/common/g;
		$line=~s/"&&HWZW"/$zwschema/g;
		$line=~s/hwzw/$zwschema/g;
		$line=~s/SZ_CM_DATA/$tbspace/g;
		$line=~s/SZ_CM_IND/$inspace/g;
		print "$line\n";
	}
	close STDOUT;
}
