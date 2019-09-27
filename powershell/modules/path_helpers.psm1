function Add-EnvUserPath {
    param ($path)
    if (Test-EnvUserPath $path) {
        return
    }
    if (-not $path.EndsWith(";")) {
        $path = $path + ";"
    }
    $currPath = Get-EnvUserPath
    if (-not $currPath.EndsWith(";")) {
        $currPath = $currPath + ";"
    }
    $currPath = $currPath + $path
    Set-EnVUserPath $currPath
}

function Remove-EnvUserPath {
    param ($path)
    if (-not (Test-EnvUserPath $path)) {
        return
    }
    $currPath = Get-EnvUserPath
    $arr = $currPath.Split(';')
    $newPath = ""
    foreach ($i in $arr) {
        if ($i.EndsWith($path)) {
            continue
        }
        if ($i -eq "") {
            continue
        }
        $newPath = $newPath + $i + ";"
    }
    Set-EnVUserPath $newPath
}

function Test-EnvUserPath {
    param ($path)
    $currPath = Get-EnvUserPath
    $arr = $currPath.Split(';')
    foreach ($i in $arr) {
        if ($i.EndsWith($path)) {
            return $true
        }
    }
    return $false
}

function Get-EnvUserPath {
    $path = [System.Environment]::GetEnvironmentVariable("path", [System.EnvironmentVariableTarget]::User)
    if ($path -eq $null) {
        return ""
    }
    return $path
}

function Set-EnVUserPath {
    param ($path)
    if (-not $path.EndsWith(";")) {
        $path = $path + ";"
    }
    [System.Environment]::SetEnvironmentVariable("path", $path, [System.EnvironmentVariableTarget]::User)
}

function Update-EnvPath {
    $env:Path = @([System.Environment]::GetEnvironmentVariable("path", [System.EnvironmentVariableTarget]::Machine),
                  [System.Environment]::GetEnvironmentVariable("path", [System.EnvironmentVariableTarget]::User)) -join ";"
}

Export-ModuleMember -Function *
