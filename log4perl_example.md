```perl

use Log::Log4perl;

my $conf = q(
    log4perl.rootLogger=INFO, LOGFILE, Screen    
    log4perl.appender.LOGFILE=Log::Log4perl::Appender::File
    log4perl.appender.LOGFILE.filename=sub { my @c = localtime();  return "testing.".sprintf("%04d%02d%02d", $c[5]+1900, $c[4]+1, $c[3]).".log"; }
    log4perl.appender.LOGFILE.layout=PatternLayout
    log4perl.appender.LOGFILE.layout.ConversionPattern=%d [%-5p] %c - %m%n
    log4perl.appender.Screen = Log::Log4perl::Appender::Screen
    log4perl.appender.Screen.stderr = 0
    log4perl.appender.Screen.layout = Log::Log4perl::Layout::PatternLayout
    log4perl.appender.Screen.layout.ConversionPattern =%d [%-5p] %c - %m%n
  );

Log::Log4perl::init(\$conf);
my $log = Log::Log4perl::get_logger(__PACKAGE__); 


####now the result config:
##log4perl configurations
$logconf = q(
        log4perl.rootLogger         = INFO, Logfile, Screen

        log4perl.appender.Logfile          = Log::Log4perl::Appender::File
        log4perl.appender.Logfile.filename = _nsa_app_logfile.log
        log4perl.appender.Logfile.layout   = Log::Log4perl::Layout::PatternLayout
        log4perl.appender.Logfile.layout.ConversionPattern = [%d] - [%p] - <%m{indent=33}>,  \
%n                        elapsed from start [%r] millisec       \
%n                        elapsed from later operation: [%R] millisec\
%n                        call stack:[%l] \
%n                        on server:[%H] %n%n 

        log4perl.appender.Screen         = Log::Log4perl::Appender::Screen
        log4perl.appender.Screen.stderr  = 0
        log4perl.appender.Screen.layout = Log::Log4perl::Layout::PatternLayout
	log4perl.appender.Screen.layout.ConversionPattern =  [%d] - [%p] - <%m{indent=33}>,  \
%n                        elapsed from start [%r] millisec       \
%n                        elapsed from later operation: [%R] millisec\
%n                        call stack:[%l] \
%n                        on server:[%H] %n%n 
);


```
