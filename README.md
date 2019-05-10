# uakiller
I. Purpose: Management software solution to delete account of standard user, archive home directory of user. To be performed on or after a specific date. To trigger without wifi on a recurring timer.

II. Method: Install script to local admin directory in a specific location, create a plist in LaunchDaemon folder with a 15 minute timer

A. Variables: SCRIPT, LOGFILE, NOW, WHO, ADMIN, CURREN(year/day/month), DUE(year/day/month), SIZE, MAXSIZE

B. Used: Cat <eof>> to write file to location by script
  
III. Script Outline: Set Variables, Logfile, Maxsize of script, Check date is greater than or equal to Due date, Confirm user, Delete Account, Archive data

IV. Takeaways: Further improved error reporting practices, learned how to trigger through LaunchDaemons, scripted creation of specific file, used if/then tree to deduce specific data

V. Questions: Can I create a tool that can be called on remotely for removing the command in launchctl? Can I create a tool that prompts for specific data? Can I combine this tool with efi removal and reboot, licensed software removal, upgrading user group data, or management software removal? Can I unload the Daemon through the script?
