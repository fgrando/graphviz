@echo off

REM convert m4 to DOT
for /r %%i in (*.m4) do (
	echo Generating DOT file %%i
	m4 "%%i" > "%%i.gv"
)

REM convert DOT to PNG images
for /r %%i in (*.gv) do (
	echo converting %%i
	Graphviz\bin\dot "%%i" -Tpng -o "%%i.png"
)