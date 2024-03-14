@echo off
REM check for sysmon driver. Then load appropriate configuration based on 
REM version of Sysmon that is installed (if any).

if not exist "c:\windows\sysmondrv.sys" (
   goto :END
   REM Sysmon not installed
)

if exist "c:\windows\sysmon64.exe" (
   REM 64-bit sysmon installed
   c:\windows\sysmon64.exe -c %0\..\sysmonconfig-export.xml 
   goto :END
)

if exist "c:\windows\sysmon.exe" (
   REM 32-bit sysmon installed
   c:\windows\sysmon.exe -c %0\..\sysmonconfig-export.xml 
)

:END
echo Exiting sysmon config loading script