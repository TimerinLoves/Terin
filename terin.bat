@ECHO OFF
:: Script by Timerin, leave unmodified.
:: Main menu loop
:menu
cls
title Terin - Main Menu
chcp 65001 > nul
echo.
color 05
echo =========================================
echo.
echo  ████████╗███████╗██████╗ ██╗███╗   ██╗
echo  ╚══██╔══╝██╔════╝██╔══██╗██║████╗  ██║
echo     ██║   █████╗  ██████╔╝██║██╔██╗ ██║
echo     ██║   ██╔══╝  ██╔══██╗██║██║╚██╗██║
echo     ██║   ███████╗██║  ██║██║██║ ╚████║
echo     ╚═╝   ╚══════╝╚═╝  ╚═╝╚═╝╚═╝  ╚═══╝
echo				by Timerin
echo =========================================
echo.
echo  Type 'help' to see available commands...
echo.
echo -----------------------------------------
echo.
set /p choice="terin> "
:: Commands
if /I "%choice%"=="back" goto :menu
if /I "%choice%"=="help" goto :help
if /I "%choice%"=="info" goto :info
if /I "%choice%"=="testing" goto :test
if /I "%choice%"=="test" goto :test
if /I "%choice%"=="setup" goto :setup
if /I "%choice%"=="admin" goto :admin
if /I "%choice%"=="hidefile" goto :hidefile
if /I "%choice%"=="exit" goto :eof

:: If the command is not recognized
echo Invalid command. Type 'help' for a list of available commands.
pause
goto :menu

:: Help section
:help
cls
title Terin - Help
color 0D
echo ==========================================================================
echo.
echo   ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗
echo  ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝
echo  ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║███████╗
echo  ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║╚════██║
echo  ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████║
echo   ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝
echo.
echo ==========================================================================
echo.
echo Available commands:
echo  back         - Go back to the Main menu
echo  help         - Show this help menu
echo  info         - Show your Device Informations
echo  test         - Run the testing protocol, meant to find any errors in your system.
echo  setup        - Setup your Device with Timerin's Recommendations
echo  admin        - Give the Console admin privileges
echo  hidefile     - Hide files inside a image file
echo  exit         - to close it
echo.
set /p choice="terin> "
goto :process_command

:: Process command section
:process_command
if /I "%choice%"=="back" goto :menu
if /I "%choice%"=="help" goto :help
if /I "%choice%"=="info" goto :info
if /I "%choice%"=="testing" goto :test
if /I "%choice%"=="test" goto :test
if /I "%choice%"=="setup" goto :setup
if /I "%choice%"=="admin" goto :admin
if /I "%choice%"=="hidefile" goto :hidefile
if /I "%choice%"=="exit" goto :eof

:: If the command is not recognized in help menu as well
echo Invalid command. Type 'help' for a list of available commands.
pause
goto :menu

:: run info protocol
:info
cls
title Terin - Info
color 0A
echo ==============================
echo.
echo ██╗███╗   ██╗███████╗ ██████╗ 
echo ██║████╗  ██║██╔════╝██╔═══██╗
echo ██║██╔██╗ ██║█████╗  ██║   ██║
echo ██║██║╚██╗██║██╔══╝  ██║   ██║
echo ██║██║ ╚████║██║     ╚██████╔╝
echo ╚═╝╚═╝  ╚═══╝╚═╝      ╚═════╝ 
echo.
echo ==============================
echo.
echo Running Info...

:: IP Configuration
set /p ipconfig_prompt="Show IP configuration? (y/n): "
if /I "%ipconfig_prompt%"=="y" (
    ipconfig /all
)

:: System Information
echo.
set /p sysinfo_prompt="Show system information? (y/n): "
if /I "%sysinfo_prompt%"=="y" (
    systeminfo
)

:: TCP Connections
echo.
set /p netstat_prompt="Show active TCP connections? (y/n): "
if /I "%netstat_prompt%"=="y" (
    netstat -an
)

:: Device Drivers
echo.
set /p drivers_prompt="Show device drivers? (y/n): "
if /I "%drivers_prompt%"=="y" (
    driverquery
)

pause
goto :menu

