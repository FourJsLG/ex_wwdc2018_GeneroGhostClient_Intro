# Property of Four Js*
# (c) Copyright Four Js 1995, 2018. All Rights Reserved.
# * Trademark of Four Js Development Tools Europe Ltd
#   in the United States and elsewhere
# 
# Four Js and its suppliers do not warrant or guarantee that these
# samples are accurate and suitable for your purposes. Their inclusion is
# purely for information purposes only.

MAIN
  DEFINE txt STRING
  LET txt=arg_val(1)
  OPEN FORM f1 FROM "hello"
  DISPLAY FORM f1
  INPUT BY NAME txt WITHOUT DEFAULTS
END MAIN
