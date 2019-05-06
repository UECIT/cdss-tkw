@echo off
rem Polls MAILBOX/out for *.dat files
rem for each file found
rem 	Adds soap wrapper with action of service found in DE - writing the output to MESH_responder/_system/transmitter_source
rem 	Transmits the wrapped dat via TKW
rem 	


:OUTFILE
IF NOT EXIST %cd%\MAILBOX\out\*.dat GOTO OUTPOLL
echo Outgoing file found...

for %%f in (%cd%\MAILBOX\out\*.dat) do (


	echo Preparing %%f
	java -jar TKW_ROOT\lib\saxon9he.jar -warnings:silent -s:%cd%/MAILBOX/out/%%~nf.dat -xsl:%cd%/_system/lib/addsoap.xslt -o:%cd%/_system/transmitter_source/%%~nf.dat

	echo Transmitting %%f
	java -jar TKW_ROOT\TKW.jar -transmit _system\tkw.properties

	
	copy %cd%\MAILBOX\out\%%~nf.* %cd%\MAILBOX\sent >NUL
	copy %cd%\MAILBOX\out\%%~nf.* %cd%\MAILBOX\archive >NUL
	del %cd%\MAILBOX\out\%%~nf.* >NUL
	del %cd%\_system\transmitter_source\%%~nf.dat >NUL
	
)



for %%f in (%cd%\_system\simulator_saved_messages\*.log) do (


	echo parsing response %%f
	java -jar %cd%\_system\lib\AutoTestExtract.jar %%~pf 2 %cd%\_system\simulator_saved_messages\
	echo writing dat %%f
	java -jar TKW_ROOT\lib\saxon9he.jar -warnings:silent -s:%%f_msg2.xml -xsl:%cd%/_system/lib/stripsoap.xslt -o:%cd%/MAILBOX/in/response_%%~nf.dat
	
	copy %cd%\_system\lib\template.ctl %cd%\MAILBOX\in\response_%%~nf.ctl >NUL

	copy %cd%\MAILBOX\in\response_%%~nf.* %cd%\MAILBOX\archive >NUL
	
)

rem GOTO INPOLL



:INFILE
rem IF NOT EXIST %cd%\MAILBOX\in\*.* GOTO INPOLL
rem echo INFILE file found...
rem GOTO OUTPOLL





:OUTPOLL
echo Polling %cd%\MAILBOX\out for outgoing messages
echo No file found
echo Waiting for poll interval...
PING 127.0.0.1 -n 10 -w 100 >NUL
GOTO OUTFILE

:INPOLL
echo Polling %cd%\MAILBOX\in for incoming responses
echo No file found
echo Waiting for poll interval...
PING 127.0.0.1 -n 10 -w 100 >NUL
GOTO INFILE