TestRun contents folder contains batch files to simplify your testing. For use:


Copy the folder into whichever config folder you want to run your files through e.g Create C:\TKW\config\ITK_Correspondence\TestRun


Copy the messages you wish to transmit into the TestRun\TestFiles subfolder


Run the following batch files in order:

1.Clear_Folders.bat

	Clears the runtime folders ready for a test run


2.Simulator_Start.bat

	Starts the simulator using the config specific properties file


3.Transmit_TestFiles.bat

	Transmits the contents of TestFiles folder file by file using the config specific properties file


4.Validate_All_Results.bat

	Validates the sent and received files, creating reports in the config\validator_reports folder (The HTTP200 report is created in TestRun\Results folder)


Transmit_Only.bat

	Transmits single file from transmitter_source subfolder of config

Validate_Only.bat

	Validates any files in messages_for_validation subfolder of config
