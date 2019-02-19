#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, RegEx

; We know the window will pop up, so we'll wait until it does
WinWait, OnionShare Uninstall,,60
ControlGet, OkCtrl, Visible,, Button1, OnionShare Uninstall
if (OkCtrl)
  ControlSend, Button1, {Enter}, OnionShare Uninstall
