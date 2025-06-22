# ----------------------
# Help Function
# ----------------------

function help {
    param (
        [int]$group
    )

    Write-Host "`n=== PowerShell Functions Help ===" -ForegroundColor Cyan

    if (-not $group -or $group -eq 0) {
        Write-Host "`nDisplaying all available functions and built-in commands:`n" -ForegroundColor Yellow
        $group = 0
    } else {
        Write-Host "`nDisplaying functions for group $group`n" -ForegroundColor Yellow
    }

    switch ($group) {
        {$_ -eq 0 -or $_ -eq 1} {
            Write-Host "1. Directory Navigation Functions" -ForegroundColor Green
            Write-Host "--------------------------------" -ForegroundColor Green
            Write-Host "goDesktop          : Navigates to the user's Desktop directory."
            Write-Host "goDownload        : Navigates to the Downloads directory, with a fallback to D:\Downloads."
            Write-Host "goCollege         : Navigates to D:\Desktop\Files\College."
            Write-Host "goPractice        : Navigates to D:\Desktop\Files\Projects\Practice files."
            Write-Host "goProjects        : Navigates to D:\Desktop\Files\Projects."
            Write-Host "cdl [path]        : Changes to a directory with autocompletion; lists contents."
            Write-Host "goto <label>      : Navigates to a bookmarked path (working, college, down)."
            Write-Host ""
        }
        {$_ -eq 0 -or $_ -eq 2} {
            Write-Host "2. Visual Studio Code Launch Functions" -ForegroundColor Green
            Write-Host "-------------------------------------" -ForegroundColor Green
            Write-Host "codeweb           : Opens VS Code in the current directory with 'Web Dev' profile."
            Write-Host "codepy            : Opens VS Code in the current directory with 'Python Dev' profile."
            Write-Host "codecpp           : Opens VS Code in the current directory with 'CPP Dev' profile."
            Write-Host "codejava          : Opens VS Code in the current directory with 'Java Dev' profile."
            Write-Host ""
        }
        {$_ -eq 0 -or $_ -eq 3} {
            Write-Host "3. AI and Web Search Functions" -ForegroundColor Green
            Write-Host "--------------------------------" -ForegroundColor Green
            Write-Host "ai <query>        : Queries the Hugging Face Mistral AI model for a concise answer."
            Write-Host "webSearch <query> : Performs a DuckDuckGo search; returns the first relevant result or opens a browser."
            Write-Host "ask <query>       : Tries AI query first, falls back to web search if AI fails."
            Write-Host ""
        }
        {$_ -eq 0 -or $_ -eq 4} {
            Write-Host "4. Git Utility Functions" -ForegroundColor Green
            Write-Host "--------------------------------" -ForegroundColor Green
            Write-Host "gs                : Shows the Git working directory status (git status)."
            Write-Host "gc [msg]          : Commits staged changes with an optional message (default: 'update')."
            Write-Host "gf                : Fetches updates from remote without merging (git fetch)."
            Write-Host "gpl               : Pulls updates from the current branch's remote (git pull)."
            Write-Host "gps               : Pushes the current branch to origin (git push)."
            Write-Host "gacp [msg]        : Stages all changes, commits, and pushes (default: 'update')."
            Write-Host "gac [msg]         : Stages all changes and commits (default: 'update')."
            Write-Host "gcl <repoUrl> [dir] : Clones a repository to the specified or current directory."
            Write-Host "gnew <branch>     : Creates and switches to a new branch."
            Write-Host "gco <branch>      : Switches to an existing branch."
            Write-Host "gbd <branch>      : Deletes a branch."
            Write-Host "gpsb              : Pushes the current branch to origin."
            Write-Host "gst [action] [index] : Manages Git stash (push, pop, list, apply, drop)."
            Write-Host "gm <branch> [-rebase] : Merges or rebases a branch into the current branch."
            Write-Host "gl [-oneline] [commit] : Shows Git log, optionally compact or for a specific commit."
            Write-Host "gd                : Shows uncommitted changes (git diff)."
            Write-Host "gr [file] [-hard] [commit] : Resets, discards changes, or reverts a commit."
            Write-Host "grm [name] [url] [-remove] : Manages remote repositories (add, remove, or list)."
            Write-Host "gt <tag> [options] : Manages tags (create, delete, or push)."
            Write-Host "gmisc [options]   : Miscellaneous Git tasks (clean, list branches, or cherry-pick)."
            Write-Host ""
        }
        {$_ -eq 0 -or $_ -eq 5} {
            Write-Host "5. Built-in PowerShell Commands" -ForegroundColor Green
            Write-Host "--------------------------------" -ForegroundColor Green
            Write-Host "cd <path>                 : Changes the current directory (alias for Set-Location)."
            Write-Host "                  Usage: cd ~/Documents, cd .."
	    Write-Host ""
            Write-Host "ls                        : Lists directory contents (alias for Get-ChildItem)."
            Write-Host "                  Usage: ls, ls -Recurse, ls *.txt"
	    Write-Host ""
            Write-Host "explorer <path>           : Opens Windows File Explorer at the specified or current directory."
            Write-Host "                  Usage: explorer ., explorer C:\Users"
	    Write-Host ""
            Write-Host "mkdir <name>              : Creates a new directory (alias for New-Item -ItemType Directory)."
            Write-Host "                  Usage: mkdir myFolder"
	    Write-Host "" 
            Write-Host "rm <path>                 : Delete a file or folder (also: del, Remove-Item)"
            Write-Host "                         Example: rm file.txt   |   rm folder -Recurse"
            Write-Host ""
            Write-Host "Rename-Item <old> <new>   : Rename a file or folder"
            Write-Host "                         Example: Rename-Item old.txt new.txt"
            Write-Host ""
            Write-Host "mv <source> <target>      : Move a file or folder (also: Move-Item)"
            Write-Host "                         Example: mv file.txt backup/"
            Write-Host ""
            Write-Host "cp <source> <target>      : Copy a file or folder (also: Copy-Item)"
            Write-Host "                         Example: cp file.txt backup/"
            Write-Host ""
            Write-Host "New-Item <name> -ItemType File : Create a new empty file"
            Write-Host "                         Example: New-Item notes.txt -ItemType File"
            Write-Host ""
            Write-Host "cat <file>                : Show what's inside a file (also: Get-Content)"
            Write-Host "                         Example: cat log.txt"
            Write-Host ""
            Write-Host "Set-Content <file> <text> : Write text to a file"
            Write-Host "                         Example: Set-Content hello.txt 'Hello, world!'"
            Write-Host ""

        }
        default {
            Write-Host "Invalid group number. Use 1-5 to select a group or omit for all." -ForegroundColor Red
            Write-Host "Available groups:" -ForegroundColor Yellow
            Write-Host "1. Directory Navigation Functions"
            Write-Host "2. Visual Studio Code Launch Functions"
            Write-Host "3. AI and Web Search Functions"
            Write-Host "4. Git Utility Functions"
            Write-Host "5. Built-in PowerShell Commands"
            Write-Host ""
        }
    }

    Write-Host "Usage: help [group] (e.g., help 1 for Directory Navigation)" -ForegroundColor Cyan
    Write-Host ""
}


