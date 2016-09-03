function parseEnvironment {
  param([hashtable] $values)

  If (Test-Path Env:\AU_TIMEOUT) {
    $values.Timeout = [System.Int32]::Parse($env:AU_TIMEOUT);
  }

  If (Test-Path Env:\AU_THREADS) {
    $values.Threads = [System.Int32]::Parse($env:AU_THREADS);
  }

  If (Test-Path Env:\GIST_DIR) {
    $values.GistDir = $env:GIST_DIR;
  }

  If (Test-Path Env:GIST_NAME) {
    $values.GistName = $env:GIST_NAME;
  }
  
  If (Test-Path Env:\GIT_PUSH) {
	$values.GitPush = [System.Boolean]::Parse($env:GIT_PUSH);
  }

  If (-Not (Test-Path Env:\APPVEYOR)) {
    return $values;
  }
  $values.Push = $true;
  
  If (Test-Path Env:APPVEYOR_REPO_BRANCH) {
	$values.GitBranch = $env:APPVEYOR_REPO_BRANCH;
  }

  If (Test-Path Env:\APPVEYOR_REPO_NAME) {
    $values.RepoName = $env:APPVEYOR_REPO_NAME;
  }

  If (Test-Path Env:\APPVEYOR_FORCED_BUILD) {
    $values.Force = [System.Boolean]::Parse($env:APPVEYOR_FORCED_BUILD);
  }

  If (Test-Path Env:\APPVEYOR_PULL_REQUEST_NUMBER) {
    $values.Push = ([System.Int32]::Parse($env:APPVEYOR_PULL_REQUEST_NUMBER) -eq 0);
	  $values.GitPush = ($values.GitPush) -and ($values.Push);
  }

  If (Test-Path Env:\APPVEYOR_BUILD_NUMBER) {
    $values.BuildNumber = $env:APPVEYOR_BUILD_NUMBER;
  }

  If (Test-Path Env:\APPVEYOR_PROJECT_ID) {
    $values.AppveyorProjectId = $env:APPVEYOR_PROJECT_ID
  }
  
  return $values;
}

function printVariables {
    param([hashtable]$values)
    "Printing Variables";

    $values.GetEnumerator() | ? Name -NotMatch "^Script$" | Sort-Object Name | ft -AutoSize -HideTableHeaders
}