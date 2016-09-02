function startProcess {
    param([string] $executable,
        [string[]]$arguments)

    If ($arguments) {
        #$cont = Start-Process -FilePath $executable -ArgumentList $arguments -NoNewWindow -Wait;
        & $executable $arguments;
    } Else {
        #$cont = Start-Process -FilePath $executable -NoNewWindow -Wait;
        & $executable;
    }
    #$cont;
}



function Force-Resolve-Path {
    param([string] $FilePath)

    $FilePath = Resolve-Path $FilePath -ErrorAction SilentlyContinue -ErrorVariable _frperror;

    If (-not ($FilePath)) {
        $FilePath = $_frperror[0].TargetObject;
    }
    return $FilePath;
}