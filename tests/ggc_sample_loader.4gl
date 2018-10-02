MAIN

  CONSTANT feed_progname = "myapp.42m"
  CONSTANT feed_url = "http://localhost:6310/ua/r/ggc_sample_LaurentGalais"
  
  DEFINE feed_count, feed_interval, i INT
  DEFINE cmd STRING
  
  LET feed_count = arg_val(1)
  LET feed_interval = arg_val(2)
 
  LET cmd = "fglrun " || feed_progname || " --launcher " || feed_url || " –useLogTiming"

  LET i = 1

  WHILE i <= feed_count

	DISPLAY "starting fake user #" || i
	RUN cmd WITHOUT WAITING

    DISPLAY "Wait " || feed_interval || " seconds"
	SLEEP feed_interval
    
	LET i = i + 1

  END WHILE

END MAIN