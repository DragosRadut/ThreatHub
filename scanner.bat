@echo off
setlocal enabledelayedexpansion

:: Get file path
set "filePath=%~1"

:: Generate hash
certutil -hashfile "!filePath!" MD5 > "%TEMP%\hash_temp.txt"

:: Parse certutil output -> only store the hash for API call
set "colonCount=0"
set "hashOutput="
for /f "usebackq delims=" %%i in ("%TEMP%\hash_temp.txt") do (
    set "line=%%i"
    set /a "colonCount+=1"
    if !colonCount! geq 2 (
        set "hashOutput=!line:*:=!"
        echo !hashOutput!
    )
)

del "%TEMP%\hash_temp.txt"

:: Query VirusTotal to display the output in CMD
curl -X GET -H "x-apikey: <apikey>" --url https://www.virustotal.com/api/v3/files/!hashOutput!

:: Save report option
choice /m "Do you wish to save the report? "
if errorlevel 1 (
    set /p "outputFile=Please enter a name for the report: "
    curl -s -X GET -H "x-apikey: <apikey>" --url https://www.virustotal.com/api/v3/files/!hashOutput! > "!outputFile!-THb.txt"
    echo Report saved as "!outputFile!-THb.txt"
)

pause
exit /b
