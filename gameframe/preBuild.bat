@echo off
set dllPath=%~1
set solutionDir=%~2
set projectDir=%~3
set arch=%~4
set config=%~5

echo Running pre-build for %config%

where /q GmlCppExtFuncs
if %ERRORLEVEL% EQU 0 (
	echo Running GmlCppExtFuncs...
	GmlCppExtFuncs ^
	--prefix gameframe^
	--cpp "%projectDir%autogen.cpp"^
	--gml "%solutionDir%gameframe_23/extensions/gameframe_native/autogen.gml"^
	%projectDir%gameframe.cpp
)
:bye