# dep: `Install-Module VirtualDesktop`
  # info: https://github.com/MScholtes/PSVirtualDesktop
# dep: `scoop install vdesk`
  # info: https://github.com/eksime/VDesk

$appsDir = "$env:userprofile\scoop\apps"

# note: remove all current desktops to ensure a clean working space
$startingDeskCount = Get-DesktopCount  # note: we save so that it is a static var
for ($i = 1; $i -lt $startingDeskCount; $i++) {
    # note: remove the first one rather than the current index
    # note: bc the desktops are re-indexed when one is removed
    Remove-Desktop -Verbose 0
}

# note: create desktops
vdesk create:5

# note: start launching apps
vdesk noswitch:true on:1 run:"$appsDir\windows-terminal\current\wt.exe"
vdesk noswitch:true on:2 run:chrome /new-window
vdesk noswitch:true on:3 run:"$appsDir\spotify\current\spotify.exe"
vdesk noswitch:true on:4 run:"$appsDir\whatsapp\current\whatsapp.exe"  # note: hm
