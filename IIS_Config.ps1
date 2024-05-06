# import-module servermanager
# add-windowsfeature web-server -includeallsubfeature
# add-windowsfeature Web-Asp-Net45
# add-windowsfeature NET-Framework-Features
# Set-Content -Path "C:\inetpub\wwwroot\Default.html" -Value "This is the server $($env:computername) !"



# Install IIS
#Install-WindowsFeature -Name Web-Server -IncludeManagementTools

# Define website directory
#$websitePath = "C:\inetpub\wwwroot"

# Copy the existing index.html file to the website directory
#Copy-Item -Path "./index.html" -Destination $websitePath -Force

# Set default document to index.html
#Set-WebConfigurationProperty -Filter "/system.webServer/defaultDocument" -Name "enabled" -Value "True"
#Set-WebConfigurationProperty -Filter "/system.webServer/defaultDocument/files/add[@value='index.html']" -Name "value" -Value "index.html"

# Restart IIS
#Restart-Service -Name W3SVC


# Install IIS
Install-WindowsFeature -Name Web-Server -IncludeManagementTools

# Define website directory
$websitePath = "C:\inetpub\wwwroot"

# Copy the existing index.html file to the website directory
Copy-Item -Path "${env:TF_WORKSPACE}/index.html" -Destination $websitePath -Force

# Set default document to index.html
Set-WebConfigurationProperty -Filter "/system.webServer/defaultDocument" -Name "enabled" -Value "True"
Set-WebConfigurationProperty -Filter "/system.webServer/defaultDocument/files/add[@value='index.html']" -Name "value" -Value "index.html"

# Restart IIS
Restart-Service -Name W3SVC


#"commandToExecute": "powershell Add-WindowsFeature Web-Asp-Net45;Add-WindowsFeature NET-Framework-45-Core;Add-WindowsFeature Web-Net-Ext45;Add-WindowsFeature Web-ISAPI-Ext;Add-WindowsFeature Web-ISAPI-Filter;Add-WindowsFeature Web-Mgmt-Console;Add-WindowsFeature Web-Scripting-Tools;Add-WindowsFeature Search-Service;Add-WindowsFeature Web-Filtering;Add-WindowsFeature Web-Basic-Auth;Add-WindowsFeature Web-Windows-Auth;Add-WindowsFeature Web-Default-Doc;Add-WindowsFeature Web-Http-Errors;Add-WindowsFeature Web-Static-Content;