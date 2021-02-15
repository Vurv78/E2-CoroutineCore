@echo off

:: Make sure gmad and gmpublish are in your system path / put GarrysMod\bin in your path.

SET addonid=2233905819

ECHO Building Addon.
gmad create -folder %CD% -out temp.gmad

ECHO Updating Addon https://steamcommunity.com/sharedfiles/filedetails/?id=%addonid%
ECHO "%CD%\temp.gmad"
SET /p changes="Addon changes:"

gmpublish update -addon "%CD%\temp.gmad" -id "%addonid%" -changes %changes%

pause