:: run testing protocols
:test
cls
title Terin - Admin Check
color 0C
:: Check for administrator permissions first
NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo The testing command requires administrator permission, Restart as administrator?
	echo Manual restarting of the test command is required!
    PAUSE
    :: Restart as administrator
    PowerShell Start-Process -Verb RunAs -FilePath "%~0"
    EXIT /B
)
title Terin - Testing
echo =========================================================
echo.
echo ████████╗███████╗███████╗████████╗██╗███╗   ██╗ ██████╗ 
echo ╚══██╔══╝██╔════╝██╔════╝╚══██╔══╝██║████╗  ██║██╔════╝ 
echo    ██║   █████╗  ███████╗   ██║   ██║██╔██╗ ██║██║  ███╗
echo    ██║   ██╔══╝  ╚════██║   ██║   ██║██║╚██╗██║██║   ██║
echo    ██║   ███████╗███████║   ██║   ██║██║ ╚████║╚██████╔╝
echo    ╚═╝   ╚══════╝╚══════╝   ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ 
echo.
echo =========================================================
echo.
echo Running Tests...
echo If it's stuck on this Screen just press any key
echo.
echo Scanning for Broken Files...
sfc /scannow
echo.
echo Checking Disk...
chkdsk /f
echo.
echo Cleaning up Disk...
cleanmgr /sageset:1 & cleanmgr /sagerun:1
echo.
echo Running Network Diagnostics...
netsh winsock reset
echo.
echo Running Ram Testing Tool...
mdsched.exe
echo.
echo Running Driver Verification Tool...
verifier
echo.
echo Checking for Windows Health
DISM /Online /Cleanup-Image /RestoreHealth
echo.
echo Checking for Windows Updates...
wuauclt /detectnow
pause
goto :menu

:: Script by Timerin

:: run setup protocol
:setup
cls
title Terin - Admin Check
color 0E
NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo The testing command requires administrator permission, Restart as administrator?
	echo Manual restarting of the test command is required!
    PAUSE
    :: Restart as administrator
    PowerShell Start-Process -Verb RunAs -FilePath "%~0"
    EXIT /B
)
title Terin - Setup
echo ==========================================
echo.
echo ███████╗███████╗████████╗██╗   ██╗██████╗ 
echo ██╔════╝██╔════╝╚══██╔══╝██║   ██║██╔══██╗
echo ███████╗█████╗     ██║   ██║   ██║██████╔╝
echo ╚════██║██╔══╝     ██║   ██║   ██║██╔═══╝ 
echo ███████║███████╗   ██║   ╚██████╔╝██║     
echo ╚══════╝╚══════╝   ╚═╝    ╚═════╝ ╚═╝                                   
echo.
echo ==========================================
echo.
echo Running setup...

:: Check if Chocolatey is installed
choco --version >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    REM Chocolatey is not installed, install it
    @powershell -NoProfile -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))"
)

:: Variable to track if Google Chrome has been selected
set "chrome_selected="

:: Install Google Chrome
set /p install_googlechrome="Do you want to install Google Chrome? (y/n): "
set "install_googlechrome=%install_googlechrome:~0,1%"
if /I "%install_googlechrome%"=="y" (
    echo Installing Google Chrome...
    choco install googlechrome -y
    choco install adblockpluschrome -y
    choco install ublockorigin-chrome -y
    choco install video-ad-block-for-twitch-chrome
    set "chrome_selected=true"
	echo.
	echo Set Browser as Default
	start ms-settings:defaultapps
) else (
    echo Google Chrome is not selected.
)

:: If Google Chrome is selected, skip Opera GX and Firefox
if defined chrome_selected (
    echo Skipping Opera GX and Firefox installation since Google Chrome is selected.
    goto :past_browser_setup
)

:: Variable to track if Opera GX has been selected
set "opera_selected="

:: Install Opera GX
set /p install_opera_gx="Do you want to install Opera GX instead? (y/n): "
set "install_opera_gx=%install_opera_gx:~0,1%"
if /I "%install_opera_gx%"=="y" (
    echo Installing Opera GX...
    choco install opera-gx -y
    choco install adblockplusopera -y
    set "opera_selected=true"
	echo.
	echo Set Browser as Default
	start ms-settings:defaultapps
) else (
    echo Opera GX is not selected.
)

:: If Opera GX is selected, skip Firefox and WinRAR/7-Zip
if defined opera_selected (
    echo Skipping Firefox and WinRAR/7-Zip installation since Opera GX is selected.
    goto :past_browser_setup
)

:: Install Firefox
set /p install_firefox="Do you want to install Firefox instead? (y/n): "
set "install_firefox=%install_firefox:~0,1%"
if /I "%install_firefox%"=="y" (
    echo Installing Firefox...
    choco install firefox -y
    choco install adblockplusfirefox -y
	echo.
	echo Set Browser as Default
	start ms-settings:defaultapps
) else (
    echo Firefox is not selected.
)

