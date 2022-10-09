function Log($Color, $Message, $Text) {
    Write-Host -NoNewline -ForegroundColor $Color "${Message}"
    Write-Host " ${Text}"
}

$Message = "DarkMagenta"
$Info = "DarkGreen"
$Yellow = "DarkYellow"

$Configs = @{
    "App\Git\config" = "~/.gitconfig";
}

Log $Info "Info" "Installing dotfiles"

foreach ($Key in $Configs.Keys) {
    $Value = $Configs[$Key]

    if (-not (Test-Path $Value)) {
        Log $Message "  Install" "${Value} (${Key})"
        New-Item -ItemType HardLink -Target ".\Config\${Key}" -Path $Value
    }
    else {
        Log $Yellow "   Ignore" "${Value} (${Key})"
    }
}