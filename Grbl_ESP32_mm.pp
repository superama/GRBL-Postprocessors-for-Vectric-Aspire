+----------------------------------------------------------
+ Grbl ESP32 - 06.08.2020 
+----------------------------------------------------------

POST_NAME = "AESP32 (mm) (*.nc)"
FILE_EXTENSION = "nc"
UNITS = "MM"

+DIRECT_OUTPUT = "VTransfer"

+----------------------------------------------------------
+ Line terminating characters
+----------------------------------------------------------

LINE_ENDING = "[13][10]"

+----------------------------------------------------------
+ Block numbering
+----------------------------------------------------------

LINE_NUMBER_START = 0
LINE_NUMBER_INCREMENT = 10
LINE_NUMBER_MAXIMUM = 999999

+----------------------------------------------------------
+ Formating for variables
+----------------------------------------------------------

VAR LINE_NUMBER = [N|A|N|1.0]
VAR SPINDLE_SPEED = [S|A|S|1.0]
VAR FEED_RATE = [F|C|F|1.1]

VAR SAFE_Z_HEIGHT = [SAFEZ|A|Z|1.3]

VAR X_POSITION = [X|C|X|1.3]
VAR Y_POSITION = [Y|C|Y|1.3]
VAR Z_POSITION = [Z|C|Z|1.3]

VAR ARC_CENTRE_I_INC_POSITION = [I|A|I|1.3]
VAR ARC_CENTRE_J_INC_POSITION = [J|A|J|1.3]

VAR X_HOME_POSITION = [XH|A|X|1.3]
VAR Y_HOME_POSITION = [YH|A|Y|1.3]
VAR Z_HOME_POSITION = [ZH|A|Z|1.3]

VAR X_LENGTH = [XLENGTH|A||1.3]
VAR Y_LENGTH = [YLENGTH|A||1.3]
VAR Z_LENGTH = [ZLENGTH|A||1.3]

+----------------------------------------------------------
+ Commands output at the start of the file
+----------------------------------------------------------

begin HEADER
"(Date: [DATE] - [TIME])"
"(Size: X [XLENGTH] mm, Y [YLENGTH] mm, Z [ZLENGTH] mm)"
"(Tool: [TOOLS_USED])"
""
"G17"
"G21"
"G90"
""
"G0 [ZH]"
"G0 [XH] [YH]"
""
"M3 [S]"
"M8"
""
"G4 P2"
""

+----------------------------------------------------------
+ Commands output for rapid moves
+----------------------------------------------------------

begin RAPID_MOVE
"G0[X][Y][Z]"

+----------------------------------------------------------
+ Commands output for the first feed rate move
+----------------------------------------------------------

begin FIRST_FEED_MOVE
"G1[X][Y][Z][F]"

+----------------------------------------------------------
+ Commands output for feed rate moves
+----------------------------------------------------------

begin FEED_MOVE
"G1[X][Y][Z]"

+----------------------------------------------------------
+ Commands output for the first clockwise arc move
+----------------------------------------------------------

begin FIRST_CW_ARC_MOVE
"G2[X][Y][I][J][F]"

+----------------------------------------------------------
+ Commands output for clockwise arc  move
+----------------------------------------------------------

begin CW_ARC_MOVE
"G2[X][Y][I][J]"

+----------------------------------------------------------
+ Commands output for the first counterclockwise arc move
+----------------------------------------------------------

begin FIRST_CCW_ARC_MOVE
"G3[X][Y][I][J][F]"

+----------------------------------------------------------
+ Commands output for counterclockwise arc  move
+----------------------------------------------------------

begin CCW_ARC_MOVE
"G3[X][Y][I][J]"

+----------------------------------------------------------
+ Commands output at the end of the file
+----------------------------------------------------------

begin FOOTER
""
"G0 [ZH]"
"G0 [XH] [YH]"
""
"M5"
"M9"
""
"M2"
""