# ----------------------
# Directory Navigation Functions
# ----------------------

function goDesktop {
    $desktopPath = [Environment]::GetFolderPath("Desktop")
    if (Test-Path $desktopPath) {
        Set-Location $desktopPath
    } else {
        Write-Error "Desktop path does not exist: $desktopPath"
    }
}

function goDownload {
    # Try standard Downloads path first
    $downloadsPath = Join-Path ([Environment]::GetFolderPath("UserProfile")) "Downloads"
    if (Test-Path $downloadsPath) {
        Set-Location $downloadsPath
        return
    }

    # Fallback: Custom Downloads path
    $fallbackDownloadsPath = "D:\Downloads"
    if (Test-Path $fallbackDownloadsPath) {
        Set-Location $fallbackDownloadsPath
        return
    }

    # If neither path exists, show error
    Write-Error "Downloads path does not exist: $downloadsPath or $fallbackDownloadsPath"
}

function goCollege {
    Set-Location 'D:\Desktop\Files\College'
}

function goPractice {
    Set-Location 'D:\Desktop\Files\Projects\Practice files'
}

function goProjects {
    Set-Location 'D:\Desktop\Files\Projects'
}

function cdl {
    param (
        [ArgumentCompleter({
            param($commandName, $parameterName, $wordToComplete, $commandAst, $fakeBoundParameters)
            Get-ChildItem -Path "." -Directory |
                Where-Object { $_.Name -like "$wordToComplete*" } |
                ForEach-Object { 
                    # Quote directory names with spaces for proper autocompletion
                    if ($_.Name -match '\s') {
                        '"' + $_.Name + '"'
                    } else {
                        $_.Name
                    }
                }
        })]
        [string[]]$path = @(".")
    )

    $joinedPath = $path -join ' '
    if ($joinedPath -like '.\*') {
        $joinedPath = $joinedPath.Substring(2)
    }

    if ([string]::IsNullOrWhiteSpace($joinedPath)) {
        $joinedPath = "."
    }

    $fullPath = Join-Path -Path (Get-Location).ProviderPath -ChildPath $joinedPath
    try {
        $resolvedPath = Resolve-Path -Path $fullPath -ErrorAction Stop
        if (-not (Test-Path $resolvedPath -PathType Container)) {
            Write-Error "Path does not exist or is not a directory: $resolvedPath"
            return
        }
        Set-Location $resolvedPath
        Get-ChildItem
    } catch {
        Write-Error "Path does not exist: $joinedPath"
        return
    }
}

