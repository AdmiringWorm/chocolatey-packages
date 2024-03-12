$packageName = 'tinymediamanager'
$shortcutName = 'tinyMediaManager.lnk'

Remove-Item "$env:Public\Desktop\$shortcutName" -Force -ErrorAction 'SilentlyContinue'
Remove-Item "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\$shortcutName" -Force -ErrorAction 'SilentlyContinue'
Remove-Item -r "C:\Tools\tinyMediaManager*" -ea 0 -Force
