#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

;following section remaps alt-arrow and command-arrow
;keys to mimic OSX behaviour
!Up::Send {Lctrl down}{Home}{Lctrl up}
!Down::Send {Lctrl down}{End}{Lctrl up}
!Left::Send {Home}
!Right::Send {End}
!+Left::Send {LShift down}{Home}{LShift up}
!+Right::Send {LShift down}{End}{LShift up}
!+Up::Send {LShift down}{Lctrl down}{Home}{Lctrl up}{LShift up}
!+Down::Send {LShift down}{Lctrl down}{End}{Lctrl up}{LShift up}
;!Up::Send {Home}
;!Down::Send {End}
;!Left::^Left
;!Right::^Right


; mac style tab switching
!+]::Send {Lctrl down}{Tab}{Lctrl up}
!+[::Send {Lctrl down}{Lshift down}{Tab}{Lshift up}{Lctrl up}




!`::    ; Next window
WinGetClass, ActiveClass, A
WinSet, Bottom,, A
WinActivate, ahk_class %ActiveClass%
return

!+`::    ; Last window
WinGetClass, ActiveClass, A
WinActivateBottom, ahk_class %ActiveClass%
return
