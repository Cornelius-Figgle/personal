$githubLatestReleases = "https://github.com/cornelius-figgle/ROSA/releases/latest"   
$githubLatestReleasesJson = ((Invoke-WebRequest $gitHubLatestReleases) | ConvertFrom-Json).assets.browser_download_url  
$Uri = (((Invoke-WebRequest $githubLatestReleasesJson | ConvertFrom-Json).downloadUrl) | Select-String "vsts-agent-win-x64").ToString()  