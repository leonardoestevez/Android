BT.OPEN 0

ARRAY.LOAD menu$[], "Mash", "Sparge", "Boil",  "Disconnect","Quit"

new_connection:
xdomenu =1

!ELECT type, type$[], title$
type = 1
IF (type = 0) | (type =3)
 PRINT "Thanks for playing"
 BT.CLOSE
 END
ELSEIF type = 1
 BT.CONNECT
ENDIF


ln = 0
DO
 BT.STATUS s
 IF s = 1
  ln = ln + 1
  PRINT "Listening", ln
 ELSEIF s =2
  PRINT "Connecting"
 ELSEIF s = 3
  PRINT "Connected"
  PRINT "Touch any text line to send, disconnect or quit."
 ENDIF
 PAUSE 1000

UNTIL s = 3

BT.DEVICE.NAME device$

! *** Read/Write Loop ****

RW_Loop:

DO

 ! If the screen is touched, the interrupt
 ! code will change xdoMemu to 1 (true)
 ! In that case, show the menu

 IF xdoMenu
  xdoMenu =0
  SELECT menu,  menu$[], "Do what?"
  IF menu = 1 THEN GOSUB Mash
  IF menu = 2 THEN GOSUB Sparge
  IF menu = 3 THEN GOSUB Boil
  IF menu = 4 THEN BT.DISCONNECT
  IF menu = 5
   PRINT "Thanks for playing"
   BT.CLOSE
   END
  ENDIF

 ENDIF


 ! Read status to insure
 ! that we remain connected.
 ! If disconnected, program
 ! reverts to listen mode.
 ! In that case, ask user
 ! what to do.

 BT.STATUS s
 IF s<> 3
  PRINT "Connection lost"
  GOTO new_connection
 ENDIF

 ! Read messages until
 ! the message queue is
 ! empty

 DO
  BT.READ.READY rr
  IF rr
   BT.READ.BYTES rmsg$
   PRINT device$;": ";rmsg$
  ENDIF
  UNTIL rr = 0
PAUSE 1000
UNTIL 0

Mash:
PRINT "DOWNLOADING MASH PROGRAM"
BT.WRITE "put 14 100"
PAUSE 500
BT.WRITE "put 14 100"
PAUSE 1000
!BT.WRITE "put 18 0"
!PAUSE 1000
!BT.WRITE "put 19 0"
!PAUSE 1000
BT.WRITE "put 2 100"
PAUSE 1000
BT.WRITE "read"
PAUSE 500
BT.WRITE "get 3"
PAUSE 500
BT.WRITE "get 7"
PAUSE 500
BT.WRITE "sleep 50"
PAUSE 500
BT.WRITE "ifl 7 220"
PAUSE 500
BT.WRITE "put 19 100"
PAUSE 500
BT.WRITE "put 2 0"
PAUSE 500
BT.WRITE "endif"
PAUSE 500
BT.WRITE "ifg 7 300"
PAUSE 500
BT.WRITE "put 19 0"
PAUSE 500
BT.WRITE "endif"
PAUSE 500
BT.WRITE "do"
PAUSE 500
BT.WRITE "put 14 0"
PRINT "NOW MASHING"
RETURN

Sparge:
PRINT "DOWNLOADING SPARGE PROGRAM"
BT.WRITE "put 14 100"
PAUSE 1000
BT.WRITE "put 2 100"
PAUSE 1000
BT.WRITE "put 18 100"
PAUSE 1000
BT.WRITE "put 19 100"
PAUSE 1000
BT.WRITE "read"
PAUSE 500
BT.WRITE "get 7"
PAUSE 500
BT.WRITE "sleep 50"
PAUSE 500
BT.WRITE "ifl 7 300"
PAUSE 500
BT.WRITE "put 19 0"
PAUSE 500
BT.WRITE "put 3 +1"
PAUSE 500
BT.WRITE "ifg 3 500"
PAUSE 500
BT.WRITE "put 18 0"
PAUSE 500
BT.WRITE "endif"
PAUSE 500
BT.WRITE "do"
PAUSE 500
BT.WRITE "put 14 0"
PRINT "NOW SPARGING"
RETURN

Boil:
PRINT "DOWNLOADING BOIL/COOL PROGRAM"
BT.WRITE "put 14 100"
PAUSE 1000
BT.WRITE "put 2 100"
PAUSE 1000
BT.WRITE "read"
PAUSE 500
BT.WRITE "get 7"
PAUSE 500
BT.WRITE "sleep 50"
PAUSE 500
BT.WRITE "get 3"
PAUSE 500
BT.WRITE "put 3 +1"
PAUSE 500
BT.WRITE "ifg 3 3600"
PAUSE 500
BT.WRITE "put 2 0"
PAUSE 500
BT.WRITE "sleep 9000"
PAUSE 500
BT.WRITE "put 19 100"
PAUSE 500
BT.WRITE "endif"
PAUSE 500
BT.WRITE "ifg 7 150"
PAUSE 500
BT.WRITE "put 3 0"
PAUSE 500
BT.WRITE "put 19 0"
PAUSE 500
BT.WRITE "endif"
PAUSE 500
BT.WRITE "do"
PAUSE 500
BT.WRITE "put 14 0"
PRINT "NOW BOILING/COOLING"
RETURN

Lager:
PRINT "DOWNLOADING LAGER PROGRAM"
BT.WRITE "put 14 100"
PAUSE 500
BT.WRITE "read"
PAUSE 500
BT.WRITE "get 7"
PAUSE 500
BT.WRITE "sleep 50"
PAUSE 500
BT.WRITE "ifl 7 800"
PAUSE 500
BT.WRITE "put 18 100"
PAUSE 500
BT.WRITE "sleep 2000"
PAUSE 500
BT.WRITE "put 18 0"
PAUSE 500
BT.WRITE "sleep 200"
PAUSE 500
BT.WRITE "endif"
PAUSE 500
BT.WRTIE "do"
PAUSE 500
BT.WRITE "put 14 0"
PRINT "NOW LAGERING"
RETURN

onConsoleTouch:
xdoMenu=1
ConsoleTouch.Resume

onError:
END
