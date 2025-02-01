# Requires -RunAsAdministrator
# invoke in Admin-launched Powershell via: Set-ExecutionPolicy Bypass -Scope Process -Force; .\unattended-install.ps1
# Unattended install of various packages. See https://community.chocolatey.org/

# Download and run the Chocolatey install script
[System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))

Write-Host "Chocolatey has been installed successfully."

# List of packages to install
$packages = @(
    'googledrive', 
    '7zip',
    'chocolateygui', 
    'autohotkey', 
    'revo-uninstaller', 
    'bind-toolsonly', 
    'sysinternals', 
    'hwmonitor', 
    'ipnetinfo', 
    'cygwin', 
    'cyg-get', 
    'keepass', 
    'keepass-plugin-keetheme', 
    'keybase', 
    'powertoys', 
    'processhacker', 
    'procexp', 
    'rpi-imager', 
    'sharex', 
    'systeminformer-nightlybuilds', 
    'unifying', 
    'Wget', 
    'vcxsrv', 
    'winaero-tweaker', 
    'WinDirStat', 
    'winhotkey', 
    'wireshark',
    'openhardwaremonitor',
    'etcher',
    
    # DevOps packages
    'winscp', 
    'git', 
    'insomnia', 
    'putty',
    
    # Browsers
    'brave', 
    'Firefox', 
    'GoogleChrome',
    
    # Media packages
    'cdburnerxp', 
    'flicflac', 
    'jellyfin', 
    'soulseek', 
    'telegram', 
    'vlc', 
    'winamp',
    
    # AI packages
    'docker-desktop', 
    'cuda',
    
    # Productivity packages
    'dbeaver', 
    'dos2unix', 
    'foxitreader', 
    'freecad', 
    'openscad', 
    'photogimp', 
    'Ghostscript', 
    'instanteyedropper', 
    'large-text-file-viewer', 
    'libreoffice', 
    'mupdf', 
    'vscode', 
    'winmerge', 
    'wireguard', 
    'tortoisegit',

    'nodejs',
    'nvm',
    'pnpm'
    
    # Optional packages
    # 'rawtherapee', 
    # 'previewconfig', 
    # 'awscli', 
    # 'cloudflared', 
    # 'filezilla', 
    # 'joplin', 
    # 'duplicati'
)

# Install each package silently
foreach ($package in $packages) {
    try {
        Write-Host "Installing $package..."
        choco install $package -y --no-progress
        Write-Host "$package has been installed successfully."
    } catch {
        Write-Host "Failed to install $package. Error: $_"
    }
}

Write-Host "All packages have been installed."

# Allow scripts to be run in Powershell (e.g. npm)
echo A | Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope LocalMachine
npm -v

# Show serial number:
GWMI -Class Win32_Bios | select SerialNumber
