#!/bin/bash
sleep 3
dbus-send --type=method_call --print-reply=literal --system --dest=org.freedesktop.UPower /org/freedesktop/UPower/KbdBacklight org.freedesktop.UPower.KbdBacklight.SetBrightness int32:0
