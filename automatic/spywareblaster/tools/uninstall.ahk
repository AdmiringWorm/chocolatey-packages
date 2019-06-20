#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, RegEx

WinWait, SpywareBlaster Uninstall
ControlClick, Button1, SpywareBlaster Uninstall

WinWait, SpywareBlaster Uninstall, SpywareBlaster was successfully removed from your computer.
ControlClick, Button1, SpywareBlaster Uninstall
