#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, RegEx

; We know the window will pop up, so we'll wait until it does
WinWait, DUMo.*,,60
WinWait, Checking...,,60
ControlClick, Stop, Checking...
ControlGet, StopCtrl, Visible,, Stop, Checking...
if (CloseCtrl)
  ControlSend, Stop, {Enter}, Checking...

WinWaitClose, Checking...,,60
WinClose, DUMo.*

WinWait, Thank you !,, 60

ControlFocus, TJvImgBtn4, Thank you !
ControlClick, TJvImgBtn4, Thank you !
ControlGet, CloseCtrl, Visible,, TJvImgBtn4, Thank you !
if (CloseCtrl)
  ControlSend, TJvImgBtn4, {Enter}, Thank you !

WinWaitClose, DUMo.*,,60
