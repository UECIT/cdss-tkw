@echo off

java -jar ..\..\..\TKW.jar -transmit ..\tkw.properties
java -jar AutoTestTool.jar ../transmitter_sent_messages Results\TestFiles_HTTP200.txt "HTTP/1.1 200"


pause