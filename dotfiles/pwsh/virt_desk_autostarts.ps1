# dep: `Install-Module VirtualDesktop`
# info: https://github.com/MScholtes/PSVirtualDesktop


# section: functions ---------------------------------------------------------

# note: stolen from the module example
# info: https://github.com/MScholtes/TechNet-Gallery/blob/master/VirtualDesktop/Example.ps1
# note: function by ComFreek (https://github.com/ComFreek)
function Request-NamedDesktop {
	<#
		.SYNOPSIS
			Retrieves or creates (if non-existing) the virtual desktop with the given name.
		.INPUTS
			The desktop name can be piped into this function.
		.OUTPUTS
			A virtual desktop with the given name.
		.EXAMPLE
			Request-NamedDesktop "My Secret Desktop"
		.EXAMPLE
			"My Secret Desktop" | Request-NamedDesktop | Switch-Desktop
		.NOTES
			The function assumes that the PSVirtualDesktop module [0] is installed.
			[0]: https://github.com/MScholtes/PSVirtualDesktop
	#>
	param(
		<#
			The name of the virtual desktop to retrieve or create (if non-existing)
		#>
		[Parameter(Mandatory=$true, ValueFromPipeline=$true)]
		[ValidateNotNullOrEmpty()]
		[string]$name
	)

	$desktop = Get-DesktopList | Where-Object Name -eq $name | Select-Object -First 1

	# The if condition below is susceptible to a TOCTOU bug (https://en.wikipedia.org/wiki/Time-of-check_to_time-of-use).
	# But this is probably okay since virtual desktops aren't something that is created every second.
	if ($desktop) {
		Get-Desktop -Index $desktop.Number
	} else {
		$desktop = New-Desktop
		$desktop | Set-DesktopName -Name $name
		$desktop
	}
}

# section: main --------------------------------------------------------------

function quandale-butterson {
	Write-Output "Hello World!"

	# note: remove all current desktops to ensure a clean working space
	$startingDeskCount = Get-DesktopCount  # note: we save so that it is a static var
	for ($i = 1; $i -lt $startingDeskCount; $i++) {
		# note: remove the first one rather than the current index
		# note: bc the desktops are re-indexed when one is removed
		Remove-Desktop -Verbose 0
	}

	$oldDesktop = Get-CurrentDesktop

	@'# note: names of virtual desktops to create
	# note: and apps to launch on creation
	$definedDesks = @{
		"main"=@("wt.exe");
		"browser"=@("C:\Program Files\Google\Chrome\Application\chrome.exe");
		"music"=@("spotify.exe");
		"msging"=@("explorer.exe"); #, "phone link");
		"rd"=@("explorer.exe");
		"management"=@("wt.exe");
	}
	foreach($item in $definedDesks.GetEnumerator()) {
		Request-NamedDesktop $item.Key | Switch-Desktop
		Start-Process $((Get-Command $item.Value).Path)
	}

	# note: and remove the first one
	Remove-Desktop -Verbose $oldDesktop

	# note: go back to the start
	Switch-Desktop 0
	'@
}

if (! $Args[0] ) {
	( . $(HOSTNAME.EXE) )  # note: `$env:HOSTNAME` trims the output fsr
} else {
	( . $Args[1] )  # note: allows us to pass a hostname through the cli args
}