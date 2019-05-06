@echo off

echo Preparing messages...

del _system\tmp\*.* /q >NUL

del _system\config\ITK_Combined_MESH\messages_for_validation\*.* /q >NUL
del _system\config\ITK_Combined_MESH\validator_reports\*.* /q >NUL

copy messages_for_validation\*.ctl _system\tmp >NUL


for %%f in (messages_for_validation\*.dat) do (

echo Validating: %%~nf
echo ^<fn^>%%~nf^</fn^>  > _system\tmp\fn.xml
copy %%f _system\config\ITK_Combined_MESH\messages_for_validation\ > NUL

java -jar TKW_ROOT\TKW.jar -validate _system\config\ITK_Combined_MESH\tkw.properties

del _system\config\ITK_Combined_MESH\messages_for_validation\*.* /q
	)

echo Writing validator reports

copy _system\config\ITK_Combined_MESH\validator_reports\*.* validator_reports >NUL

del _system\config\ITK_Combined_MESH\messages_for_validation\*.* /q >NUL
del _system\config\ITK_Combined_MESH\validator_reports\*.* /q >NUL



pause

