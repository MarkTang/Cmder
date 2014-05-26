:: Init Script for cmd.exe
:: Sets some nice defaults
:: Created as part of cmder project

:: Used by the rest of the script
@set rootDir="%~dp0\.."

:: Change the prompt style
:: Mmm tasty lamb
@prompt $E[1;32;40m$P$S{git}$S$_$E[1;30;40m{lamb}$S$E[0m

:: Pick right version of clink
@if "%PROCESSOR_ARCHITECTURE%"=="x86" (
    set architecture=86
) else (
    set architecture=64
)

:: Run clink
@%rootDir%\vendor\clink\clink_x%architecture%.exe inject --quiet --profile %rootDir%\config

:: Prepare for msysgit
:: Even I don't know, copy-pasted from their .bat
@set PLINK_PROTOCOL=ssh
@set git_install_root=%rootDir%\vendor\msysgit
@if not defined TERM set TERM=msys

:: Used by "git"
@set PATH=%PATH%;%git_install_root%\bin;%git_install_root%\cmd;

:: Add Binary Utilities
@set PATH=%PATH%;%rootDir%\bin;%rootDir%\vendor\file\bin;%rootDir%\vendor\utils;%rootDir%\vendor\gow\bin;%rootDir%\vendor\node-webkit;%rootDir%\vendor\sox;%rootDir%\vendor\imagemagick;

:: Add 3rd Party Stuff
@set PATH=%PATH%;%rootDir%\vendor\putty;%rootDir%\vendor\vim\vim74;%rootDir%\vendor\teracopy;

:: Add aliases
:: These little thingies are life savers, believe me.
@doskey /macrofile="%rootDir%\config\aliases"

:: Set home path
@set HOME=%USERPROFILE%

:: Feel free to modify/remove
@echo [3;1mWelcome to cmder! customized by [31;mdufferzafar
