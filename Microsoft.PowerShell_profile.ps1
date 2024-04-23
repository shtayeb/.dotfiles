Import-Module posh-git
oh-my-posh init pwsh --config "$env:POSH_THEMES_PATH\json.omp.json" | Invoke-Expression
# Set Some Option for PSReadLine to show the history of our typed commands
Set-PSReadLineOption -PredictionSource History
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -EditMode Windows

#### 
# winget install fzf
# winget install tldr
# winget install sharkdp.bat
# winget install eza-community.eza
####

#Fzf (Import the fuzzy finder and set a shortcut key to begin searching)
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Utility Command that tells you where the absolute path of commandlets are 
function which ($command) { 
    Get-Command -Name $command -ErrorAction SilentlyContinue | 
    Select-Object -ExpandProperty Path -ErrorAction SilentlyContinue 
} 

################################
# Set some useful Alias to shorten typing and save some key stroke
Set-Alias ll eza-ls 
Set-Alias ls eza-ls 
Set-Alias g git 
Set-Alias grep findstr

Set-Alias cat bat

function serve{
php artisan serve
}

function dev{
npm run dev
}

function vim{
nvim .
}

Function nr { npm run $args }
Function a { php artisan $args }

Function eza-ls { eza --color=always --long --git --icons=always $args }

# Git aliases
Function gs { git status $args }
Function gb { git branch $args }
Function gch { git checkout $args }
Function glg { git log --oneline --decorate --color $args }
Function gct { git add . && git commit  $args }
Function ga { git add . && git commit --amend --no-edit }
Function gd { git diff $args }
Function gpp { git stash pop $args }
Function gpl { git pull $args }
Function gps { git push $args }
Function gsh { git stash $args }

function Select-GitBranch {
    $branches = git branch | ForEach-Object { $_ -replace '^\*?\s*', '' }
    $selectedBranch = $branches | Invoke-Fzf -Multi -Header "Select Git Branch"
    if ($selectedBranch) {
        git checkout $selectedBranch
    }
}

# leverage PSFzf
Function fgs {Invoke-FuzzyGitStatus | % { git add $_ }}
Function fgc {Select-GitBranch}
# list and execute psake tasks for a specific project from any directory

################################

# Auto brackets
Set-PSReadLineKeyHandler -Chord '"',"'" `
                         -BriefDescription SmartInsertQuote `
                         -LongDescription "Insert paired quotes if not already on a quote" `
                         -ScriptBlock {
    param($key, $arg)

    $line = $null
    $cursor = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)

    if ($line.Length -gt $cursor -and $line[$cursor] -eq $key.KeyChar) {
        # Just move the cursor
        [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor + 1)
    }
    else {
        # Insert matching quotes, move cursor to be in between the quotes
        [Microsoft.PowerShell.PSConsoleReadLine]::Insert("$($key.KeyChar)" * 2)
        [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$line, [ref]$cursor)
        [Microsoft.PowerShell.PSConsoleReadLine]::SetCursorPosition($cursor - 1)
    }
}


# This key handler shows the entire or filtered history using Out-GridView. The
# typed text is used as the substring pattern for filtering. A selected command
# is inserted to the command line without invoking. Multiple command selection
# is supported, e.g. selected by Ctrl + Click.
# As another example, the module 'F7History' does something similar but uses the
# console GUI instead of Out-GridView. Details about this module can be found at
# PowerShell Gallery: https://www.powershellgallery.com/packages/F7History.
Set-PSReadLineKeyHandler -Key F7 `
                         -BriefDescription History `
                         -LongDescription 'Show command history' `
                         -ScriptBlock {
    $pattern = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$pattern, [ref]$null)
    if ($pattern)
    {
        $pattern = [regex]::Escape($pattern)
    }

    $history = [System.Collections.ArrayList]@(
        $last = ''
        $lines = ''
        foreach ($line in [System.IO.File]::ReadLines((Get-PSReadLineOption).HistorySavePath))
        {
            if ($line.EndsWith('`'))
            {
                $line = $line.Substring(0, $line.Length - 1)
                $lines = if ($lines)
                {
                    "$lines`n$line"
                }
                else
                {
                    $line
                }
                continue
            }

            if ($lines)
            {
                $line = "$lines`n$line"
                $lines = ''
            }

            if (($line -cne $last) -and (!$pattern -or ($line -match $pattern)))
            {
                $last = $line
                $line
            }
        }
    )
    $history.Reverse()

    $command = $history | Out-GridView -Title History -PassThru
    if ($command)
    {
        [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
        [Microsoft.PowerShell.PSConsoleReadLine]::Insert(($command -join "`n"))
    }
}

# All History with fzf
# press f8
Set-PSReadLineKeyHandler -Key F8 `
                         -BriefDescription History `
                         -LongDescription 'Show command history' `
                         -ScriptBlock {
    $pattern = $null
    [Microsoft.PowerShell.PSConsoleReadLine]::GetBufferState([ref]$pattern, [ref]$null)
    if ($pattern)
    {
        $pattern = [regex]::Escape($pattern)
    }

    $history = [System.Collections.ArrayList]@(
        $last = ''
        $lines = ''
        foreach ($line in [System.IO.File]::ReadLines((Get-PSReadLineOption).HistorySavePath))
        {
            if ($line.EndsWith('`'))
            {
                $line = $line.Substring(0, $line.Length - 1)
                $lines = if ($lines)
                {
                    "$lines`n$line"
                }
                else
                {
                    $line
                }
                continue
            }

            if ($lines)
            {
                $line = "$lines`n$line"
                $lines = ''
            }

            if (($line -cne $last) -and (!$pattern -or ($line -match $pattern)))
            {
                $last = $line
                $line
            }
        }
    )
    $history.Reverse()

    $selectedCommand = $history | Invoke-Fzf -Multi -Header "History"
    if ($selectedCommand)
    {
        [Microsoft.PowerShell.PSConsoleReadLine]::RevertLine()
        [Microsoft.PowerShell.PSConsoleReadLine]::Insert(($selectedCommand -join "`n"))
    }
}


# Powershell eqv of 'scripts/cht.sh' script
function Search-Cheatsheet {
    $languages = "golang", "typescript", "php", "javascript", "laravel", "django", "react", "vuejs","tmpl","python","sql","postgresql","sqlite"
    $core_utile = "find", "xargs", "sed", "awk"

    $selected = ($languages + $core_utile) | fzf

    $query = Read-Host "Your Query"

    if ($selected -in $languages) {
        $url = "http://cht.sh/$selected/$($query -replace ' ', '+')"
    } else {
        $url = "http://cht.sh/$selected-$query"
    }

    # Start-Process -NoNewWindow -Wait -FilePath "curl" -ArgumentList $url
    curl $url --silent | bat
}

Function cht { Search-Cheatsheet }