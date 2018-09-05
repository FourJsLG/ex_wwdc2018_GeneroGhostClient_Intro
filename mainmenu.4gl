# Property of Four Js*
# (c) Copyright Four Js 1995, 2018. All Rights Reserved.
# * Trademark of Four Js Development Tools Europe Ltd
#   in the United States and elsewhere
# 
# Four Js and its suppliers do not warrant or guarantee that these
# samples are accurate and suitable for your purposes. Their inclusion is
# purely for information purposes only.

 MAIN
 
  DEFINE fe_client STRING
  
  CALL ui.Interface.loadStartMenu("mainmenu_sm")
  CALL ui.Interface.loadStyles("mainmenu_styles")
  
  # Possible values returned TO feName:
  # "Genero Desktop Client" for Genero Desktop Client.
  # "GBC" for Genero Browser Client.
  # "GMA" for Genero Mobile for Android.
  # "GMI" for Genero Mobile for iOS.
  CALL ui.Interface.frontCall("standard", "feInfo", ["feName"], [fe_client])
  
  CLOSE WINDOW SCREEN
  
  CASE fe_client
  
     WHEN "Genero Desktop Client"
       OPEN WINDOW w1 WITH 20 ROWS, 80 COLUMNS ATTRIBUTES(STYLE="sm2")
       
      WHEN "GBC"
       OPEN WINDOW w1 WITH 20 ROWS, 80 COLUMNS ATTRIBUTES(STYLE="sm1")
       
      OTHERWISE
       DISPLAY "front-end not applicable to display this app !"
       EXIT PROGRAM
    
  END CASE
  
  MENU "Test"
  
     ON ACTION QUIT
      EXIT MENU 
      
  END MENU
  
  CLOSE WINDOW w1
  
END MAIN