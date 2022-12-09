@echo off
set /p ver="Version?: "
echo Uploading %ver%...
set user=yellowafterlife
set ext=gamemaker-gameframe
cmd /C itchio-butler push "gameframe_demo.yyz" %user%/%ext%:demo-source --userversion=%ver%
::cmd /C itchio-butler push "gameframe_demo.zip" %user%/%ext%:demo --userversion=%ver%
::cmd /C itchio-butler push "gameframe (for GMS2.3+).yymps" %user%/%ext%:gms2.3 --userversion=%ver%

pause