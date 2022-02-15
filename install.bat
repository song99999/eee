@echo off
SET current_path=%~dp0
SET system="windows"

reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set arch=i386||set arch=amd64

echo path: %current_path%
echo system: %current_path%
echo arch: %arch%
echo start tophant-pvp-agent

if "%arch%" == "i386" (

    mshta javascript:alert^("\u76ee\u524d\u6682\u4e0d\u652f\u630132\u4f4d\u7cfb\u7edf"^);close^(^);

) else (
    copy %current_path%\pvp-agent.%arch%.exe %current_path%\pvp-agent.exe
    del /a /f /s %current_path%\pvp-agent.amd64.exe
    del /a /f /s %current_path%\pvp-agent.i386.exe

    reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v TOPHANT_AGENT /t REG_SZ /d %current_path%\pvp-agent.exe /f

    start %current_path%\pvp-agent.exe /b
)