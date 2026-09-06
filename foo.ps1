Import-Module /home/sharpchen/projects/PSReadLine/bin/Debug/PSReadLine/PSReadLine.psd1

Set-PSReadLineOption -EditMode Vi
Set-PSReadLineKeyHandler -Key Tab -Function ViGotoBrace -ViMode Command
Set-PSReadLineKeyHandler -Key Ctrl+n -Function AcceptAndGetNext -ViMode Command

Set-PSReadLineOption -ViModeIndicator Script -ViModeChangeHandler {
    if ($args[0] -eq 'Command') {
        # Set the cursor to a blinking block.
        Write-Host -NoNewline "`e[2 q"
    } else {
        # Set the cursor to a blinking line.
        Write-Host -NoNewline "`e[5 q"
    }
}

# Set-PSReadLineOption -MaximumHistoryCount 15000
# Set-PSReadLineOption -HistoryNoDuplicates:$false