# Path Bookmarks
$MyPaths = @{
    "working" = "D:\Desktop\Files\Woking"
    "college" = "D:\Desktop\Files\College"
    "down"    = "D:\Downloads"
}

function goto {
    param([string]$label)
    if ($MyPaths.ContainsKey($label)) {
        Set-Location $MyPaths[$label]
        Get-ChildItem
    } else {
        Write-Error "No such bookmark: $label"
    }
}

# ----------------------
# Visual Studio Code Launch Functions
# ----------------------

function codeweb {
    code . --profile "Web Dev"
}

function codepy {
    code . --profile "Python Dev"
}

function codecpp {
    code . --profile "CPP Dev"
}

function codejava {
    code . --profile "Java Dev"
}

# ----------------------
# AI and Web Search Functions
# ----------------------

function ai {
    param(
        [Parameter(Mandatory = $true, ValueFromRemainingArguments = $true)]
        [string[]]$Prompt
    )

    $query = $Prompt -join ' '
    $headers = @{
        "Authorization" = "Bearer $env:HF_API_KEY"
        "Content-Type"  = "application/json"
    }

    $body = @{
        inputs = "<s>[INST] Provide a concise, one-line answer: $query [/INST]"
        parameters = @{
            max_new_tokens   = 50
            temperature      = 0.3
            return_full_text = $false
        }
    } | ConvertTo-Json -Depth 10

    $maxRetries = 3
    $retryDelay = 5  # seconds

    for ($i = 0; $i -lt $maxRetries; $i++) {
        try {
            $response = Invoke-RestMethod `
                -Uri "https://api-inference.huggingface.co/models/mistralai/Mistral-7B-Instruct-v0.3" `
                -Method Post `
                -Headers $headers `
                -Body $body
            return $response[0].generated_text.Trim()
        } catch {
            if ($_.Exception.Message -match "429") {
                Write-Output "Rate limit hit. Retrying in $retryDelay seconds..."
                Start-Sleep -Seconds $retryDelay
            } elseif ($_.Exception.Message -match "404") {
                Write-Error "Model not found or unavailable. Ensure the model 'mistralai/Mistral-7B-Instruct-v0.3' is accessible."
                Write-Output "Check https://huggingface.co/models for available models or verify your API key permissions."
                return
            } elseif ($_.Exception.Message -match "401") {
                Write-Error "Unauthorized. Ensure HF_API_KEY is valid and has 'Make calls to Inference Providers' permission."
                Write-Output "Regenerate your token at https://huggingface.co/settings/tokens."
                return
            } else {
                Write-Error "Failed to contact Hugging Face API: $($_.Exception.Message)"
                Write-Output "Ensure HF_API_KEY is set and try again later."
                return
            }
        }
    }
    Write-Error "Failed after $maxRetries retries due to rate limits."
}

function webSearch {
    param (
        [Parameter(Mandatory = $true, Position = 0, ValueFromRemainingArguments = $true)]
        [string[]]$Query
    )

    $searchQuery = $Query -join ' '
    $encodedQuery = [Uri]::EscapeDataString($searchQuery)
    $apiUrl = "https://api.duckduckgo.com/?q=$encodedQuery&format=json&no_redirect=1"

    try {
        $response = Invoke-RestMethod -Uri $apiUrl -Method Get -ErrorAction Stop
        if ($response.Abstract -and $response.Abstract -ne '') {
            $firstSentence = ($response.Abstract -split '\.')[0].Trim()
            return $firstSentence
        } elseif ($response.Answer -and $response.Answer -ne '') {
            return $response.Answer.Trim()
        } elseif ($response.RelatedTopics -and $response.RelatedTopics.Count -gt 0) {
            $firstSentence = ($response.RelatedTopics[0].Text -split '\.')[0].Trim()
            return $firstSentence
        } else {
            Write-Host "No direct answer found for '$searchQuery' in web search. Opening browser..." -ForegroundColor Yellow
            Start-Process "https://duckduckgo.com/?q=$encodedQuery"
            return $null
        }
    } catch {
        Write-Error "Failed to perform web search: $($_.Exception.Message)"
        Write-Host "Check your internet connection or query syntax." -ForegroundColor Red
        return $null
    }
}

