#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
SetTitleMatchMode, RegEx

edition = %1%
winTitleWelcome = GhostDoc %edition% Setup
winTitleWelcomeText = Click Next to continue
winTitleLicense = GhostDoc %edition% Licence Agreement
winTitleIntegrationText = Visual Studio Intergation
winTitleReady = Ready to Install
winTitleCompleted = Completing the GhostDoc %edition% Setup Wizard

WinWait, %winTitleWelcome%, %winTitleWelcomeText%
ControlSend, Button1, {Enter}, %winTitleWelcome%, %winTitleWelcomeText%

Sleep, 100

WinWait, %winTitleLicense%
Control, Check,, Button2, %winTitleLicense%
ControlSend, Button5, {Enter}, %winTitleLicense%

Sleep, 100
WinWait, %winTitleWelcome%
ControlSend, Button1, {Enter}, %winTitleWelcome%

Sleep, 100
WinWait, %winTitleWelcome%, %winTitleIntegrationText%
ControlSend, Button1, {Enter}, %winTitleWelcome%

Sleep, 100
WinWait, %winTitleWelcome%, %winTitleReady%
ControlSend, Button1, {Enter}, %winTitleWelcome%

Sleep, 1000
WinWait, %winTitleWelcome%, %winTitleCompleted%
ControlSend, Button1, {Enter}, %winTitleWelcome%
