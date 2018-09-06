# Property of Four Js*
# (c) Copyright Four Js 1995, 2018. All Rights Reserved.
# * Trademark of Four Js Development Tools Europe Ltd
#   in the United States and elsewhere
# 
# Four Js and its suppliers do not warrant or guarantee that these
# samples are accurate and suitable for your purposes. Their inclusion is
# purely for information purposes only.

MAIN

  DEFINE cnt INTEGER
  DEFINE arr DYNAMIC ARRAY OF RECORD
    id SMALLINT, 
    fname STRING,
    lname STRING
  END RECORD
  
  OPEN FORM f1 FROM "detail_list"
  DISPLAY FORM f1

  LET cnt = 1

  WHILE cnt <= 10
    LET arr[cnt].id = cnt
    LET arr[cnt].fname = "firstname" || cnt
    LET arr[cnt].lname = "lastname" || cnt
    LET cnt = cnt + 1
  END WHILE

  DISPLAY ARRAY arr TO srec.*
    ON ACTION focus_line_5 
  END DISPLAY

END MAIN