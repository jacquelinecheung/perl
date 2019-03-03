#!/usr/bin/perl

use Digest::MD5;

$line = <stdin>;
chomp($line);
$md5 = Digest::MD5 -> new;
$md5 -> add($line);
$digest = $md5 -> hexdigest;
$passwd = uc($digest);

print "$line MD5 password is $passwd\n";
