SetCapsLockState Off

WaitingForCtrlInput := false
SentCtrlDownWithKey := false

; Use CapsLock key as Ctrl in combination with oder keys
*CapsLock::
	key := 
	WaitingForCtrlInput := true
	Input, key, B C L1 T1, {Esc}
	WaitingForCtrlInput := false
	if (ErrorLevel = "Max") {
		SentCtrlDownWithKey := true
		Send {Ctrl Down}%key%
	}
	KeyWait, CapsLock
	Return

; Use CapsLock as Esc if pressed alone
*CapsLock up::
	If (SentCtrlDownWithKey) {
		Send {Ctrl Up}
		SentCtrlDownWithKey := false
	} else {
		if (A_TimeSincePriorHotkey < 1000) {
			if (WaitingForCtrlInput) {
				Send, {Esc 2}
			} else {
				Send, {Esc}
			}
		}
	}
	Return

; Rebind the Esc key to CapsLock
*Esc::CapsLock

; rebind Ctrl+Shift+CapsLock to Ctrl+Shift+Esc for task manager
^+CapsLock::Send ^+{Esc}
