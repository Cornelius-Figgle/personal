:: spicetify config 

del /q "C:\users\max.harrison\appdata\roaming\spicetify\config-xpui.ini"
rd /s /q "C:\Users\Max.Harrison\scoop\apps\spicetify-cli\current\Extensions"
rd /s /q "C:\Users\Max.Harrison\scoop\apps\spicetify-cli\current\Themes"
del /q "C:\Users\Max.Harrison\scoop\apps\spicetify-cli\current\css-map.json"

mklink "C:\users\max.harrison\appdata\roaming\spicetify\config-xpui.ini" "C:\users\max.harrison\source\personal\dotfiles\spicetify\config-xpui.ini"
mklink /D "C:\Users\Max.Harrison\scoop\apps\spicetify-cli\current\Extensions" "c:\users\max.harrison\source\personal\dotfiles\spicetify\Extensions"
mklink /D "C:\Users\Max.Harrison\scoop\apps\spicetify-cli\current\Themes" "c:\users\max.harrison\source\personal\dotfiles\spicetify\Themes" 
mklink "C:\Users\Max.Harrison\scoop\apps\spicetify-cli\current\css-map.json" "c:\users\max.harrison\source\personal\dotfiles\spicetify\css-map.json"

:: spicetify apply
	:: OR
:: spicetify backup apply