#!/bin/bash

expect<<END
	spawn dscl . -passwd /Users/$WHO
	expect "New Password:"
	send <New Password Here>\r
	expect eof
END
