@echo off
set dllPath=%~1
set solutionDir=%~2
set projectDir=%~3
set arch=%~4
set config=%~5

echo Running post-build for %config%

set extName=gameframe_native
set extNameM=gameframe_macros
set dllName=gameframe
set gmlDir14=%solutionDir%gameframe.gmx
set gmlDir22=%solutionDir%gameframe_22
set gmlDir23=%solutionDir%gameframe_23
set ext14=%gmlDir14%\extensions\%dllName%
set ext22=%gmlDir22%\extensions\%extName%
set ext23=%gmlDir23%\extensions\%extName%
set dllRel=%dllName%.dll
set cppRel=%dllName%.cpp
set cppPath=%ext23%\%cppRel%
set gmlPath=%ext23%\*.gml
set gmlPathM=%ext22m%\*.gml
set docName=%dllName%.html
set docPath=%solutionDir%export\%docName%

echo Copying documentation...
copy /Y %docPath% %gmlDir23%\datafiles\%docName%
copy /Y %docPath% %gmlDir14%\datafiles\%docName%

where /q gmxgen

if %ERRORLEVEL% EQU 0 (
	echo Combining the source files...
	type "%projectDir%*.h" "%projectDir%*.cpp" >"%cppPath%" 2>nul
	
	echo Running GmxGen...
	
	cmd /C gmxgen "%ext23%\%extName%.yy" ^
	--copy "%dllPath%" "%dllRel%:%arch%"

	cmd /C gmxgen "%ext14%.extension.gmx" ^
	--copy "%dllPath%" "%dllRel%:%arch%" ^
	--copy "%cppPath%" "%cppRel%" ^
	--copy "%gmlPath%" "*.gml"

) else (

	echo Copying DLLs...
	if "%arch%" EQU "x64" (
		copy /Y "%dllPath%" "%ext23%\%dllName%_x64.dll"
	) else (
		::copy /Y "%dllPath%" "%ext22%\%dllRel%"
		copy /Y "%dllPath%" "%ext23%\%dllRel%"
		copy /Y "%dllPath%" "%ext14%\%dllRel%"
	)
	
	echo Copying GML files...
	robocopy %ext23% %ext14% *.gml /L >nul

	echo postBuild.bat: Warning N/A: Could not find GmxGen - extensions will not be updated automatically. See https://github.com/YAL-GameMaker-Tools/GmxGen for setup.
)

goto cleanup
:: TODO: when there are 2.2/1.4 versions:
cmd /C gmxgen "%ext22%\%extName%.yy" ^
--copy "%dllPath%" "%dllRel%:%arch%" ^
--copy "%cppPath%" "%cppRel%" ^
--copy "%gmlPath%" "*.gml"
	
cmd /C gmxgen "%ext14%.extension.gmx" ^
--copy "%dllPath%" "%dllRel%:%arch%" ^
--copy "%cppPath%" "%cppRel%" ^
--copy "%gmlPath%" "*.gml"

:: pre-2.3 macros
cmd /C gmxgen "%ext22m%\%extNameM%.yy"
	
cmd /C gmxgen "%ext14m%.extension.gmx" ^
--copy "%gmlPathM%" "*.gml"

:cleanup
echo Cleaning up...
del /Q "%cppPath%"
