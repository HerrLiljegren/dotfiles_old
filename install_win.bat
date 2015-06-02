@ECHO OFF
SET WDRIVE=%CD:~0,2%
SET WDIR=%CD%

CD %HOME%
%HOME:~0,2%

IF NOT EXIST "%HOME%\.vim" (
	mklink /D .vim %WDIR%\.vim\
) ELSE (
	ECHO %HOME%\.vim\ EXISTS
)

IF NOT EXIST "%HOME%\.vimrc" (
	mklink .vimrc %WDIR%\_vimrc
) ELSE (
	ECHO %HOME%\.vimrc EXISTS
)

IF NOT EXIST "%HOME%\.vimrc.bundles" (
	mklink .vimrc.bundles %WDIR%\_vimrc.bundles
) ELSE (
	ECHO %HOME%\.vimrc.bundles EXISTS
)

%WDRIVE%
CD %WDIR%
ECHO DONE