$DesktopPath = [Environment]::GetFolderPath("Desktop")
$ShortcutPath = Join-Path $DesktopPath "End Task All.lnk"

$WshShell = New-Object -ComObject WScript.Shell
$Shortcut = $WshShell.CreateShortcut($ShortcutPath)
$Shortcut.TargetPath = "$env:windir\system32\taskkill.exe"
$UserName = $env:USERNAME
$Shortcut.Arguments = "/F /FI `"USERNAME eq $UserName`" /FI `"IMAGENAME ne explorer.exe`" /FI `"IMAGENAME ne dwm.exe`""
$Shortcut.WorkingDirectory = "$env:windir\system32"
$Shortcut.Description = "Force closes all open programs (except Explorer/DWM)"
$Shortcut.Hotkey = "CTRL+ALT+A"
$Shortcut.IconLocation = "$env:windir\system32\taskkill.exe,0"
$Shortcut.Save()

# Set the "Run as administrator" flag inside the .lnk file
$bytes = [System.IO.File]::ReadAllBytes($ShortcutPath)
$bytes[0x15] = $bytes[0x15] -bor 0x20
[System.IO.File]::WriteAllBytes($ShortcutPath, $bytes)

Write-Host ""
Write-Host "Shortcut created successfully at:"
Write-Host $ShortcutPath