:: Install Discord
:past_browser_setup
echo.
set /p install_discord="Do you want to install Discord? (y/n): "
set "install_discord=%install_discord:~0,1%"
if /I "%install_discord%"=="y" (
    choco install discord -y
	echo Downloading VencordInstaller...
    start "" "https://github.com/Vencord/Installer/releases/latest/download/VencordInstaller.exe"
    pause
)

:: Install Steam
echo.
set /p install_steam="Do you want to install Steam? (y/n): "
set "install_steam=%install_steam:~0,1%"
if /I "%install_steam%"=="y" (
    choco install steam -y
)

:: Install VLC
echo.
set /p install_vlc="Do you want to install VLC media player? (y/n): "
set "install_vlc=%install_vlc:~0,1%"
if /I "%install_vlc%"=="y" (
    choco install vlc -y
)

:: Install revo-uninstaller
echo.
set /p install_vlc="Do you want to install Revo uninstaller? (y/n): "
set "install_revo=%install_revo:~0,1%"
if /I "%install_revo%"=="y" (
    choco install revo-uninstaller -y
)


:: Install WinRAR or 7-Zip
set "winrar_selected="
echo.
set /p install_winrar="Do you want to install WinRAR? (y/n): "
set "install_winrar=%install_winrar:~0,1%"
if /I "%install_winrar%"=="y" (
    choco install winrar -y
	set "winrar_selected=true"
)
if defined winrar_selected (
    echo Skipping 7-Zip installation since Winrar is selected.
    goto :past_archive_setup
)
echo.
set /p install_7zip="WinRAR is not selected. Do you want to install 7-Zip instead? (y/n): "
set "install_7zip=%install_7zip:~0,1%"
if /I "%install_7zip%"=="y" (
	choco install 7zip -y
)

:past_archive_setup

:: Install Google Drive
set "gdrive_selected="
echo.
set /p install_gdrive="Do you want to install Google Drive? (y/n): "
set "install_gdrive=%install_gdrive:~0,1%"
if /I "%install_gdrive%"=="y" (
    choco install googledrive -y
	set "gdrive_selected=true"
)
if defined gdrive_selected (
    echo Skipping Dropbox installation since Google Drive is selected.
    goto :past_cloud_setup
)
echo.
set /p install_dropbox="Do you want to install Dropbox? (y/n): "
set "install_dropbox=%install_dropbox:~0,1%"
if /I "%install_dropbox%"=="y" (
    choco install dropbox -y
)
:past_cloud_setup

echo.
set /p install_java="Do you want to install Java? (y/n): "
set "install_java=%install_java:~0,1%"
if /I "%install_java%"=="y" (
    choco install javaruntime -y
)

echo.
set /p install_dotnet="Do you want to install Microsoft .NET? (y/n): "
set "install_dotnet=%install_dotnet:~0,1%"
if /I "%install_dotnet%"=="y" (
    choco install dotnet -y
)

:: Define Bloatware list
SET Bloatware=Microsoft.PPIProjection Microsoft.BingNews Microsoft.GetHelp Microsoft.Getstarted Microsoft.Messaging Microsoft.Microsoft3DViewer Microsoft.MicrosoftOfficeHub Microsoft.MicrosoftSolitaireCollection Microsoft.NetworkSpeedTest Microsoft.News Microsoft.Office.Lens Microsoft.Office.OneNote Microsoft.Office.Sway Microsoft.OneConnect Microsoft.People Microsoft.Print3D Microsoft.RemoteDesktop Microsoft.SkypeApp Microsoft.StorePurchaseApp Microsoft.Office.Todo.List Microsoft.Whiteboard Microsoft.WindowsAlarms microsoft.windowscommunicationsapps Microsoft.WindowsFeedbackHub Microsoft.WindowsMaps Microsoft.WindowsSoundRecorder Microsoft.Xbox.TCUI Microsoft.XboxApp Microsoft.XboxGameOverlay Microsoft.XboxGamingOverlay Microsoft.XboxIdentityProvider Microsoft.XboxSpeechToTextOverlay Microsoft.ZuneMusic Microsoft.ZuneVideo EclipseManager ActiproSoftwareLLC AdobeSystemsIncorporated.AdobePhotoshopExpress Duolingo-LearnLanguagesforFree PandoraMediaInc CandyCrush BubbleWitch3Saga Wunderlist Flipboard Twitter Facebook Spotify Minecraft RoyalRevolt Sway Dolby

