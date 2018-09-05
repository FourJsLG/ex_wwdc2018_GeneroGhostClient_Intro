# Property of Four Js*
# (c) Copyright Four Js 1995, 2018. All Rights Reserved.
# * Trademark of Four Js Development Tools Europe Ltd
#   in the United States and elsewhere
# 
# Four Js and its suppliers do not warrant or guarantee that these
# samples are accurate and suitable for your purposes. Their inclusion is
# purely for information purposes only.

MAIN
  OPTIONS INPUT WRAP, FIELD ORDER FORM
  OPEN FORM f FROM "edit_widget"
  DISPLAY FORM f
  MENU "Edit"
    COMMAND "INPUT"      CALL input1()
    COMMAND "CONSTRUCT"  CALL const1()
    COMMAND KEY(INTERRUPT) "Exit" EXIT MENU
  END MENU
END MAIN

FUNCTION input1()
  DEFINE rec RECORD
           r1 INT,
           r2 VARCHAR(20),
           r3 DECIMAL(10,2),
           r4 DATE,
           comment STRING
         END RECORD
  LET rec.r1=123
  LET rec.r2="ABCDEF"
  LET rec.r3=-456.78
  LET rec.r4=MDY(12,20,2004)
  LET INT_FLAG=FALSE
  INPUT BY NAME rec.* WITHOUT DEFAULTS ATTRIBUTES(UNBUFFERED)
      ON CHANGE r1
         LET rec.comment = "ON CHANGE r1=",rec.r1
      ON CHANGE r2
         LET rec.comment = "ON CHANGE r2=",rec.r2
      ON CHANGE r3
         LET rec.comment = "ON CHANGE r3=",rec.r3
      ON CHANGE r4
         LET rec.comment = "ON CHANGE r4=",rec.r4
  END INPUT
END FUNCTION

FUNCTION const1()
  DEFINE qt STRING
  LET INT_FLAG=FALSE
  CONSTRUCT BY NAME qt ON r1,r2,r3,r4
  DISPLAY qt TO comment
END FUNCTION
