# PowerShell Utilities Setup Guide

This guide walks you through setting up a collection of PowerShell functions designed to enhance productivity with directory navigation, Visual Studio Code (VS Code) integration, AI and web search capabilities, and Git utilities. Follow the steps below to install the script and configure it for your environment.

## Prerequisites
- **PowerShell**: Version 5.1 or later (Windows PowerShell or PowerShell Core). Check your version by running:
  ```powershell
  $PSVersionTable.PSVersion
  ```
- **Visual Studio Code**: Installed with the `code` command available in your terminal. Download from [code.visualstudio.com](https://code.visualstudio.com/).
- **Git**: Installed and accessible via the `git` command. Download from [git-scm.com](https://git-scm.com/).
- **Hugging Face Account**: Required for AI functions. Sign up at [huggingface.co](https://huggingface.co/).

## Step 1: Install the PowerShell Script
1. **Download the Script**:
   - Save the provided PowerShell script as `MyUtilities.ps1` in a directory of your choice (e.g., `C:\Scripts`).

2. **Load the Script in Your PowerShell Profile**:
   - Open your PowerShell profile script by running:
     ```powershell
     notepad $PROFILE
     ```
     If the profile doesn’t exist, PowerShell will prompt you to create it.
   - Add the following line to load the script every time PowerShell starts:
     ```powershell
     . C:\Scripts\MyUtilities.ps1
     ```
     Replace `C:\Scripts\MyUtilities.ps1` with the actual path to your script.
   - Save and close the file.
   - Reload your profile by running the following or restart PowerShell:
     ```powershell
     . $PROFILE
     ```

3. **Verify Installation**:
   - Run the `help` command to see available functions:
     ```powershell
     help
     ```
   - You should see a list of functions grouped into categories (Directory Navigation, VS Code Launch, AI and Web Search, Git Utilities, and Built-in PowerShell Commands).

## Step 2: Configure the Hugging Face API Key
The `ai` and `ask` functions query the Hugging Face Mistral AI model, requiring an API key.

1. **Obtain an API Key**:
   - Log in to [huggingface.co](https://huggingface.co/).
   - Navigate to **Settings > Access Tokens** ([huggingface.co/settings/tokens](https://huggingface.co/settings/tokens)).
   - Generate a new token with **Read** access for “Make calls to Inference Providers.”
   - Copy the token.

2. **Set the API Key in PowerShell**:
   - Set the `HF_API_KEY` environment variable permanently:
     ```powershell
     [Environment]::SetEnvironmentVariable("HF_API_KEY", "your-api-key-here", "User")
     ```
     Replace `your-api-key-here` with your actual token.
   - Alternatively, add it to your PowerShell profile for the current user:
     ```powershell
     notepad $PROFILE
     ```
     Add:
     ```powershell
     $env:HF_API_KEY = "your-api-key-here"
     ```
     Save, close, and reload the profile:
     ```powershell
     . $PROFILE
     ```

3. **Test the AI Function**:
   - Run a test query:
     ```powershell
     ai "What is the capital of France?"
     ```
   - Expected output: “The capital of France is Paris.”
   - If you encounter errors (e.g., 401 Unauthorized), verify your API key and permissions.

## Step 3: Configure Visual Studio Code Profiles
The script includes functions (`codeweb`, `codepy`, `codecpp`, `codejava`) to launch VS Code with specific profiles. You can customize these profiles to match your development environments.

1. **Understand VS Code Profiles**:
   - Profiles in VS Code allow you to save specific extensions, settings, and configurations for different development tasks (e.g., web development, Python, C++, Java).
   - The script assumes profiles named “Web Dev,” “Python Dev,” “CPP Dev,” and “Java Dev.” You can rename them or create new ones.

2. **Create or Import Profiles**:
   - Open VS Code.
   - Access the Profiles menu:
     - Click the gear icon (bottom left) > **Profiles** > **Create Profile**.
     - Name your profiles (e.g., “Web Development,” “Python,” “C++,” “Java”) or keep the script’s default names.
   - Configure each profile with relevant extensions and settings:
     - **Web Development**: Install extensions like “Live Server,” “Prettier,” and “ESLint.”
     - **Python**: Install “Python” and “Pylance” extensions, configure Python interpreter.
     - **C++**: Install “C/C++” extension, configure compiler paths.
     - **Java**: Install “Java Extension Pack.”
   - Alternatively, import existing profiles:
     - Go to **Profiles** > **Import Profile** and follow the prompts.

3. **Update the Script (Optional)**:
   - If you used different profile names, modify the `codeweb`, `codepy`, `codecpp`, and `codejava` functions in `MyUtilities.ps1`:
     ```powershell
     function codeweb {
         code . --profile "Your-Web-Profile-Name"
     }
     function codepy {
         code . --profile "Your-Python-Profile-Name"
     }
     function codecpp {
         code . --profile "Your-CPP-Profile-Name"
     }
     function codejava {
         code . --profile "Your-Java-Profile-Name"
     }
     ```
   - Save the script and reload your profile:
     ```powershell
     . $PROFILE
     ```

4. **Test VS Code Functions**:
   - Run:
     ```powershell
     codeweb
     ```
   - VS Code should open in the current directory with your web development profile. Repeat for `codepy`, `codecpp`, and `codejava`.

## Step 4: Customize File Paths for Navigation
The `goDesktop`, `goDownload`, `goCollege`, `goPractice`, `goProjects`, and `goto` functions navigate to specific directories. Customize these paths to match your file structure.

1. **Modify Navigation Functions**:
   - Open `MyUtilities.ps1` in a text editor.
   - Update the paths in the following functions:
     ```powershell
     function goDesktop {
         $desktopPath = [Environment]::GetFolderPath("Desktop")  # Usually fine as-is
         if (Test-Path $desktopPath) {
             Set-Location $desktopPath
         } else {
             Write-Error "Desktop path does not exist: $desktopPath"
         }
     }

     function goDownload {
         $downloadsPath = Join-Path ([Environment]::GetFolderPath("UserProfile")) "Downloads"  # Default Downloads
         if (Test-Path $downloadsPath) {
             Set-Location $downloadsPath
             return
         }
         $fallbackDownloadsPath = "D:\Your\Custom\Downloads"  # Change to your fallback path
         if (Test-Path $fallbackDownloadsPath) {
             Set-Location $fallbackDownloadsPath
             return
         }
         Write-Error "Downloads path does not exist: $downloadsPath or $fallbackDownloadsPath"
     }

     function goCollege {
         Set-Location 'C:\Your\Path\To\College'  # Change to your college directory
     }

     function goPractice {
         Set-Location 'C:\Your\Path\To\Practice'  # Change to your practice directory
     }

     function goProjects {
         Set-Location 'C:\Your\Path\To\Projects'  # Change to your projects directory
     }
     ```

2. **Update Path Bookmarks for `goto`**:
   - The `goto` function uses a hashtable `$MyPaths` for bookmarked paths:
     ```powershell
     $MyPaths = @{
         "working" = "C:\Your\Path\To\Working"  # Change to your working directory
         "college" = "C:\Your\Path\To\College"  # Change to your college directory
         "down"    = "C:\Your\Path\To\Downloads"  # Change to your downloads directory
     }
     ```
   - Add or remove bookmarks as needed.

3. **Save and Reload**:
   - Save `MyUtilities.ps1` and reload your profile:
     ```powershell
     . $PROFILE
     ```

4. **Test Navigation**:
   - Run:
     ```powershell
     goCollege
     goto working
     ```
   - Verify that you navigate to the correct directories.

## Step 5: Using the Script
- **View Available Commands**:
  ```powershell
  help
  ```
  Use `help 1` to `help 5` for specific groups (e.g., `help 1` for navigation functions).

- **Example Commands**:
  - Navigate: `goProjects`, `goto college`, `cdl MyFolder`
  - Launch VS Code: `codepy` (opens with Python profile)
  - AI Query: `ai "What is 2 + 2?"` (returns “4”)
  - Web Search: `webSearch "PowerShell tutorial"` (returns a result or opens a browser)
  - Git Operations: `gacp "my commit message"` (add, commit, push)

## Troubleshooting
- **AI Function Errors**:
  - **401 Unauthorized**: Check `HF_API_KEY` with `echo $env:HF_API_KEY`. Regenerate the token if invalid.
  - **429 Rate Limit**: Wait a few seconds and retry. Consider upgrading your Hugging Face plan for higher limits.
- **VS Code Profile Not Found**: Ensure the profile exists in VS Code. Run `code --list-profiles` (if available) or check the Profiles menu.
- **Navigation Errors**: Verify paths in `MyUtilities.ps1`. Ensure directories exist.
- **Git Commands Fail**: Ensure Git is installed and configured (`git --version`).

## Contributing
Feel free to modify the script or add new functions. Share improvements by forking the repository (if hosted) or contacting the author.

## License
This script is provided as-is for personal use. Modify and distribute freely, but no warranty is provided.
