+===================================================
+ Grbl - Vectric machine output configuration file   
+===================================================
+                                                
+ History                                        
+                                                  
+ Who       When        What                         
+========== =========== ============================
+ Anton K.  01.07.2017  Written                    
+===================================================

POST_NAME = "Arduino (mm) (*.nc)"

FILE_EXTENSION = "nc"

UNITS = "MM"
 
+---------------------------------------------------
+ Line terminating characters                 
+---------------------------------------------------
 
LINE_ENDING = "[13][10]"
 
+---------------------------------------------------
+ Block numbering                             
+---------------------------------------------------
 
LINE_NUMBER_START = 0
LINE_NUMBER_INCREMENT = 10
LINE_NUMBER_MAXIMUM = 999999
 
+===================================================
+ Formating for variables                     
+===================================================
 
VAR LINE_NUMBER = [N|A|N|1.0]
VAR SPINDLE_SPEED = [S|A|S|1.0]
VAR FEED_RATE = [F|C|F|1.1]
VAR X_POSITION = [X|C|X|1.4]
VAR Y_POSITION = [Y|C|Y|1.4]
VAR Z_POSITION = [Z|C|Z|1.4]
VAR ARC_CENTRE_I_INC_POSITION = [I|A|I|1.4]
VAR ARC_CENTRE_J_INC_POSITION = [J|A|J|1.4]
VAR X_HOME_POSITION = [XH|A|X|1.4]
VAR Y_HOME_POSITION = [YH|A|Y|1.4]
VAR Z_HOME_POSITION = [ZH|A|Z|1.4]
 
+===================================================
+ Block definitions for toolpath output
+===================================================

+---------------------------------------------------
+ Commands output at the start of the file
+---------------------------------------------------
 
begin HEADER
 
"(Carve)"
"(File name: [TP_FILENAME])"
"(File created: [DATE] - [TIME])"
"(Workpiece: X=[XLENGTH]mm, Y=[YLENGTH]mm, Z=[ZLENGTH]mm)"
"(Toolname: [TOOLNAME])"
""
"G17"
"G21"
"G90"
""
"G0 [ZH]"
"G0 [XH] [YH]"
""
"M3 [S] (Spindle: On)"
"M7 (Coolant: On)"
"M8 (Coolant: On)"
""
"G4 P2 (Pause: 2 sec)"
""
 
+---------------------------------------------------
+ Commands output for rapid moves 
+---------------------------------------------------
 
begin RAPID_MOVE
 
"G0 [X] [Y] [Z]"
 
+---------------------------------------------------
+ Commands output for the first feed rate move
+---------------------------------------------------
 
begin FIRST_FEED_MOVE
 
"G1 [X] [Y] [Z] [F]"
 
+---------------------------------------------------
+ Commands output for feed rate moves
+---------------------------------------------------
 
begin FEED_MOVE
 
"G1 [X] [Y] [Z]"
 
+---------------------------------------------------
+ Commands output for the first clockwise arc move
+---------------------------------------------------
 
begin FIRST_CW_ARC_MOVE
 
"G2 [X] [Y] [I] [J] [F]"
 
+---------------------------------------------------
+ Commands output for clockwise arc  move
+---------------------------------------------------
 
begin CW_ARC_MOVE
 
"G2 [X] [Y] [I] [J]"
 
+---------------------------------------------------
+ Commands output for the first counterclockwise arc move
+---------------------------------------------------
 
begin FIRST_CCW_ARC_MOVE
 
"G3 [X] [Y] [I] [J] [F]"
 
+---------------------------------------------------
+ Commands output for counterclockwise arc  move
+---------------------------------------------------
 
begin CCW_ARC_MOVE
 
"G3 [X] [Y] [I] [J]"
 
+---------------------------------------------------
+ Commands output at the end of the file
+---------------------------------------------------
 
begin FOOTER
""
"G0 [ZH]"
"G0 [XH] [YH]"
""
"G4 P2 (Pause: 2 sec)"
""
"M5 (Spindle: Off)"
"M9 (Coolant: Off)"
""
"M2 (Program: End)"
