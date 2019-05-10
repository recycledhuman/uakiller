#!/bin/bash

cat << EOF > /Library/LaunchDaemons/com.oxit.uakiller.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
	<key>EnvironmentVariables</key>
	<dict>
		<key>PATH</key>
		<string>/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin</string>
	</dict>
	<key>KeepAlive</key>
	<dict>
		<key>Crashed</key>
		<true/>
	</dict>
	<key>Label</key>
	<string>com.oxit.uakiller</string>
	<key>Program</key>
	<string>/Users/<local admin account location for script>/uakiller.sh</string>
	<key>StandardErrorPath</key>
	<string>/tmp/com.oxit.uakiller.stderr</string>
	<key>StandardOutPath</key>
	<string>/tmp/com.oxit.uakiller.stdout</string>
	<key>StartInterval</key>
	<integer>900</integer>
</dict>
</plist>
EOF

#Set Permissions
chmod 644 /Library/LaunchDaemons/com.oxit.uakiller.plist
chown root:wheel /Library/LaunchDaemons/com.oxit.uakiller.plist
chmod -R 755 /Users/<local admin location here>/uakiller.sh

/bin/launchctl load /Library/LaunchDaemons/com.oxit.uakiller.plist
