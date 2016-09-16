function Save-Gist {
    function Expand-PoshString() {
        [CmdletBinding()]
        param ( [parameter(ValueFromPipeline = $true)] [string] $str)
        "@`"`n$str`n`"@" | iex
    }

    function max_version($p) {
        try {
            $n = [version]$p.NuspecVersion
            $r = [version]$p.RemoteVersion
            if ($n -gt $r) { "$n" } else { "$r" }
        } catch {}
    }

    function diff_version($p) {
        try {
            $n = [version]$p.NuspecVersion
            $r = [version]$p.RemoteVersion
            return ($n -ne $r)
        } catch { return $false }
    }

    function md_title($Title, $Level=2 ) {
        ""
        "#"*$Level + $Title
    }

    function md_code($Text) {
        "`n" + '```'
        ($Text -join "`n").Trim()
        '```' + "`n"
    }

    function md_table($result, $Columns, $MaxErrorLength=150)
    {
        if (!$Columns) { $Columns = 'PackageName', 'Updated', 'Pushed', 'RemoteVersion', 'NuspecVersion', 'Error' }
        $res = '|' + ($Columns -join '|') + "|`r`n"
        $res += ((1..$Columns.Length | % { '|---' }) -join '') + "|`r`n"

        $result | % {
            $o = $_ | select `
                    @{ N='PackageName'
                       E={'[{0}](https://chocolatey.org/packages/{0}/{1})' -f $_.PackageName, (max_version $_) }
                    },
                    @{ N='Updated'
                       E={
                            $r  = "[{0}](#{1})" -f $_.Updated, $_.PackageName.ToLower()
                            $r += if (diff_version $_) { ' &#x1F538;' }
                            $r
                        }
                    },
                    'Pushed', 'RemoteVersion', 'NuspecVersion',
                    @{ N='Error'
                       E={
                            $err = ("$($_.Error)" -replace "`r?`n", '; ').Trim()
                            if ($err) {
                                if ($err.Length -gt $MaxErrorLength) { $err = $err.Substring(0,$MaxErrorLength) + ' ...' }
                                "[{0}](#{1})" -f $err, $_.PackageName.ToLower()
                         }
                       }
                    }

            $res += ((1..$Columns.Length | % { $col = $Columns[$_-1]; '|' + $o.$col }) -join '') + "|`r`n"
        }

        $res
    }

    "Saving results to gist"
    #if (!(gcm gist.bat -ea 0)) { "ERROR: No gist.bat found. Install it using:  'gem install gist'"; return }

    $log = gc $PSScriptRoot\..\gist.md.ps1 -Raw | Expand-PoshString
    $log | Out-File gist.md -Encoding ascii

    #$params = @( "--filename 'Update-AUPackages.md'")
    #$params += if ($Info.Options.Gist_ID) { "--update " + $Info.Options.Gist_ID } else { '--anonymous' }

    #iex -Command "`$log | gist.bat $params"
    #if ($LastExitCode) { "ERROR: Gist update failed with exit code: '$LastExitCode'" }
	
	if ((Test-Path Env:\github_token)) {
		#$headers = New-Object "System.Collections.Generic.Dictionary[[string], [string]]";
		#$headers.Add("Content-Type", "application/json");
		#$headers.Add("Authorization", "token $env:github_token");
		#$headers[0]
		#$headers[1]
		
		$headers = @{
			"Content-Type" = "application/json"
			"Authorization" = "token $env:github_token"
		}
		
		#$headers.Keys | % { "key = $_ , value = " + $headers.Item($_) }
		
		$newGist = @{
			files = @{
				"_Update-AUPackages.md" = @{
					content = (Get-Content "gist.md" -Raw) -replace "`r`n","`n"
				}
			}
		}
		
		$json = $newGist | ConvertTo-Json
		
		$url = "https://api.github.com/gists/" + $Info.Options.Gist_ID;
		
		#Invoke-RestMethod -UseBasicParsing -Uri ("https://api.github.com/gists/" + $Info.Options.Gist_ID) -Body $json -Method Patch -Headers $headers
		Invoke-RestMethod -UseBasicParsing -Uri $url -Body $json -Method Patch -Headers $headers;
        return
	}
}

