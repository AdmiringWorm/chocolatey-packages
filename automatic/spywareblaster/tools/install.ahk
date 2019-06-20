#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, RegEx

; We know the window will pop up, so we'll wait until it does
WinWait, Setup - SpywareBlaster,Welcome to the SpywareBlaster Setup Wizard
ControlClick, &Next >, Setup - SpywareBlaster,Welcome to the SpywareBlaster Setup Wizard

WinWait, Setup - SpywareBlaster,License Agreement
ControlClick, I &accept the agreement, Setup - SpywareBlaster,License Agreement
Sleep, 500
ControlClick, &Next >, Setup - SpywareBlaster,Welcome to the SpywareBlaster Setup Wizard

WinWait, Setup - SpywareBlaster,Select Destination Location
ControlClick, &Next >, Setup - SpywareBlaster,Select Destination Location

WinWait, Setup - SpywareBlaster,Ready to Install
ControlClick, &Install, Setup - SpywareBlaster,Ready to Install

WinWait, Setup - SpywareBlaster,Completing the SpywareBlaster Setup Wizard
WinActivate, Setup - SpywareBlaster, Completing the SpywareBlaster Setup Wizard
ControlSend, TNewCheckListBox1, {Space}, Setup - SpywareBlaster
ControlClick, &Finish
