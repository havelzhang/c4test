package etc::expirate_licenses_email;
use Log::Log4perl qw (:easy);
use Log::Log4perl::Level;

        



         # Configuration in a string ...
      my $conf = q(
        log4perl.rootLogger         =  INFO, Logfile, Screen

        log4perl.appender.Logfile          = Log::Log4perl::Appender::File
        log4perl.appender.Logfile.filename = test.log
        log4perl.appender.Logfile.layout   = Log::Log4perl::Layout::PatternLayout
        log4perl.appender.Logfile.layout.ConversionPattern = [%d] [%c] %F %L %m%n

        log4perl.appender.Screen         = Log::Log4perl::Appender::Screen
        log4perl.appender.Screen.stderr  = 0
        log4perl.appender.Screen.layout =  Log::Log4perl::Layout::PatternLayout	
        log4perl.appender.Screen.layout.ConversionPattern = [%d] - [%p] - <%m{indent=34}>,  \
%n                        elapsed from start [%r] millisec       \
%n                        elapsed from later operation: [%R] millisec\
%n                        call stack:[%l] \
%n                        on server:[%H] %n%n 
							    
      );

      #[%d] - Message<%m>, %n      elapsed from start [%r] %n      elapsed from later operation: [%R] %n      [%T on server:[%H]] %n      %F  on line No. %L %n

         # ... passed as a reference to init()
      Log::Log4perl::init( \$conf );

       my $log = Log::Log4perl::get_logger('etc.expirate_licenses_email.pl');

	$log->info("Some message\nin first message");
        $log->info("Another message");
	$log->category();



	exec_sql();

	exit(0);



       sub exec_sql{
       	$log->log($INFO,"Now I'm in exec_sql");
	$log->debug("some result is : ... ");
	$log->error("some error occurs: ... ");
       }
