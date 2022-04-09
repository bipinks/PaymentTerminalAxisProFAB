@echo off
goto check_Permissions

:check_Permissions
echo Administrative permissions required. Detecting permissions...

net session >nul 2>&1
if %errorLevel% == 0 (
    echo Success: Administrative permissions confirmed.
) else (
    echo Failure: Current permissions inadequate. Exiting command prompt
    timeout /t 5
    exit
)

echo "******************AxisPro*************************"

echo "Enable Windows Features For FAB Payment Terminal Web Service"
echo "Developed By : Bipin @ Direct Axis Technology L.L.C"

set /A FEATURES_INSTALLED=0

@echo on

dism /online /get-featureinfo /featurename:NetFx3 | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "NetFx3 is not installed. We should install it."
    dism /online /enable-feature /featurename:NetFx3 /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:NetFx4-AdvSrvs | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "NetFx4-AdvSrvs is not installed. We should install it."
    dism /online /enable-feature /featurename:NetFx4-AdvSrvs /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:Containers | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "Containers is not installed. We should install it."
    dism /online /enable-feature /featurename:Containers /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-WebServerRole | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-WebServerRole is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-WebServerRole /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-WebServer | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-WebServer is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-WebServer /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-CommonHttpFeatures | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-CommonHttpFeatures is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-CommonHttpFeatures /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-HttpErrors | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-HttpErrors is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-HttpErrors /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-ApplicationDevelopment | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-ApplicationDevelopment is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-ApplicationDevelopment /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-Security | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-Security is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-Security /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-RequestFiltering | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-RequestFiltering is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-RequestFiltering /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-NetFxExtensibility | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-NetFxExtensibility is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-NetFxExtensibility /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-NetFxExtensibility45 | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-NetFxExtensibility45 is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-NetFxExtensibility45 /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-HealthAndDiagnostics | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-HealthAndDiagnostics is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-HealthAndDiagnostics /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-HttpLogging | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-HttpLogging is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-HttpLogging /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-Performance | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-Performance is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-Performance /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-WebServerManagementTools | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-WebServerManagementTools is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-WebServerManagementTools /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-ManagementScriptingTools | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-ManagementScriptingTools is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-ManagementScriptingTools /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-IIS6ManagementCompatibility | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-IIS6ManagementCompatibility is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-IIS6ManagementCompatibility /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-Metabase | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-Metabase is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-Metabase /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-HostableWebCore | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-HostableWebCore is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-HostableWebCore /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-StaticContent | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-StaticContent is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-StaticContent /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-DefaultDocument | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-DefaultDocument is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-DefaultDocument /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-DirectoryBrowsing | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-DirectoryBrowsing is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-DirectoryBrowsing /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-ApplicationInit | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-ApplicationInit is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-ApplicationInit /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-ASPNET | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-ASPNET is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-ASPNET /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-ASPNET45 | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-ASPNET45 is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-ASPNET45 /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-ASP | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-ASP is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-ASP /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-ISAPIExtensions | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-ISAPIExtensions is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-ISAPIExtensions /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-ISAPIFilter | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-ISAPIFilter is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-ISAPIFilter /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-ServerSideIncludes | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-ServerSideIncludes is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-ServerSideIncludes /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-HttpCompressionStatic | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-HttpCompressionStatic is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-HttpCompressionStatic /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-ManagementConsole | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-ManagementConsole is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-ManagementConsole /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-ManagementService | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-ManagementService is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-ManagementService /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-WMICompatibility | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-WMICompatibility is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-WMICompatibility /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-LegacyScripts | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-LegacyScripts is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-LegacyScripts /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

dism /online /get-featureinfo /featurename:IIS-LegacySnapIn | find "State : Disabled" > nul
if %ERRORLEVEL% == 0 (
echo "IIS-LegacySnapIn is not installed. We should install it."
    dism /online /enable-feature /featurename:IIS-LegacySnapIn /all /NoRestart
    set /A FEATURES_INSTALLED+=1
)

if %FEATURES_INSTALLED%==1 goto features_installed
else features_not_installed

:features_installed
echo %FEATURES_INSTALLED% Windows Features have now been configured.
@echo off
SET /P QUESTION=Reboot computer now? (Y/N):
If /I %QUESTION%==Y goto reboot
echo Will not reboot. Now exiting command prompt.
timeout /t 5
exit
:reboot
shutdown -r -t 5

:features_installed
echo No features are installed/Existed in system. Now exiting command prompt.
timeout /t 5
exit