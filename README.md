# 总的原则
+ config, 用encrypt加密
+ common, 尽量用cUtil.pl 之类用类写的perl程序。
+ programs/appname/config，里用来存每个应用自己的config，尽量一个程序一个config.pl
+ appname 指应用名，基本上是programs下面的目录名
+ progname 指应用下的程序名（不带pl）
+ programe/appname/config/appname_config.pl looks like as follows:
```perl

package expirate_licenses_notifier;

$appname = 'etc';
$progname = 'expirate_licenses_notifier';
$feedname         = "${appname}.${progname}";



	

$notify_list = [ qw(
    zhangpeng@e-future.com.cn

)];


1;


```
+ programe/appname/appname.pl looks like as follows:
```perl
require 'config\appname_config.pl';

my $feedname = $appname::feedname;


```