function ask {
    param(
        [Parameter(Mandatory = $true, ValueFromRemainingArguments = $true)]
        [string[]]$Prompt
    )

    $query = $Prompt -join ' '
    $aiResult = ai $query
    if ($aiResult -and $aiResult -ne '') {
        return $aiResult
    }

    Write-Host "AI query failed. Attempting web search..." -ForegroundColor Yellow
    $webResult = webSearch $query
    if ($webResult -and $webResult -ne '') {
        return $webResult
    }

    Write-Error "No terminal answer found for '$query'."
    Write-Output "Browser opened with search results. Ensure HF_API_KEY is valid or try a different query."
}

# ----------------------
# Git Utility Functions
# ----------------------

function gs {
    git status
}

function gc {
    param (
        [string]$msg = "update"
    )
    git commit -m "$msg"
}

function gf {
    git fetch
}

function gpl {
    git pull
}

function gps {
    git push
}

function gacp {
    param (
        [string]$msg = "update"
    )
    git add .
    git commit -m "$msg"
    git push
}

function gac {
    param (
        [string]$msg = "update"
    )
    git add .
    git commit -m "$msg"
}

function gcl {
    param (
        [Parameter(Mandatory = $true)]
        [string]$repoUrl,
        [string]$targetDir
    )
    if ($targetDir) {
        git clone $repoUrl $targetDir
    } else {
        git clone $repoUrl
    }
}

function gnew {
    param (
        [Parameter(Mandatory = $true)]
        [string]$branch
    )
    git checkout -b $branch
}

function gco {
    param (
        [Parameter(Mandatory = $true)]
        [string]$branch
    )
    git checkout $branch
}

function gbd {
    param (
        [Parameter(Mandatory = $true)]
        [string]$branch
    )
    git branch -d $branch
}

function gpsb {
    $branch = git rev-parse --abbrev-ref HEAD
    git push origin $branch
}

function gst {
    param (
        [string]$action = "push",
        [string]$stashIndex
    )
    switch ($action.ToLower()) {
        "push"  { git stash }
        "pop"   { git stash pop }
        "list"  { git stash list }
        "apply" { git stash apply }
        "drop"  { if ($stashIndex) { git stash drop "stash@{$stashIndex}" } else { git stash drop } }
        default { Write-Output "Usage: gst [push|pop|list|apply|drop] [stashIndex]" }
    }
}

function gm {
    param (
        [Parameter(Mandatory = $true)]
        [string]$branch,
        [switch]$rebase
    )
    if ($rebase) {
        git rebase $branch
    } else {
        git merge $branch
    }
}

function gl {
    param (
        [switch]$oneline,
        [string]$commit
    )
    if ($commit) {
        git show $commit
    } elseif ($oneline) {
        git log --oneline --graph
    } else {
        git log
    }
}

function gd {
    git diff
}

function gr {
    param (
        [string]$file,
        [switch]$hard,
        [string]$commit
    )
    if ($commit) {
        git revert $commit
    } elseif ($hard) {
        git reset --hard HEAD
    } elseif ($file) {
        git reset $file
        git checkout -- $file
    } else {
        Write-Output "Usage: gr [file] [-hard] [commit]"
    }
}

function grm {
    param (
        [string]$name,
        [string]$url,
        [switch]$remove
    )
    if ($remove -and $name) {
        git remote remove $name
    } elseif ($name -and $url) {
        git remote add $name $url
    } else {
        git remote -v
    }
}

function gt {
    param (
        [Parameter(Mandatory = $true)]
        [string]$tag,
        [string]$message,
        [switch]$delete,
        [switch]$push
    )
    if ($delete) {
        git tag -d $tag
    } elseif ($push) {
        git push origin $tag
    } elseif ($message) {
        git tag -a $tag -m $message
    } else {
        git tag $tag
    }
}

function gmisc {
    param (
        [string]$commit,
        [switch]$clean,
        [switch]$branches
    )
    if ($clean) {
        git clean -fd
    } elseif ($branches) {
        git branch -a
    } elseif ($commit) {
        git cherry-pick $commit
    } else {
        Write-Output "Usage: gmisc [-clean] [-branches] [commit]"
    }
}
