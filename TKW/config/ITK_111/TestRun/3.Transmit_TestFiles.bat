@echo off

for %%f in (TestFiles\*.xml) do (
	
	copy %%f ..\transmitter_source
	java -jar ..\..\..\TKW.jar -transmit ..\tkw.properties
	del ..\transmitter_source\*.*	/q

	
	)
	
java -jar AutoTestTool.jar ../transmitter_sent_messages Results\TestFiles_HTTP200.txt "HTTP/1.1 200"


pause