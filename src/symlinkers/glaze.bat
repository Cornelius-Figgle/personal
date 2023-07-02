rmdir c:\users\max.harrison\.glaze-wm
mklink /D c:\users\max.harrison\.glaze-wm c:\users\max.harrison\source\personal\dotfiles\glaze-wm

del "C:\Users\Max.Harrison\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\autostart_wrapper.vbs"
mklink "C:\Users\Max.Harrison\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\autostart_wrapper.vbs" "c:\users\max.harrison\source\personal\dotfiles\glaze-wm\autostart_wrapper.vbs"