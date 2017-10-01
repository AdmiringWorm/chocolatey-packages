; default environment
DetectHiddenWindows, off
SetControlDelay, 20
SetKeyDelay, 10

; modified environment
#NoEnv
DetectHiddenText, off
SetTitleMatchMode, 1

winTitleWelcome = GhostDoc Enterprise Setup
winTitleWelcomeText = Click Next to continue
winTitleLicense = GhostDoc Enterprise Licence Agreement
winTitleIntegrationText = Visual Studio Intergation
winTitleReady = Ready to Install
winTitleCompleted = Completing the GhostDoc Enterprise Setup Wizard

WinWait, %winTitleWelcome%, %winTitleWelcomeText%
ControlClick, Button1, %winTitleWelcome%, %winTitleWelcomeText%

Sleep, 100

WinWait, %winTitleLicense%
Control, Check,, Button2, %winTitleLicense%
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
