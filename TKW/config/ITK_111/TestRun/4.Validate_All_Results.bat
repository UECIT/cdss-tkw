@echo off


del ..\validator_reports\*.* /q
del ..\messages_for_validation\*.* /q
java -jar AutoTestExtract.jar ..\transmitter_sent_messages 1 ..\messages_for_validation
java -jar AutoTestExtract.jar ..\transmitter_sent_messages 2 ..\messages_for_validation
java -jar ..\..\..\TKW.jar -validate ..\tkw.properties
del ..\validator_reports\*.out /q

pause

