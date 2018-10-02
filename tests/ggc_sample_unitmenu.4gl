IMPORT os

MAIN

  CONSTANT working_dir = "..\\bin"
  CONSTANT tested_appname = "ggc_sample.42r"
  
  DEFINE filename, cmd STRING
  DEFINE cmd_status INT
  DEFINE ch base.Channel

  LET ch = base.Channel.create()

  IF fgl_getenv("OS") IS NOT NULL THEN
    CALL ch.openPipe("dir /b /a-d *.42r","r")
  ELSE 
     CALL ch.openPipe("ls","r")
  END IF
  
  WHILE ch.read([filename])
    LET cmd_status = 0
    IF filename != "ggc_sample_unitmenu.42r" THEN
      DISPLAY "starting unit test : " || filename
      LET cmd = "fglrun " || filename || " --workingDir " || working_dir
      RUN cmd RETURNING cmd_status
      IF cmd_status THEN
        DISPLAY "Error while running test : " || filename
      END IF
    END IF
  END WHILE
  
  CALL ch.close()
  
END MAIN