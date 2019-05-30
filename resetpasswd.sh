#!/usr/bin/expect

spawn dscl . -passwd /Users/$WHO
expect New Password:
send <New password here>\r
interact
