
echo start to uninstall

taskkill /f /im pvp-agent.amd64.exe
taskkill /f /im pvp-agent.i386.exe
taskkill /f /im pvp-agent.exe

reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /v TOPHANT_AGENT /f

del /a /f /s %current_path%\pvp-agent.amd64.exe
del /a /f /s %current_path%\pvp-agent.i386.exe
del /a /f /s %current_path%\pvp-agent.exe
del /a /f /s %current_path%\agent_cfg.toml
del /a /f /s %current_path%\install.bat
del /a /f /s %current_path%\uninstall.bat

echo uninstall complete