:: Remove Bloatware
echo.
echo Removing Bloatware...
FOR %%i IN (%Bloatware%) DO (
    echo Removing %%i...
    PowerShell -Command "Get-AppxPackage -AllUsers | Where-Object {$_.Name -eq '%%i'} | Remove-AppxPackage"
)

:: Remove Registry Keys
echo.
echo Removing Registry Keys...
FOR %%K IN (%Keys%) DO (
    reg delete "%%K" /f >nul 2>&1
    if %errorlevel% equ 0 (
        echo Removed registry key: %%K
    ) else (
        echo Error removing registry key: %%K
    )
)

:: Disable Cortana
echo.
echo Disabling Cortana...
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search /v AllowCortana /t REG_DWORD /d 0 /f >nul 2>&1

::Disable Edge PDF
echo.
echo Disabling Edge PDF...
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Edge /v DefaultDownloadDirectory /t REG_SZ /d "path\to\download\directory" /f

::Enable Dark Theme
echo.
echo Enabling Dark Theme...
REG ADD HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize /v AppsUseLightTheme /t REG_DWORD /d 0 /f

::Uninstall OneDrive
echo Uninstalling OneDrive...
PowerShell -Command "Start-Process -FilePath 'C:\Windows\SysWOW64\OneDriveSetup.exe' -ArgumentList '/uninstall' -Verb RunAs -WindowStyle Hidden" >nul 2>&1

shutdown /r /t 60 /c "Restarting your computer, so most changes can take effect"

pause
goto :menu

:admin
cls
title Terin - make Admin
NET SESSION >nul 2>&1
IF %ERRORLEVEL% NEQ 0 (
    echo The testing command requires administrator permission, Restart as administrator?
	echo Manual restarting of the test command is required!
    PAUSE
    :: Restart as administrator
    PowerShell Start-Process -Verb RunAs -FilePath "%~0"
    EXIT /B
)
echo already admin...
pause
goto :menu

:hidefile
setlocal EnableDelayedExpansion
cls
title Terin - defintly not for porn
color 0B
echo ==============================================================================================
echo.
echo ███████╗███████╗ ██████╗██████╗ ███████╗████████╗    ███████╗████████╗ █████╗ ███████╗██╗  ██╗
echo ██╔════╝██╔════╝██╔════╝██╔══██╗██╔════╝╚══██╔══╝    ██╔════╝╚══██╔══╝██╔══██╗██╔════╝██║  ██║
echo ███████╗█████╗  ██║     ██████╔╝█████╗     ██║       ███████╗   ██║   ███████║███████╗███████║
echo ╚════██║██╔══╝  ██║     ██╔══██╗██╔══╝     ██║       ╚════██║   ██║   ██╔══██║╚════██║██╔══██║
echo ███████║███████╗╚██████╗██║  ██║███████╗   ██║       ███████║   ██║   ██║  ██║███████║██║  ██║
echo ╚══════╝╚══════╝ ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝       ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
echo.
echo ==============================================================================================
echo.
echo Insert a Image file and then a Zip file to Combine...
timeout /t 3 >nul
::Use PowerShell to open file explorer dialog for image selection
for /f "delims=" %%I in ('powershell -Command "Add-Type -AssemblyName System.Windows.Forms; $dialog = New-Object System.Windows.Forms.OpenFileDialog; $dialog.Filter = 'Image Files (*.jpg;*.jpeg;*.png;*.gif)|*.jpg;*.jpeg;*.png;*.gif'; $dialog.ShowDialog() | Out-Null; $dialog.FileName"') do (
    set "image=%%I"
)

::se PowerShell to open file explorer dialog for zip file selection
for /f "delims=" %%Z in ('powershell -Command "Add-Type -AssemblyName System.Windows.Forms; $dialog = New-Object System.Windows.Forms.OpenFileDialog; $dialog.Filter = 'Zip Files (*.zip)|*.zip'; $dialog.ShowDialog() | Out-Null; $dialog.FileName"') do (
    set "zip=%%Z"
)

::Check if either file is not selected
if "%image%" == "" (
    echo No image file selected.
    exit /b
)

if "%zip%" == "" (
    echo No zip file selected.
    exit /b
)

::Combine Files
copy /b "!image!"+ "!zip!" secretpic.jpg

echo Files Combined Succesfully...
pause
goto :menu