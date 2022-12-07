@echo off
set project=%1
echo Copying documentation to %project%/...
if not exist "%project%\datafiles" mkdir "%project%\datafiles"
copy /Y export\gameframe.html %project%\datafiles\gameframe.html