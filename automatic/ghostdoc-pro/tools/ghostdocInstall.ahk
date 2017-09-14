; default environment
DetectHiddenWindows, off
SetControlDelay, 20
SetKeyDelay, 10

; modified environment
#NoEnv
DetectHiddenText, off
SetTitleMatchMode, 1

winTitleWelcome = GhostDoc Pro Setup
winTitleWelcomeText = Welcome to the GhostDoc Pro Setup Wizard
winTitleLicense = GhostDoc Pro Licence Agreement
winTitleIntegrationText = Visual Studio Intergation
winTitleReady = Ready to Install
winTitleCompleted = Completing the GhostDoc Pro Setup Wizard

WinWait, %winTitleWelcome%, %winTitleWelcomeText%
ControlClick, Button1, %winTitleWelcome%

Sleep, 100

WinWait, %winTitleLicense%
ControlClick, Button2, %winTitleLicense%
ControlClick, Button5, %winTitleLicense%

Sleep, 100
WinWait, %winTitleWelcome%
ControlClick, Button1, %winTitleWelcome%

Sleep, 100
WinWait, %winTitleWelcome%, %winTitleIntegrationText%
ControlClick, Button1, %winTitleWelcome%

Sleep, 100
WinWait, %winTitleWelcome%, %winTitleReady%
ControlClick, Button1, %winTitleWelcome%

Sleep, 1000
WinWait, %winTitleWelcome%, %winTitleCompleted%
ControlClick, Button1, %winTitleWelcome%
